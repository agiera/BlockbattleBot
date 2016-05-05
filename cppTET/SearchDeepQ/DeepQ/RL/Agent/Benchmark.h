#ifndef BENCHMARK_H
#define BENCHMARK_H

#include <string>
#include <vector>
#include "BenchmarkData.h"
#include "FunctionApproximator.h"

using namespace std;

class Agent;

class Benchmark
{
public:
	static Benchmark* Instance();
    ~Benchmark();
    Agent* CreateAgent();
    
    void StartRun();
	void EndRun();
    void StartEpisode(Agent *agent);
    void Step(Agent *agent, double reward);
    void EndEpisode(Agent *agent, double reward);
    string GetOutputDir();
    
	//Agent parameters
	unsigned int selectionStrategy;
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
    unsigned int tabuSize;
    bool fakeETrace;
    bool seed;
    double benchmarkValue;
    string benchmarkFile;
    
    //Benchmark parameters
    bool verbose;
    bool useSameFA;
    unsigned int totalEpisodes;
    int onlineEpisodes;
    int offlineEpisodes;
    unsigned int numRuns;
    string agentFile;
    string benchmarkName;
	FunctionApproximator *Q;
	timeval startTime;
	int timeoutMinutes;
    
    //Function approximator parameters
    bool useCache;
    bool useNFQ;
    unsigned int minCacheSize;    
    unsigned int maxCacheSize;
    unsigned int cacheCommitInterval;
    unsigned int epochsPerCommit;
    double initialValue;
    string faType;
    bool useWholeAnnTraining;
    double desiredError;
    unsigned int numLayers;
    unsigned int *layers;
    unsigned int cascadeStagnationEpochs;
    double cascadeOutputChangeFraction;
    unsigned int cascadeMaxEpochs;
    unsigned int cascadeMinEpochs;

private:
    Benchmark();
    vector<BenchmarkDataCollector*> data;
    vector<FILE*> files;
    unsigned int currentRun;
    unsigned int agentId;
};

int parseargs(int argc, char *argv[]);
#endif
