#ifndef NFQ_H
#define NFQ_H

using namespace std;

#include "FunctionApproximator.h"
#include "FannBatchFA.h"
#include "TabularFA.h"
#include "FannFA.h"
#include "FannBatchFA.h"
#include "FannCascadeFA.h"
#include "doublefann.h"
#include <list>

class Agent;

class NFQItem
{
public:
 	NFQItem(unsigned int agentId, const DoubleVector &prevObservation, const DoubleVector &prevAction, double reward, const DoubleVector &observation, const vector<DoubleVector> &actions, const DoubleVector &takenAction)
 	: agentId(agentId),
 	  prevObservation(prevObservation), 
 	  prevAction(prevAction), 
 	  reward(reward), 
 	  observation(observation),
 	  actions(actions), 
 	  takenAction(takenAction),
 	  endState(false){}
 	  
 	NFQItem(unsigned int agentId, const DoubleVector &prevObservation, const DoubleVector &prevAction, double reward, const DoubleVector &observation, const DoubleVector &takenAction)
 	: agentId(agentId),
 	  prevObservation(prevObservation), 
 	  prevAction(prevAction), 
 	  reward(reward), 
 	  observation(observation),
 	  takenAction(takenAction),
 	  endState(false){}
 	  
 	NFQItem(unsigned int agentId, const DoubleVector &prevObservation, const DoubleVector &prevAction, double reward)
 	: agentId(agentId),
 	  prevObservation(prevObservation), 
 	  prevAction(prevAction), 
 	  reward(reward),
 	  endState(true){}
 	  
 	 NFQItem(){};
 	  
	template<class Archive>
	void serialize(Archive &ar, const unsigned int version)
	{
		ar & agentId;
		ar & prevObservation;
		ar & prevAction;
		ar & reward;
		ar & observation;
		ar & actions;
		ar & takenAction;
		ar & endState;
	}
	
	unsigned int agentId;
	DoubleVector prevObservation;
	DoubleVector prevAction;
	double reward;
	DoubleVector observation;
	vector<DoubleVector> actions;
	DoubleVector takenAction;
	bool endState;
};

class NFQ : public FunctionApproximator
{
public:
	NFQ(FunctionApproximator *fa, unsigned int maxCacheSize, 
		unsigned int minCacheSize, unsigned int cacheCommitInterval, double initialValue, unsigned int epochsPerCommit);
	void Init();
    NFQ();
    ~NFQ();
    void EndEpisodeNFQ(Agent *agent, const DoubleVector &observation, const DoubleVector &action, double reward);
	void UpdateNFQ(Agent *agent, const DoubleVector &observation, const DoubleVector &action, double reward, const DoubleVector &observation, const vector<DoubleVector> &actions, const DoubleVector &takenAction);
	double GetReward(const DoubleVector &observation, const DoubleVector &action);
	void SetReward(const DoubleVector &observation, const DoubleVector &action, const double reward);
	fann_train_data* GetFannTrainData(Agent *agent = NULL, unsigned int size = 0);

	unsigned int GetNumHiddenNeurons();
	double GetMSE();
	void PrintStats();
	void ClearStats();
	
	list<NFQItem> queue;
	
	template<class Archive>
	void serialize(Archive &ar, const unsigned int version)
	{
		ar & boost::serialization::base_object<FunctionApproximator>(*this);
		
 		ar & queue;
		
        ar.register_type(static_cast<TabularFA *>(NULL));
        ar.register_type(static_cast<FannFA *>(NULL));
        ar.register_type(static_cast<FannBatchFA *>(NULL));
        ar.register_type(static_cast<FannCascadeFA *>(NULL));
		ar & fa;
		ar & maxCacheSize;
		ar & minCacheSize;
		ar & initialValue;
		
		ar & cacheCommitInterval;
		ar & timeSinceCommit;
		ar & epochsPerCommit;
		ar & fakeETrace;
		bfa = dynamic_cast<FannBatchFA*>(fa);		
	}
	
	bool fakeETrace;
private:
	void AddToQueue(Agent *agent, const NFQItem item);
	void UpdateETrace(Agent *agent, map<unsigned int, double> &eligibilityTraces, double delta);
	
	Agent *lastAgent;
	FunctionApproximator *fa;
	unsigned int maxCacheSize;
	unsigned int minCacheSize;
	unsigned int onlineCacheSize;
	double initialValue;
 	FannBatchFA *bfa;
 	fann_train_data* trainData;
    
 	unsigned int cacheCommitInterval;
 	unsigned int epochsPerCommit;
 	unsigned int timeSinceCommit;
 	
 	unsigned int numCacheCommits;
	unsigned int numQueueAdds;
	unsigned int numReads;
};

#endif
