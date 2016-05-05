#include <sys/stat.h>
#include <sys/types.h>
#include <time.h>
#include "Benchmark.h"
#include "Agent.h"

Benchmark::Benchmark()
{
	selectionStrategy = (unsigned int)Agent::SelectEGreedy;
    alpha = 0.2;
    alphaAnnealFactor = 1;
    epsilon = 0.001;
    epsilonAnnealFactor = 1;
    sigma = 0.7;
    gamma = 0.2;
    lambda = 0.9;
    boltzmannTemp = 100;
    boltzmannTempAnnealFactor = 0.999;
    useRehearsing = false;
    tabuSize = 0;
    fakeETrace = false;
    benchmarkValue = 0;
    seed = false;

    verbose = 1;
    totalEpisodes = 0;
    onlineEpisodes = -1;
    offlineEpisodes = -1;
    numRuns = 1;
	useSameFA = true;
	Q = NULL;

    useCache = true;
    useNFQ = false;
    minCacheSize = 2000;
    maxCacheSize = 2000;
    cacheCommitInterval = 10;
    epochsPerCommit = 1;
    initialValue = 0;
    faType = "batch";
    useWholeAnnTraining = false;
    desiredError = 0.0001;
    numLayers = 3;
    layers = new unsigned int[3];
    layers[0] = 196;
    layers[1] = 40;
    layers[2] = 1;
        
    agentId = 0;
    currentRun = 0;
    
    cascadeStagnationEpochs = 15;
    cascadeOutputChangeFraction = 0.05;
    cascadeMaxEpochs = 5000;
    cascadeMinEpochs = 500;
    timeoutMinutes = 120;
	gettimeofday(&startTime, NULL);
}


Benchmark::~Benchmark()
{
}

Benchmark* Benchmark::Instance()
{
	static Benchmark instance;
	return &instance;
}

Agent* Benchmark::CreateAgent()
{
	Agent *agent = new Agent();
	
	if(seed)
	{
		struct timeval t;
		gettimeofday(&t, NULL);
		cout << "random seed : " << t.tv_usec << endl;
		srand48(t.tv_usec);
		srand(t.tv_usec);
	}
	if(agentFile.size() != 0)
	{
		LoadAgent(*agent, agentFile.c_str());
	}
	else
	{
		if(Q == NULL || !useSameFA)
		{
			FunctionApproximator *fa = NULL;
			//fann, batch, cascade, tabular
			if(faType == "tabular")
			{
				fa = new TabularFA(initialValue);
			}
			else
			{
				fann *ann = fann_create_shortcut_array(numLayers, layers);
				fann_set_activation_function_output(ann, FANN_LINEAR);
				
				fann_set_activation_function_hidden(ann, FANN_SIN_SYMMETRIC);
				fann_set_learning_rate(ann, 0.7);
				
				//fann_set_activation_function_hidden(ann, FANN_LINEAR);
				//fann_set_learning_rate(ann, 0.1);
				
				fann_randomize_weights(ann, -0.0001, 0.0001);
				fann_set_train_error_function(ann, FANN_ERRORFUNC_LINEAR);
				fann_set_activation_steepness_hidden(ann, 0.1);
				fann_set_activation_steepness_output(ann, 0.1);
			//	fann_set_training_algorithm(ann, FANN_TRAIN_INCREMENTAL);
				fann_set_training_algorithm(ann, FANN_TRAIN_RPROP);
			
			//	fann_set_rprop_increase_factor(ann, 1.1);
			//	fann_set_rprop_decrease_factor(ann, 0.75);
			//    fann_set_rprop_delta_max(ann, 20);
				fann_set_cascade_output_stagnation_epochs(ann, cascadeStagnationEpochs);
				fann_set_cascade_output_change_fraction(ann, cascadeOutputChangeFraction);
				fann_set_cascade_max_out_epochs(ann, cascadeMaxEpochs);
				fann_set_cascade_min_out_epochs(ann, cascadeMinEpochs);
				
				if(faType == "fann")
				{
					fa = new FannFA(ann);
				}
				else if(faType == "batch")
				{
					fa = new FannBatchFA(ann);
				}
				else if(faType == "cascade")
				{
					fa = new FannCascadeFA(ann, useWholeAnnTraining, desiredError);
				}
			}
				
			Q = fa;
			
			if(useCache)
			{
				Q = new SlidingWindowCache(fa, maxCacheSize, minCacheSize,
							cacheCommitInterval, initialValue, epochsPerCommit);
				if(faType == "cascade")
					dynamic_cast<FannCascadeFA*>(fa)->cache = dynamic_cast<SlidingWindowCache*>(Q);
			}
			else if(useNFQ)
			{
				Q = new NFQ(fa, maxCacheSize, minCacheSize,
							cacheCommitInterval, initialValue, epochsPerCommit);
				((NFQ*)Q)->fakeETrace = fakeETrace;
				if(faType == "cascade")
					dynamic_cast<FannCascadeFA*>(fa)->nfq = dynamic_cast<NFQ*>(Q);
			}
		}
			
		agent = new Agent(Q);
		agent->selectionStrategy = (Agent::SelectionStrategy)selectionStrategy;
		agent->alpha = alpha;
		agent->alphaAnnealFactor = alphaAnnealFactor;
		agent->epsilon = epsilon;
		agent->epsilonAnnealFactor = epsilonAnnealFactor;
		agent->sigma = sigma;
		agent->gamma = gamma;
		agent->lambda = lambda;
		agent->boltzmannTemp = boltzmannTemp;
		agent->boltzmannTempAnnealFactor = boltzmannTempAnnealFactor;
		agent->useRehearsing = useRehearsing;
		agent->useTabuSearch = (tabuSize != 0);
		agent->tabuSize = tabuSize;
	}
	
	agent->agentId = agentId;
	
	if(currentRun == 1)
	{
		data.push_back(new BenchmarkDataCollector());
		if(agentId != data.size()-1)
		{
			cout << "something is really wrong here" << endl;
			exit(-1);
		}
	}
	data[agentId]->newCollection();
	
	char foo[100];
	sprintf(foo, "benchmark_%d_%d.out", agentId, currentRun);
	string filename = GetOutputDir() + foo;
	
	FILE* file = fopen(filename.c_str(), "w");
	if(file == NULL)
	{
		cout << "unable to open file: " << filename << endl;
		exit(-1);
	}
	
	files.push_back(file);
		
	agentId++;
	return agent;
}

string Benchmark::GetOutputDir()
{
	if(benchmarkName.size() == 0)
	{
		char timestr[100];
		time_t rawtime;
		struct tm * timeinfo;
		time( &rawtime );
		timeinfo = localtime ( &rawtime );
		strftime(timestr, 100, "%Y-%m-%d_%H-%S", timeinfo);
		
		char info[100];
		sprintf(info, "runs_%d_episodes_%d", numRuns, totalEpisodes);
		
		benchmarkName = "benchmark_";
		benchmarkName += faType;
		benchmarkName += "_";
		benchmarkName += info;
		benchmarkName += "_";
		benchmarkName += timestr;
	}
	
	return "benchmarkdata/" + benchmarkName + "/";
}

void Benchmark::StartRun()
{
	currentRun++;
	agentId = 0;
}

void Benchmark::StartEpisode(Agent *agent)
{
	if((int)agent->episodes >= offlineEpisodes
		&& agent->selectionStrategy != Agent::SelectGreedy)
	{
		cout << "switching to greedy after " << agent->episodes << " episodes" << endl;
		agent->selectionStrategy = Agent::SelectGreedy;
		agent->totalReward = 0;
		agent->totalSteps = 0;
		srand48(0);
	}
}

void Benchmark::Step(Agent *agent, double reward)
{

}

void Benchmark::EndEpisode(Agent *agent, double reward)
{
	timeval endTime;
	gettimeofday(&endTime, NULL);
	
	double t = ((double)(endTime.tv_sec - startTime.tv_sec) 
				+ (double)(endTime.tv_usec - startTime.tv_usec)/(1000000.0));
		
	if(t > timeoutMinutes*60 && agent->selectionStrategy != Agent::SelectGreedy)
	{
		int diff = totalEpisodes - offlineEpisodes;
		offlineEpisodes = onlineEpisodes = (int)agent->episodes +1;
		totalEpisodes = offlineEpisodes + diff;
		cout << endl << endl << "TIMEOUT new deadlines: online = " << onlineEpisodes << ", offline = " << offlineEpisodes << ", total = " << totalEpisodes << endl << endl;
	}
	

	if((int)agent->episodes <= onlineEpisodes)
	{
		BenchmarkData *bd = new BenchmarkData(agent->episodes, agent->episodeReward,
			agent->episodeReward/agent->steps, agent->Q->GetNumHiddenNeurons(), agent->absDeltaSum/agent->steps, 
			agent->totalReward, agent->steps, (unsigned int)(agent->episodeReward > 0), agent->Q->GetMSE(), agent->explorativeSteps/(double)agent->steps);
			
		bd->printBench(files[agent->agentId]);
		//data[agent->agentId]->addBench(bd);
		delete bd;
	}
	
	if((((int)agent->episodes == onlineEpisodes && onlineEpisodes < offlineEpisodes) ||
	    ((int)agent->episodes == offlineEpisodes-1 && onlineEpisodes >= offlineEpisodes))
	   && benchmarkFile.size() != 0)
	{
		FILE *out = fopen(benchmarkFile.c_str(), "a+");
		if(out == NULL)
		{
			cout << "unable to open file: " << benchmarkFile << endl;
			exit(-1);
		}
		
		fprintf(out, "\n%f %.10f %.10f %.10f %f", benchmarkValue, ((double)agent->totalSteps)/(agent->episodes-1), (((double)agent->totalReward)/(double)agent->totalSteps), ((double)agent->totalReward)/(agent->episodes-1), agent->totalReward);
		printf("1 average on-line reward for value %f after %d episodes is %.10f with avg steps %f\n", benchmarkValue, (int)agent->episodes, ((double)agent->totalReward)/(agent->episodes-1), ((double)agent->totalSteps)/(agent->episodes-1));
		
		fclose(out);
	} 
	
	if((int)agent->episodes == offlineEpisodes-1)
	{
		
		double offlinereward = ((double)agent->totalReward)/(agent->episodes-1);
		double offlinestep = ((double)agent->totalSteps)/(agent->episodes-1);
		double offlineavgreward = (((double)agent->totalReward)/(double)agent->totalSteps);
		printf("2 average on-line reward for value %f after %d episodes is %.10f with avg steps %f\n", benchmarkValue, (int)agent->episodes, offlinereward, offlinestep);
		
		if(benchmarkFile.size() != 0)
		{
			FILE *out = fopen(benchmarkFile.c_str(), "a+");
			if(out == NULL)
			{
				cout << "unable to open file: " << benchmarkFile << endl;
				exit(-1);
			}
			fprintf(out, " %.10f %.10f %.10f", offlinereward, offlinestep, offlineavgreward);
			fclose(out);
		}
	}
	
	if(agent->episodes == totalEpisodes)
	{		
		double offlinereward = ((double)agent->totalReward)/((double)(totalEpisodes - offlineEpisodes));
		double offlinestep = ((double)agent->totalSteps)/((double)(totalEpisodes - offlineEpisodes));
		double offlineavgreward = (((double)agent->totalReward)/(double)agent->totalSteps);
		printf("average off-line reward for value %f after %d episodes is %.10f with avg steps %f\n", benchmarkValue, (totalEpisodes - offlineEpisodes), offlinereward, offlinestep);
		printf("OFFLINE %.10f\n", offlinereward);
		
		if(benchmarkFile.size() != 0)
		{
			FILE *out = fopen(benchmarkFile.c_str(), "a+");
			if(out == NULL)
			{
				cout << "unable to open file: " << benchmarkFile << endl;
				exit(-1);
			}
			fprintf(out, " %.10f %.10f %.10f", offlinereward, offlinestep, offlineavgreward);
			fclose(out);
		}
	}
}

void Benchmark::EndRun()
{
	for(vector<FILE*>::iterator it = files.begin();
		it != files.end(); it++)
	{
		fclose(*it);		
	}
	files.clear();
	
	if(currentRun == numRuns)
	{
		for(unsigned int i = 0; i < data.size(); i++)
		{
			char foo[100];
			sprintf(foo, "benchmark_%d.out", i);
			string filename = GetOutputDir() + foo;
			data[i]->printAvgCollection(filename);
			
			/*
			const int avg[4] = {10, 50, 100, 500};
			for(int j = 0; j < 4; j++)
			{
				sprintf(foo, "avg_%d_benchmark_%d.out", avg[j], i);
				filename = GetOutputDir() + foo;
				data[i]->printAvgCollection(filename, avg[j]);
			}
			*/
		
			/*
			const int gauss[4] = {2, 8, 18, 50};
			for(int j = 0; j < 4; j++)
			{
				sprintf(foo, "gauss_%d_benchmark_%d.out", avg[j], i);
				filename = GetOutputDir() + foo;
				data[i]->printGaussCollection(filename, avg[j], gauss[j]);
			}
						
			cout << "WinPercent[" << i << "]: " << data[i]->getWinPercent() << endl;
			*/
		}
	}
}

int parseargs(int argc, char *argv[]) 
{
	int i = 0;
	int fail = 0;
	char *c, *d;
	
	Benchmark *b = Benchmark::Instance();

	/* collect all the switches */
	while (!fail && ++i<argc && *(c = argv[i]) == '-') 
	{
		if(*++c != '\0') 
		{
			if(strcmp(c, "q") == 0)
			{
				b->verbose = false;
			}
			else if(strcmp(c, "te") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->totalEpisodes = (unsigned int) strtoul(argv[i], &d, 10);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "on") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->onlineEpisodes = (unsigned int) strtoul(argv[i], &d, 10);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "off") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->offlineEpisodes = (unsigned int) strtoul(argv[i], &d, 10);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "r") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->numRuns = (unsigned int) strtoul(argv[i], &d, 10);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "f") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->agentFile = argv[i];
				}
			}
			else if(strcmp(c, "name") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->benchmarkName = argv[i];
				}
			}
			else if(strcmp(c, "select") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->selectionStrategy = (Agent::SelectionStrategy) strtoul(argv[i], &d, 10);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "a") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->alpha = strtod(argv[i], &d);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "aa") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->alphaAnnealFactor = strtod(argv[i], &d);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "e") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->epsilon = strtod(argv[i], &d);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "ea") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->epsilonAnnealFactor = strtod(argv[i], &d);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "s") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->sigma = strtod(argv[i], &d);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "g") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->gamma = strtod(argv[i], &d);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "l") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->lambda = strtod(argv[i], &d);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "b") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->boltzmannTemp = strtod(argv[i], &d);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "ba") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->boltzmannTempAnnealFactor = strtod(argv[i], &d);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "bv") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->benchmarkValue = strtod(argv[i], &d);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "bf") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->benchmarkFile = argv[i];
				}
			}
			else if(strcmp(c, "faketrace") == 0)
			{
				b->fakeETrace = true;
			}
			else if(strcmp(c, "seed") == 0)
			{
				b->seed = true;
			}
			else if(strcmp(c, "rehearse") == 0)
			{
				b->useRehearsing = true;
			}
			else if(strcmp(c, "tabu") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->tabuSize = (unsigned int) strtoul(argv[i], &d, 10);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "nocache") == 0)
			{
				b->useCache = false;
			}
			else if(strcmp(c, "nfq") == 0)
			{
				b->useCache = false;
				b->useNFQ = true;
			}
			else if(strcmp(c, "cachesize") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->minCacheSize = (unsigned int) strtoul(argv[i], &d, 10);
					if (*d != '\0') fail = 1;
				}
				if (++i>=argc) fail = 1;
				else 
				{
					b->maxCacheSize = (unsigned int) strtoul(argv[i], &d, 10);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "cc") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->cacheCommitInterval = (unsigned int) strtoul(argv[i], &d, 10);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "epoch") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->epochsPerCommit = (unsigned int) strtoul(argv[i], &d, 10);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "initial") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->initialValue = strtod(argv[i], &d);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "fa") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->faType = argv[i];
				}
			}
			else if(strcmp(c, "no-whole-ann") == 0)
			{
				b->useWholeAnnTraining = false;
			}
			else if(strcmp(c, "whole-ann") == 0)
			{
				b->useWholeAnnTraining = true;
			}
			else if(strcmp(c, "separate-fa") == 0)
			{
				b->useSameFA = false;
			}
			else if(strcmp(c, "desired-error") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->desiredError = strtod(argv[i], &d);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "fann-layers") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->numLayers = (unsigned int) strtoul(argv[i], &d, 10);
					if (*d != '\0') fail = 1;
				}
				
				delete b->layers;
				b->layers = new unsigned int[b->numLayers];
				
				for(unsigned int n = 0; n < b->numLayers; n++)
				{
					if (++i>=argc) fail = 1;
					else 
					{
						b->layers[n] = (unsigned int) strtoul(argv[i], &d, 10);
						if (*d != '\0') fail = 1;
					}
				}
			}
			else if(strcmp(c, "s-epochs") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->cascadeStagnationEpochs = (unsigned int) strtoul(argv[i], &d, 10);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "max-epochs") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->cascadeMaxEpochs = (unsigned int) strtoul(argv[i], &d, 10);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "min-epochs") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->cascadeMinEpochs = (unsigned int) strtoul(argv[i], &d, 10);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "cascade-change-fraction") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->cascadeOutputChangeFraction = strtod(argv[i], &d);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "timeout") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					b->timeoutMinutes = (int)strtoul(argv[i], &d, 10);
					if (*d != '\0') fail = 1;
				}
			}
			else
			{
				cout << "unknown parameter: " << c << endl;
				fail = 1;
				break;
			}
		}
		else 
			fail = 1;
	}
	
	if(b->faType == "cascade")
	{
		if(b->numLayers != 2)
			fail = 1;
	}
	//else if(b->numLayers == 2)
	//	fail = 1;
	
	if(fail) 
	{
		printf("Usage: %s [-q] [-te total-episodes] [-on online-episodes] [-off offline-episodes] [-r num-runs] [ [-f agent-file] | [-select selection-strategy (1 = egreedy, 2 = maxBoltzmann)] [-a alpha] [-aa alpha-anneal-factor] [-e epsilon] [-ea epsilon-anneal-factor] [-s sigma] [-g gamma] [-l lambda] [-faketrace] [-b boltzmann-temp] [-ba boltzmann-anneal-factor] [-rehearse] [-tabu tabu-size] [-nocache] [-nfq] [-cachesize min-cache-size max-cache-size] [-cc cache-commit-interval] [-epoch epochs-per-commit] [-initial initial-value] [-fa function-approximator (fann, batch, cascade, tabular)] [-whole-ann] [-no-whole-ann] [-desired-error desired-error ] [-cascade-change-fraction cascade-change-fraction] [-min-epochs min-cascade-epochs] [-max-epochs max-cascade-epochs] [-s-epochs cascade-stagnation-epochs] [-separate-fa]  [-bv benchmark-value] [-bf benchmark-file] [-timeout minutes] [-fann-layers num-layers layer1 ... layer2] [-seed] ]\n", argv[0]);
		exit(-1);
	}
	
	if(b->offlineEpisodes == -1)
		b->offlineEpisodes = b->totalEpisodes;
	if(b->onlineEpisodes == -1)
		b->onlineEpisodes = b->offlineEpisodes;
		
	//create dir and put parameters into it
	mkdir(b->GetOutputDir().c_str(), S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH);
	string filename = b->GetOutputDir() + "parameters.txt";
	FILE* parmfile = fopen(filename.c_str(), "w");
	if(parmfile == NULL)
	{
		cout << "Unable to create file : " << filename << endl;
		exit(-1);
	}
	
	cout << "Outputdir: " << b->GetOutputDir() << endl;
	
	for(i = 1; i < argc; i++)
	{
		fprintf(parmfile, "%s ", argv[i]);
	}
	fprintf(parmfile, "\n");
	fclose(parmfile);

	return 1;
}
