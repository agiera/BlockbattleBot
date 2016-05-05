#include "NFQ.h"
#include "Agent.h"

NFQ::NFQ(FunctionApproximator *fa, unsigned int maxCacheSize, 
	unsigned int minCacheSize, unsigned int cacheCommitInterval, double initialValue, unsigned int epochsPerCommit)
{
	Init();
	this->fa = fa;
	this->maxCacheSize = maxCacheSize;
	this->minCacheSize = minCacheSize;
	this->onlineCacheSize = minCacheSize;
	this->initialValue = initialValue;
	this->cacheCommitInterval = cacheCommitInterval;
	this->epochsPerCommit = epochsPerCommit;
	bfa = dynamic_cast<FannBatchFA*>(fa);
}

NFQ::NFQ()
{
	Init();
}

void NFQ::Init()
{
	lastAgent = NULL;
	fakeETrace = false;
	fa = NULL;
	epochsPerCommit = 0;
	maxCacheSize = 0;
	minCacheSize = 0;
	initialValue = 0;
	onlineCacheSize = 0;
	cacheCommitInterval = 0;
	trainData = NULL;
	timeSinceCommit = 0;
	ClearStats();
}

NFQ::~NFQ()
{
	delete fa;
}

double NFQ::GetReward(const DoubleVector &observation, const DoubleVector &action)
{	
	numReads++;
	if(queue.size() < minCacheSize) //Then the cache is still being filled up and we return initialValue
		return initialValue;
	else
		return fa->GetReward(observation, action);
}

void NFQ::SetReward(const DoubleVector &observation, const DoubleVector &action, const double reward)
{
	throw runtime_error("SetReward not possible for NFQ");
}

void NFQ::EndEpisodeNFQ(Agent *agent, const DoubleVector &prevObservation, const DoubleVector &prevAction, double reward)
{
	if(fakeETrace)
	{
		double eTrace = 1;
		for(list<NFQItem>::reverse_iterator it = queue.rbegin(); it != queue.rend(); it++)
		{
			if(it->agentId == agent->agentId)
			{
				if(it->endState)
					break;
					
				if(eTrace < 0.00000001)
					break;
					
				eTrace = eTrace * agent->gamma * agent->lambda;
				
				double delta = reward - it->reward;
				it->reward += (delta * eTrace);
			}
		}
	}
	
	AddToQueue(agent, NFQItem(agent->agentId, prevObservation, prevAction, reward));
}

void NFQ::UpdateNFQ(Agent *agent, const DoubleVector &prevObservation, const DoubleVector &prevAction, double reward, const DoubleVector &observation, const vector<DoubleVector> &actions, const DoubleVector &takenAction)
{
	if(agent->sigma == 1) //for SARSA the available actions is not important
		AddToQueue(agent, NFQItem(agent->agentId, prevObservation, prevAction, reward, observation, takenAction));
	else
		AddToQueue(agent, NFQItem(agent->agentId, prevObservation, prevAction, reward, observation, actions, takenAction));
}

void NFQ::AddToQueue(Agent *agent, const NFQItem item)
{
	numQueueAdds++;
	timeSinceCommit++;
	queue.push_back(item);
	if(queue.size() > maxCacheSize)
	{
		queue.pop_front();
	}
	
	if(bfa != NULL)
	{
		//if(queue.size() < minCacheSize)
		if(false)
		{
			fa->SetReward(item.prevObservation, item.prevAction, item.reward);
			timeSinceCommit = cacheCommitInterval; //To ensure that training is performed as soon as there is data in the cache
		}
		else if(timeSinceCommit >= cacheCommitInterval)
		{
			timeSinceCommit = 0;
			for(unsigned int i = 0; i < epochsPerCommit; i++)
			{
				fann_train_data *data = GetFannTrainData(agent, onlineCacheSize);
				numCacheCommits++;
				bfa->SetRewards(data);
			}
		}
	}
	else
	{
		//function approximator is incremental
		fa->SetReward(item.prevObservation, item.prevAction, item.reward);	
	}
}

unsigned int NFQ::GetNumHiddenNeurons()
{
	return fa->GetNumHiddenNeurons();
}

double NFQ::GetMSE()
{
	return fa->GetMSE();
}

fann_train_data* NFQ::GetFannTrainData(Agent *agent, unsigned int size)
{
	if(agent == NULL)
		agent = lastAgent;
	lastAgent = agent;

	if(size == 0 || size > queue.size())
		size = queue.size();
	
// 	cout << "Training with " << size << endl;
	
	if(trainData != NULL && trainData->num_data != size)
	{
		fann_destroy_train(trainData);
		trainData = NULL;
	}
				
	if(trainData == NULL)
	{
 		trainData = fann_create_train(size,
 			queue.begin()->prevObservation.size()+queue.begin()->prevAction.size(), 1);
	}

	unsigned int i = 0;
	map<unsigned int, map<unsigned int, double> > eligibilityTraces;
	for(list<NFQItem>::iterator it = queue.begin(); i != size; it++, i++)
	{
		//fill input data
		double *fannInput = trainData->input[i];
		it->prevObservation.ExportValues(fannInput);
		double *actionFill = fannInput + it->prevObservation.size();
		it->prevAction.ExportValues(actionFill);
		
		double prevQValue = fa->GetReward(it->prevObservation, it->prevAction);
		if(it->endState)
		{
			eligibilityTraces[agent->agentId][i] = 1;
			trainData->output[i][0] = prevQValue;
			double delta = it->reward - prevQValue;
			UpdateETrace(agent, eligibilityTraces[agent->agentId], delta*agent->alpha);
			eligibilityTraces[agent->agentId].clear();
		}
		else
		{
			//Calculate output data according to NFQ and Q-SARSA			
			double predictedReward = 0;
			double predictedGreedyReward = 0;
			
			if(agent->sigma != 1)
			{
				vector<double> actionValues(it->actions.size());
				unsigned int greedyAction = agent->GreedyAction(it->observation, it->actions, actionValues);
				predictedGreedyReward = actionValues[greedyAction];
				
				if(it->actions[greedyAction] == it->takenAction)
					predictedReward = predictedGreedyReward;
				else
					predictedReward = fa->GetReward(it->observation, it->takenAction); //TODO could be done faster with a index
			}
			else
			{
				predictedReward = fa->GetReward(it->observation, it->takenAction);
			}
			
			double delta = (it->reward + agent->gamma*((1.0 - agent->sigma)*predictedGreedyReward + agent->sigma*predictedReward) - prevQValue);
			
			eligibilityTraces[agent->agentId][i] = 1;
			trainData->output[i][0] = prevQValue;
			UpdateETrace(agent, eligibilityTraces[agent->agentId], delta*agent->alpha);
						
//  			trainData->output[i][0] = prevQValue + (delta*agent->alpha);

			//The original NFQ
			//trainData->output[i][0] = it->reward + agent->gamma*predictedGreedyReward;

		}
	}
	
	return trainData;
}

void NFQ::UpdateETrace(Agent *agent, map<unsigned int, double> &eligibilityTraces, double delta)
{
	//Update Q values and eligibility traces
	for(map<unsigned int, double>::iterator it = eligibilityTraces.begin();
		it != eligibilityTraces.end();)
	{
		double eTrace = it->second;
		unsigned int idx = it->first;
		double value = trainData->output[idx][0];
		trainData->output[idx][0] = value + (eTrace * delta);
		eTrace = agent->gamma * agent->lambda * eTrace;
		
		if(eTrace < 0.00000001)//Then it is zero and should be deleted
		{
			map<unsigned int, double>::iterator toBeErased = it;
 			it++;
 			eligibilityTraces.erase(toBeErased);
 		}
 		else
 		{
 			it->second = eTrace;
 			it++;
 		}
	}
	
	if(fakeETrace)
	{
		//Then the ordinary eTrace is not needed, and we simply clear the eTrace each time simulating that there is no eTrace
		eligibilityTraces.clear();
	}
}


void NFQ::PrintStats()
{
	cout << endl << "NFQ" << endl
		<< "curCacheSize  : " << queue.size() << endl
		<< "numCacheCommit: " << numCacheCommits << endl
		<< "numQueueAdds  : " << numQueueAdds << endl
		<< "numReads      : " << numReads << endl;
	
	fa->PrintStats();
}

void NFQ::ClearStats()
{
	numCacheCommits = 0;
	numQueueAdds = 0;
	numReads = 0;
	
	if(fa != NULL)
		fa->ClearStats();
}
