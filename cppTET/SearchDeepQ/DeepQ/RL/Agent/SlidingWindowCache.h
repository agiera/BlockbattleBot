#ifndef _SLIDINGWINDOWCACHE_H_
#define _SLIDINGWINDOWCACHE_H_

using namespace std;

#include "doublefann.h"
#include "FunctionApproximator.h"
#include "FannBatchFA.h"
#include "TabularFA.h"
#include "FannFA.h"
#include "FannBatchFA.h"
#include "FannCascadeFA.h"
#include <map>
#include <list>
#include <stdexcept>
#include <boost/archive/text_iarchive.hpp>
#include <boost/archive/text_oarchive.hpp>
#include <boost/serialization/base_object.hpp>
#include <boost/serialization/utility.hpp>
#include <boost/serialization/map.hpp>
#include <boost/serialization/list.hpp>

class SlidingWindowCache : public FunctionApproximator
{
public:
	SlidingWindowCache(FunctionApproximator *fa, unsigned int maxCacheSize, 
		unsigned int minCacheSize, unsigned int cacheCommitInterval, double initialValue, unsigned int epochsPerCommit);
	SlidingWindowCache();
	void Init();
	~SlidingWindowCache();
	double GetReward(const DoubleVector &observation, const DoubleVector &action);
	void SetReward(const DoubleVector &observation, const DoubleVector &action, const double reward);
	void UpdateReward(const DoubleVector &observation, const DoubleVector &action, 
		const double reward);
	fann_train_data* GetFannTrainData(unsigned int size = 0);

	unsigned int GetNumHiddenNeurons();
	double GetMSE();
	void PrintStats();
	void ClearStats();
private:
	void AddToQueue(map<pair<DoubleVector, DoubleVector>, pair<double, int> >::iterator it);
	void AddToCache(const DoubleVector &observation, const DoubleVector &action, const double reward);
	
	map<pair<DoubleVector, DoubleVector>, pair<double, int> > table;
	list<map<pair<DoubleVector, DoubleVector>, pair<double, int> >::iterator> queue;
	FunctionApproximator *fa;
	unsigned int maxCacheSize;
	unsigned int minCacheSize;
	unsigned int onlineCacheSize;
	double initialValue;
	unsigned int currentCacheSize;
 	FannBatchFA *bfa;
 	fann_train_data* trainData;
 	unsigned int cacheCommitInterval;
 	unsigned int epochsPerCommit;
 	unsigned int timeSinceCommit;

	unsigned int numCacheMisses;
	unsigned int numCacheHits;
	unsigned int numCacheWrites;
	unsigned int numCacheCommits;
	unsigned int numCacheUpdates;
	unsigned int numQueueAdds;
	
public:
	template<class Archive>
	void serialize(Archive &ar, const unsigned int version)
	{
		ar & boost::serialization::base_object<FunctionApproximator>(*this);
		ar & table;
		
        ar.register_type(static_cast<TabularFA *>(NULL));
        ar.register_type(static_cast<SlidingWindowCache *>(NULL));
        ar.register_type(static_cast<FannFA *>(NULL));
        ar.register_type(static_cast<FannBatchFA *>(NULL));
        ar.register_type(static_cast<FannCascadeFA *>(NULL));
		ar & fa;
		ar & maxCacheSize;
		ar & minCacheSize;
		ar & initialValue;
		ar & currentCacheSize;
		//ar & trainData;
		ar & cacheCommitInterval;
		ar & timeSinceCommit;
		ar & epochsPerCommit;
		bfa = dynamic_cast<FannBatchFA*>(fa);		
		
		boost::serialization::split_member(ar, *this, version);
	}
	
	//Only used to save/load queue, since it cannot be saved and loaded directly
	template<class Archive>
    void save(Archive & ar, const unsigned int version) const
    {
    	list<pair<DoubleVector, DoubleVector> > listToSave;
    
    	for(list<map<pair<DoubleVector, DoubleVector>, pair<double, int> >::iterator>::const_iterator it = queue.begin();
    		it != queue.end(); it++)
    	{
    		listToSave.push_back((*it)->first);
    	}
    	ar & listToSave;
    }
    
    template<class Archive>
    void load(Archive & ar, const unsigned int version)
    {
    	list<pair<DoubleVector, DoubleVector> > listToLoad;
       	ar & listToLoad;
    
    	queue.clear();
    	for(list<pair<DoubleVector, DoubleVector> >::iterator it = listToLoad.begin();
    		it != listToLoad.end(); it++)
    	{
    		map<pair<DoubleVector, DoubleVector>, pair<double, int> >::iterator found = table.find(*it);
    		if(found != table.end())
    			queue.push_back(found);
    		else
    			throw runtime_error("unable to load SlidingWindowCache queue");
    	}
    }
};

#endif
