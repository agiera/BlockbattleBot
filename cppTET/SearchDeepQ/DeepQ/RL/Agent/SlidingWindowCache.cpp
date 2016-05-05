#include "SlidingWindowCache.h"	
#include <iostream>	
#include <stdexcept>	
	
SlidingWindowCache::SlidingWindowCache(FunctionApproximator *fa, unsigned int maxCacheSize, 
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
	
SlidingWindowCache::SlidingWindowCache()
{
	Init();
}

void SlidingWindowCache::Init()
{
	fa = NULL;
	epochsPerCommit = 0;
	maxCacheSize = 0;
	minCacheSize = 0;
	onlineCacheSize = 0;
	initialValue = 0;
	cacheCommitInterval = 0;
	currentCacheSize = 0;
	trainData = NULL;
	timeSinceCommit = 0;
	ClearStats();
}
	
SlidingWindowCache::~SlidingWindowCache()
{
	delete fa;	
}
	
double SlidingWindowCache::GetReward(const DoubleVector &observation, const DoubleVector &action)
{	
	map<pair<DoubleVector, DoubleVector>, pair<double, int> >::iterator it = table.end();
	
	it = table.find(pair<DoubleVector, DoubleVector>(observation, action));
	
	if(it == table.end())
	{
		numCacheMisses++;
		//Not in cache
		if(currentCacheSize < minCacheSize) //Then the cache is still being filled up and we return initialValue
			return initialValue;
		else
			return fa->GetReward(observation, action);
	}
	else
	{
		numCacheHits++;
		//In cache
		return it->second.first;
	}
}

void SlidingWindowCache::SetReward(const DoubleVector &observation, const DoubleVector &action, 
	const double reward)
{
	map<pair<DoubleVector, DoubleVector>, pair<double, int> >::iterator it = table.end();
	
	it = table.find(pair<DoubleVector, DoubleVector>(observation, action));
		
	if(it == table.end())
	{
		//Not in cache
		AddToCache(observation, action, reward);
		it = table.find(pair<DoubleVector, DoubleVector>(observation, action));
	}
	else
	{
		it->second.first = reward;
	}
	
	AddToQueue(it);
	timeSinceCommit++;
	numCacheWrites++;
	
	if(bfa != NULL)
	{
		if(currentCacheSize < minCacheSize)
		{
			fa->SetReward(observation, action, reward);
			timeSinceCommit = cacheCommitInterval; //To ensure that training is performed as soon as there is data in the cache
		}
		else if(timeSinceCommit >= cacheCommitInterval)
		{
			timeSinceCommit = 0;
			for(unsigned int i = 0; i < epochsPerCommit; i++)
			{
				numCacheCommits++;
				bfa->SetRewards(GetFannTrainData(onlineCacheSize));
			}
		}
	}
	else
	{
		//function approximator is incremental
		fa->SetReward(observation, action, reward);	
	}

//  	cout << "cache size [" << currentCacheSize << ", " << table.size() << "]" << endl;
}

//Used to update/add rewards to cache, that should not be trained on
void SlidingWindowCache::UpdateReward(const DoubleVector &observation, const DoubleVector &action, 
	const double reward)
{
	numCacheUpdates++;
	
	map<pair<DoubleVector, DoubleVector>, pair<double, int> >::iterator it 
		= table.find(pair<DoubleVector, DoubleVector>(observation, action));
		
	if(it == table.end())
	{
		AddToCache(observation, action, reward);
		AddToQueue(table.find(pair<DoubleVector, DoubleVector>(observation, action)));
	}
	else
	{
		it->second.first = reward;
	}
}

void SlidingWindowCache::AddToCache(const DoubleVector &observation, const DoubleVector &action, 
	const double reward)
{
	//may only be called when the value is not in the cache
	table[pair<DoubleVector, DoubleVector>(observation, action)] = pair<double, int>(reward, 0);
}

void SlidingWindowCache::AddToQueue(map<pair<DoubleVector, DoubleVector>, pair<double, int> >::iterator it)
{
	it->second.second++; //add one to the counter
	queue.push_front(it);
	currentCacheSize++;
	numQueueAdds++;	
	
	if(currentCacheSize > maxCacheSize)
	{
		//Then we should remove one element from the back
		map<pair<DoubleVector, DoubleVector>, pair<double, int> >::iterator rem = queue.back();
		rem->second.second--;//delete one from the counter
		if(rem->second.second == 0)
		{
			//Then also remove from table
			table.erase(rem);		
		}
		queue.pop_back();
		currentCacheSize--;
	}
}
/*
fann_train_data* SlidingWindowCache::GetFannTrainData(unsigned int size)
{
	if(trainData != NULL && trainData->num_data != currentCacheSize)
	{
		fann_destroy_train(trainData);
		trainData = NULL;
	}
				
	if(trainData == NULL)
	{
		trainData = fann_create_train(currentCacheSize,
			table.begin()->first.first.size()+table.begin()->first.second.size(), 1);
	}

	int j = 0;
	for(map<pair<DoubleVector, DoubleVector>, pair<double, int> >::iterator it = table.begin();
		it != table.end(); it++)
	{
		int count = it->second.second;
		double reward = it->second.first;
		const DoubleVector &observation = it->first.first;
		const DoubleVector &action = it->first.second;
		for(int i = 0; i < count; i++)
		{
			//fill input data
			double *fannInput = trainData->input[j];
			observation.ExportValues(fannInput);
			double *actionFill = fannInput + observation.size();
			action.ExportValues(actionFill);
			
			trainData->output[j][0] = reward;
			j++;
		}
	}
	
	return trainData;
}
*/

fann_train_data* SlidingWindowCache::GetFannTrainData(unsigned int size)
{
//  	cout << "size " << size << " currentCacheSize " << currentCacheSize << endl;
	if(size > currentCacheSize || size == 0)
		size = currentCacheSize;
	
	if(trainData != NULL && trainData->num_data != size)
	{
		fann_destroy_train(trainData);
		trainData = NULL;
	}
				
	if(trainData == NULL)
	{
		trainData = fann_create_train(size,
			table.begin()->first.first.size()+table.begin()->first.second.size(), 1);
	}

				
	list<map<pair<DoubleVector, DoubleVector>, pair<double, int> >::iterator>::iterator it = queue.begin();
	for(unsigned int j = 0; j != size; j++, it++)
	{
		double reward = (*it)->second.first;
		const DoubleVector &observation = (*it)->first.first;
		const DoubleVector &action = (*it)->first.second;
//  		cout << "observation " << observation << " action " << action << " reward " << reward << endl;
			
		double *fannInput = trainData->input[j];
		observation.ExportValues(fannInput);
		double *actionFill = fannInput + observation.size();
		action.ExportValues(actionFill);
			
		trainData->output[j][0] = reward;
	}
	
	return trainData;
}

unsigned int SlidingWindowCache::GetNumHiddenNeurons()
{
	return fa->GetNumHiddenNeurons();
}

double SlidingWindowCache::GetMSE()
{
	return fa->GetMSE();
}

void SlidingWindowCache::PrintStats()
{
	cout << endl << "SlidingWindowCache" << endl
		<< "curCacheSize:   " << currentCacheSize << endl
		<< "numCacheWrites: " << numCacheWrites << endl
		<< "numCacheUpdate: " << numCacheUpdates << endl
		<< "numQueueAdds:   " << numQueueAdds << endl
		<< "numCacheCommit: " << numCacheCommits << endl
		<< "numCacheMisses: " << numCacheMisses << endl
		<< "numCacheHits:   " << numCacheHits << endl
		<< "numCacheReads:  " << numCacheHits+numCacheMisses << endl;
	
	fa->PrintStats();
}

void SlidingWindowCache::ClearStats()
{
	numCacheMisses = 0;
	numCacheHits = 0;
	numCacheWrites = 0;
	numCacheCommits = 0;
	numCacheUpdates = 0;
	numQueueAdds = 0;
	
	if(fa != NULL)
		fa->ClearStats();
}
