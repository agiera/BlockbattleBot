#include "C_agent_parser.h"
#include "Agent.h"
#include <math.h>
#include <iostream>
#include "RL_Interface.h"
#include "Benchmark.h"

Agent *agent[2] = {NULL,NULL};

Agent::Agent(FunctionApproximator *q)
{	
	Init();	
	Q = q;
	if(dynamic_cast<NFQ*>(Q) != NULL)
		useNFQ = true;
}

Agent::Agent()
{
	Init();	
}

void Agent::Init()
{
	selectionStrategy = SelectEGreedy;
	alpha = 0.1/14.0;
	alphaAnnealFactor = 1;
	epsilon = 0.1;
	epsilonAnnealFactor = 1;
	gamma = 1;
	sigma = 0.7;
 	lambda = 0.9;
 	boltzmannTemp = 1;
 	boltzmannTempAnnealFactor = 1;
 	useRehearsing = false;
 	useTabuSearch = false;
 	tabuSize = 10;
	agentId = 0;
	extraGoalTraining = 0;
	reportEpisodes = 0;
	 	
 	episodes = 0;
 	episodeReward = 0;
 	totalSteps = 0;
 	steps = 0;
 	totalReward = 0;
 	explorativeSteps = 0;
 	totalExplorativeSteps = 0;
	srand(9999);
	gettimeofday(&startTime, NULL);
	Q = NULL;
	isStarted = false;
	useNFQ = false;
 	ClearStats();
}

Agent::~Agent()
{
	//delete Q;
}

DoubleVector Agent::StartEpisode(const DoubleVector &observation, const vector<DoubleVector> &actions)
{
	if(isStarted && episodes!=0)
	{
		//The last episode was aborted, so we need to start a new one
		InternalEndEpisode(0);
	}
	
	//Choose and return the agent's first action
	isStarted = true;
	episodes++;
	Benchmark::Instance()->StartEpisode(this);	
	
	eligibilityTraces.clear();
	prevObservation = observation;
	
	vector<double> actionValues(actions.size());
 	unsigned int greedyAction = GreedyAction(observation, actions, actionValues);
	unsigned int actionIndex = SelectAction(observation, actions[greedyAction], actions, actionValues);
	
	prevAction = actions[actionIndex];
	return prevAction;
}

DoubleVector Agent::Step(double reward, const DoubleVector &observation, const vector<DoubleVector> &actions)
{
	//Update one step, return agent's action
	steps++;
	episodeReward += reward;
	Benchmark::Instance()->Step(this, reward);	
	
	//Select the action
	vector<double> actionValues(actions.size());
 	unsigned int greedyAction = GreedyAction(observation, actions, actionValues);
	
	if(selectionStrategy == SelectGreedy)
		return actions[greedyAction]; //no updating done when greedy
	
	unsigned int actionIndex = SelectAction(observation, actions[greedyAction], actions, actionValues);
	
	if(useNFQ)
	{
		UpdateNFQ(prevObservation, prevAction, reward, observation, actions, actions[actionIndex]);
	}
	else
	{	
		//Q-SARSA update rule
		double prevQValue = Q->GetReward(prevObservation, prevAction);
		double predictedReward = actionValues[actionIndex];
		double predictedGreedyReward = actionValues[greedyAction];
		double delta = 0;
		if(greedyAction == actionIndex)
		{
			delta = (reward + gamma*predictedGreedyReward - prevQValue);
		}
		else
		{
			delta = (reward + gamma*((1.0 - sigma)*predictedGreedyReward + sigma*predictedReward) - prevQValue);
		}		
		
	//  	cout << "step: " << steps << "delta = " << delta << endl;
		
		deltaSum += delta;
		absDeltaSum += fabs(delta);
		predictedRewardSum += predictedReward;
		
		//Replace the eligibility trace for the current observation
		if(observation.size() != 0) //do not replace for after-state
			eligibilityTraces[observation].clear();
		eligibilityTraces[prevObservation][prevAction] = 1;
		
		UpdateETrace(delta*alpha);
	}
	prevObservation = observation;
	prevAction = actions[actionIndex];

	return prevAction;
}

void Agent::UpdateETrace(double delta)
{
	//Update Q values and eligibility traces
	for(map<DoubleVector, map<DoubleVector, double> >::iterator oIt = eligibilityTraces.begin();
		oIt != eligibilityTraces.end();)
	{
		const DoubleVector &o = oIt->first;
		for(map<DoubleVector, double>::iterator aIt = oIt->second.begin();
			aIt != oIt->second.end(); )
		{
			const DoubleVector &a = aIt->first;
			double eTrace = aIt->second;
 			if(eTrace == 1) //This is the last reward
  				Q->AddToReward(o, a, eTrace * delta);
  			else
  				Q->UpdateAddToReward(o, a, eTrace * delta);
 			eTrace = gamma * lambda * eTrace;
 			 
 			if(eTrace < 0.00000001)//Then it is zero and should be deleted
 			{
 				map<DoubleVector, double>::iterator toBeErased = aIt;
 				aIt++;
 				oIt->second.erase(toBeErased);
 			}
 			else
 			{
 				aIt->second = eTrace;
 				aIt++;
 			}
		}
		
		if(oIt->second.empty()) 
		{
			//If there are no more actions for the state in the e-trace, erase the state from the e-trace
			map<DoubleVector, map<DoubleVector, double> >::iterator toBeErased = oIt;
			oIt++;
			eligibilityTraces.erase(toBeErased);
		}
		else
		{
			oIt++;
		}
	}
}

void Agent::EndEpisode(double reward)
{
	episodeReward += reward;
	
	if(selectionStrategy != SelectGreedy)
	{
		if(useNFQ)
		{
			EndEpisodeNFQ(prevObservation, prevAction, reward);
		}
		else
		{
			//Update last step of current episode
			double prevQValue = Q->GetReward(prevObservation, prevAction);
			double delta = (reward - prevQValue);
			deltaSum += delta;
			absDeltaSum += fabs(delta);
					
			eligibilityTraces[prevObservation][prevAction] = 1;
			
			UpdateETrace(delta*alpha);
			
			if(extraGoalTraining != 0)
			{
				cout << extraGoalTraining << " extra Q->SetReward(" << prevObservation << ", " << prevAction << ", " << reward << "); after " << steps << " steps." << endl;
			
				for(unsigned int i = 0; i < extraGoalTraining; i++)
				{
					Q->SetReward(prevObservation, prevAction, reward);
				}
			}
		}
			
		//Anneal parameters
		alpha *= alphaAnnealFactor;
		epsilon *= epsilonAnnealFactor;
		boltzmannTemp *= boltzmannTempAnnealFactor;
	}
	
	InternalEndEpisode(reward);
}

void Agent::EndRun()
{
	if(isStarted)
		InternalEndEpisode(0);
}

void Agent::InternalEndEpisode(double reward)
{
	isStarted = false;
	Benchmark::Instance()->EndEpisode(this, reward);
	if(Benchmark::Instance()->verbose)
	{
		PrintStats(reward);
		Q->PrintStats();
	}
	ClearStats();
	Q->ClearStats();
	
	if(reportEpisodes != 0 && episodes != 0 && episodes % 1000 == 0)
	{
		char buf[100];
		sprintf(buf, "agent_0_%010d.txt", episodes);
		string file = Benchmark::Instance()->GetOutputDir() + buf;
 		SaveAgent(*this, file.c_str());
	}	
}

unsigned int Agent::SelectAction(const DoubleVector &observation, const DoubleVector &greedyAction, 
	const vector<DoubleVector> &actions, const vector<double> &actionValues)
{
	vector<DoubleVector> availableActions;
	vector<double> availableActionValues;
	if(useTabuSearch)
	{
		for(unsigned int i = 0; i < actions.size(); i++)
		{
			if(find(tabuQueue.begin(), tabuQueue.end(), 
				    pair<DoubleVector, DoubleVector>(observation, actions[i])) == tabuQueue.end())
			{
				//not in tabu queue
				availableActions.push_back(actions[i]);
				availableActionValues.push_back(actionValues[i]);
			}
		}
		
		if(availableActions.empty())
		{
			//all actions are tabu, simply select among all of them
			availableActions = actions;
			availableActionValues = actionValues;
		}
	}
	else
	{
		availableActions = actions;
		availableActionValues = actionValues;
	}
	
	DoubleVector selectedAction = greedyAction;
	
	switch(selectionStrategy)
	{
		case SelectGreedy:
			//no need to do this selectedAction = greedyAction;
			break;
		case SelectEGreedy:
			selectedAction = SelectActionEGreedy(greedyAction, availableActions);
			break;
		case SelectMaxBoltzmann:
			selectedAction = SelectActionMaxBoltzmann(greedyAction, availableActions, availableActionValues);
			break;
		default:
			selectedAction = SelectActionEGreedy(greedyAction, availableActions);
			break;
	}
	
	if(selectedAction != greedyAction)
	{
		explorativeSteps++;
		if(useTabuSearch)
		{
			tabuQueue.push_front(pair<DoubleVector, DoubleVector>(observation, selectedAction));
			
			if(tabuQueue.size() > tabuSize)
			{
				//tabu queue full, removing element
				tabuQueue.pop_back();
			}
		}
	}
	
	//Just to return a index
	unsigned selectedIndex = 0;
	for(unsigned int i = 0; i < actions.size(); i++)
	{
		if(selectedAction == actions[i])
		{
			selectedIndex = i;
			break;
		}
	}
	
	return selectedIndex;
}

DoubleVector Agent::SelectActionEGreedy(const DoubleVector &greedyAction, const vector<DoubleVector> &actions)
{
	//chooses action epsilon-greedily
	double ran = rand()/static_cast<double>(RAND_MAX);
	if( ran > epsilon ) 
		return greedyAction;
	else //just a random action
		return actions[(unsigned int) (actions.size() * (rand() / (RAND_MAX + 1.0)))];
}

DoubleVector Agent::SelectActionMaxBoltzmann(const DoubleVector &greedyAction, 
	const vector<DoubleVector> &actions, const vector<double> &actionValues)
{
	//chooses action epsilon-greedily and boltzmann for the rest
	double ran = rand()/static_cast<double>(RAND_MAX);
	if( ran > epsilon )
		return greedyAction;
	else
	{
		//First calculate the boltzmann values
		double boltzmannSum = 0;
		vector<double> boltzmannValues(actions.size());
		for(unsigned int i = 0; i < actions.size(); i++)
		{
			double boltzmannValue = exp(actionValues[i]/boltzmannTemp);
			boltzmannValues[i] = boltzmannValue;
			boltzmannSum += boltzmannValue;
		}
		
		//Then select according to the boltzman selection
		double boltzmannValueToSelect = (rand()/static_cast<double>(RAND_MAX))*boltzmannSum;
		double cummulativeBoltzmannValue = 0;
		for(unsigned int i = 0; i < boltzmannValues.size(); i++)
		{
			cummulativeBoltzmannValue += boltzmannValues[i];
			if(cummulativeBoltzmannValue >= boltzmannValueToSelect)
			{
				return actions[i];
			}
		}
		//If for some reason (rounding error) the bolzmann selection did not select an action select a random action
		return actions[(unsigned int) (actions.size() * (rand() / (RAND_MAX + 1.0)))];
	}	
}

unsigned int Agent::GreedyAction(const DoubleVector &observation, const vector<DoubleVector> &actions, 
	vector<double> &actionValues)
{
	//find the index of the maximal action, break ties randomly
	int numBests = 1;      
    unsigned int bestIndex = 0;
	double bestValue = Q->GetReward(observation, actions[bestIndex]);
	actionValues[bestIndex] = bestValue;
	
	if(useRehearsing && selectionStrategy != SelectGreedy)
		Q->SetReward(observation, actions[bestIndex], bestValue);//rehearsing

	for(unsigned int i = 1; i < actions.size(); i++)
	{
        double value = Q->GetReward(observation, actions[i]);
        actionValues[i] = value;
        
		if(useRehearsing && selectionStrategy != SelectGreedy)
    	    Q->SetReward(observation, actions[i], value);//rehearsing
        
        if( value > bestValue )
        {
            bestValue = value;
            bestIndex = i;
            numBests = 1;
        } 
        else if (value == bestValue) 
        {
            numBests = numBests + 1;
            if( (int)(rand() % numBests) == 0 )
                bestIndex = i;
        }
	}
	
	return bestIndex;
}

unsigned int* Agent::GreedykActions(const DoubleVector &observation, const vector<DoubleVector> &actions, 
	vector<double> &actionValues)
{
	//find the index of the maximal action, break ties randomly
	int numBests = 1;      
    unsigned int bestIndex = 0;
	double bestValue = Q->GetReward(observation, actions[bestIndex]);
	actionValues[bestIndex] = bestValue;
	
	if(useRehearsing && selectionStrategy != SelectGreedy)
		Q->SetReward(observation, actions[bestIndex], bestValue);//rehearsing

	for(unsigned int i = 1; i < actions.size(); i++)
	{
        double value = Q->GetReward(observation, actions[i]);
        actionValues[i] = value;
        
		if(useRehearsing && selectionStrategy != SelectGreedy)
    	    Q->SetReward(observation, actions[i], value);//rehearsing
        
        if( value > bestValue )
        {
            bestValue = value;
            bestIndex = i;
            numBests = 1;
        } 
        else if (value == bestValue) 
        {
            numBests = numBests + 1;
            if( (int)(rand() % numBests) == 0 )
                bestIndex = i;
        }
	}
	
	return first_k_actions(actions, actionValues, k); // returns indexes of best k
}

void Agent::UpdateNFQ(const DoubleVector &prevObservation, const DoubleVector &prevAction, double reward, const DoubleVector &observation, const vector<DoubleVector> &actions, const DoubleVector &takenAction)
{
	NFQ *nfq = dynamic_cast<NFQ*>(Q);
	nfq->UpdateNFQ(this, prevObservation, prevAction, reward, observation, actions, takenAction);
}

void Agent::EndEpisodeNFQ(const DoubleVector &prevObservation, const DoubleVector &prevAction, double reward)
{
	NFQ *nfq = dynamic_cast<NFQ*>(Q);
	nfq->EndEpisodeNFQ(this, prevObservation, prevAction, reward);
}

void Agent::PrintStats(double reward)
{
	unsigned int eLength = 0;
	for(map<DoubleVector, map<DoubleVector, double> >::iterator oIt = eligibilityTraces.begin();
		oIt != eligibilityTraces.end(); oIt++)
	{
		for(map<DoubleVector, double>::iterator aIt = oIt->second.begin();
			aIt != oIt->second.end(); aIt++)
		{
			eLength++;
		}
	}
	
	timeval endTime;
	gettimeofday(&endTime, NULL);
	
	cout << endl << endl << "Agent" << endl
 		<< "numEpisodes   : " << episodes << endl
		<< "timeSinceClear: " << ((double)(endTime.tv_sec - clearTime.tv_sec) 
			+ (double)(endTime.tv_usec - clearTime.tv_usec)/(1000000.0)) << endl
		<< "timeSinceStart: " << ((double)(endTime.tv_sec - startTime.tv_sec) 
			+ (double)(endTime.tv_usec - startTime.tv_usec)/(1000000.0)) << endl
		<< "endReward     : " << reward << endl
 		<< "episodeReward : " << episodeReward << endl
 		<< "numSteps      : " << steps << endl
		<< "expSteps      : " << explorativeSteps << endl
		<< "totalSteps    : " << totalSteps << endl
		<< "totalExpSteps : " << totalExplorativeSteps << endl
 		<< "averageReward : " << episodeReward/steps << endl
 		<< "avgPredictRew : " << predictedRewardSum/steps << endl
 		<< "totalReward   : " << (totalReward+episodeReward) << endl
 		<< "averageDelta  : " << (deltaSum/steps) << endl
 		<< "absAvgDelta   : " << (absDeltaSum/steps) << endl
		<< "eLength       : " << eLength << endl
		<< "tabuLength    : " << tabuQueue.size() << endl		
		<< "alpha         : " << alpha << endl
		<< "epsilon       : " << epsilon << endl
		<< "boltzmannTemp : " << boltzmannTemp << endl;
}

void Agent::ClearStats()
{
	gettimeofday(&clearTime, NULL);
	deltaSum = 0;
	absDeltaSum = 0;
 	totalReward += episodeReward;
 	episodeReward = 0;
	totalSteps += steps;
	steps = 0;
	predictedRewardSum = 0;
	totalExplorativeSteps += explorativeSteps;
	explorativeSteps = 0;
}

void SaveAgent(const Agent &a, const char * filename)
{
    std::ofstream ofs(filename);
    boost::archive::text_oarchive oa(ofs);
    oa << a;
}

void LoadAgent(Agent &a, const char * filename)
{
    std::ifstream ifs(filename);
    boost::archive::text_iarchive ia(ifs);
    ia >> a;
}
