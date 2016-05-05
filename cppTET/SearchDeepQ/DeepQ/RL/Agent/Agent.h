#ifndef _AGENT_H_
#define _AGENT_H_

#include "FunctionApproximator.h"
#include "SlidingWindowCache.h"
#include "TabularFA.h"
#include "FannFA.h"
#include "FannBatchFA.h"
#include "FannCascadeFA.h"
#include "NFQ.h"
#include <map>
#include <deque>
#include <time.h>
#include <sys/time.h>
#include <boost/archive/text_oarchive.hpp>
#include <boost/archive/text_iarchive.hpp>
#include <fstream>

// -------- Required code -------------
#include "RLcommon.h"
// ------------------------------------

class Agent
{
public:
	enum SelectionStrategy
	{
		SelectGreedy = 0, //only follows the greedy policy, does not update it
		SelectEGreedy,
		SelectMaxBoltzmann
	};

	Agent(FunctionApproximator *q);
	Agent();
	void Init();
	~Agent();
	DoubleVector StartEpisode(const DoubleVector &observation, const vector<DoubleVector> &actions);
	DoubleVector Step(double reward, const DoubleVector &observation, const vector<DoubleVector> &actions);
	void EndEpisode(double reward);
	void EndRun();
	void PrintStats(double reward);
	void ClearStats();
	void UpdateETrace(double delta);

	SelectionStrategy selectionStrategy;
    double alpha; //Learning rate
    double alphaAnnealFactor;
    double epsilon; //The amount of time a non-greedy action is selected in e-greedy and MaxBoltzmann
    double epsilonAnnealFactor;
    double sigma; //0 full Q-learning and 1 full SARSA learning
    double gamma; //eligibility trace discounting
    double lambda; //discounting
    double boltzmannTemp; //The boltzman temperature
    double boltzmannTempAnnealFactor;
    bool useRehearsing;
    bool useTabuSearch;
    unsigned int tabuSize;
    unsigned int agentId;
	FunctionApproximator *Q;
    double totalReward;
    unsigned int totalSteps;
    double episodeReward;
    unsigned int steps;
    unsigned int episodes;
    double deltaSum;
    double absDeltaSum;
    unsigned int extraGoalTraining;
    unsigned int explorativeSteps;
    unsigned int reportEpisodes;
    bool isStarted;
    bool useNFQ;
	unsigned int GreedyAction(const DoubleVector &observation, 
                              const vector<DoubleVector> &actions, vector<double> &actionValues);
    unsigned int* GreedykActions(const vector<DoubleVector> &actions, 
                                  vector<double> &actionValues, int k);
private:
	void InternalEndEpisode(double reward);
	unsigned int SelectAction(const DoubleVector &observation, const DoubleVector &greedyAction, 
		const vector<DoubleVector> &actions, const vector<double> &actionValues);
	DoubleVector SelectActionEGreedy(const DoubleVector &greedyAction, const vector<DoubleVector> &actions);
	DoubleVector SelectActionMaxBoltzmann(const DoubleVector &greedyAction, 
		const vector<DoubleVector> &actions, const vector<double> &actionValues);

	void UpdateNFQ(const DoubleVector &prevObservation, const DoubleVector &prevAction, double reward, const DoubleVector &observation, const vector<DoubleVector> &actions, const DoubleVector &takenAction);
	void EndEpisodeNFQ(const DoubleVector &prevObservation, const DoubleVector &prevAction, double reward);
	
    DoubleVector prevObservation;
    DoubleVector prevAction;    
    map<DoubleVector, map<DoubleVector, double> > eligibilityTraces;
    deque<pair<DoubleVector, DoubleVector> > tabuQueue;
    
    double predictedRewardSum;
    unsigned int totalExplorativeSteps;
    timeval clearTime;
    timeval startTime;

public:
	template<class Archive>
	void serialize(Archive &ar, const unsigned int version)
	{
		ar & selectionStrategy;
		ar & alpha;
		ar & alphaAnnealFactor;
		ar & epsilon;
		ar & epsilonAnnealFactor;
		ar & sigma;
		ar & gamma;
		ar & lambda;
		ar & boltzmannTemp;
		ar & boltzmannTempAnnealFactor;
		ar & useRehearsing;
		ar & useTabuSearch;
		ar & tabuSize;
 		ar & useNFQ;
        
        ar.register_type(static_cast<TabularFA *>(NULL));
        ar.register_type(static_cast<SlidingWindowCache *>(NULL));
        ar.register_type(static_cast<NFQ *>(NULL));
        ar.register_type(static_cast<FannFA *>(NULL));
        ar.register_type(static_cast<FannBatchFA *>(NULL));
        ar.register_type(static_cast<FannCascadeFA *>(NULL));
        
		ar & Q;
	}

};

void SaveAgent(const Agent &a, const char * filename);
void LoadAgent(Agent &a, const char * filename);

extern Agent *agent[2];

#endif
