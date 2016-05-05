//Must include all the following files
#include "RL_Interface.h"
#include "gnu.h"
#include "RL_util.h"
#include <time.h>
#include <stdio.h>
#include <iostream>

#include "Benchmark.h"

time_t start;
time_t stop;
double sumReward = 0;
unsigned int episodes = 200;
unsigned int num_runs = 1;
bool verbose = true;

//Function runs an experiment
void run(int num_episodes)
{        
	timeval startTime;
	gettimeofday(&startTime, NULL);
	int steps = 0;
	for(int x=0; x < num_episodes; x++)
    {
		RL_episode(300);	//run a single episode
		
		steps += RL_num_steps();
		sumReward += RL_return();
		
		if(verbose)
		{
		   cout << "Episodes        : " << x << endl
				<< "EpisodeReward   : " << RL_return() << endl
				<< "AvgEpisoseReward: " << episodeReward << endl
				<< "TotalReward     : " << sumReward << endl
				<< "AvgReward       : " << sumReward/(x+1) << endl << endl;
		}
		else if(x % (num_episodes/100) == 0 && x!=0)
		{
 			cout << x << ", s=" << RL_num_steps() << ", avg_s=" << steps/(x+1) << ", r=" << RL_return() << ", t=" << sumReward << ", avg=" << sumReward/(x+1) << endl;
		}
		collectStats();	//collect stats on episode
    
		/*timeval endTime;
		gettimeofday(&endTime, NULL);
	
		double t = ((double)(endTime.tv_sec - startTime.tv_sec) 
					+ (double)(endTime.tv_usec - startTime.tv_usec)/(1000000.0));*/
		
		//if(t > 3600*5)
		//if(t > 120)
		//{
		//	break;
		//}
    }
}

void startTimer(time_t *strt)
{
	time(strt);
}

void endTimer(time_t *stp)
{
	time(stp);
}

void printTimeTaken()
{
	int time = (int)(stop - start);
	printf("\nTIMING STATS::");
	printf("\n**************************************************************\n");
	printf("Time taken to complete the run: %d seconds\n",time);
	printf("**************************************************************\n");
}

//MAIN PROGRAM
int main(int argc, char *argv[])
{
	parseargs(argc, argv);
	verbose = Benchmark::Instance()->verbose;
	num_runs = Benchmark::Instance()->numRuns;
	episodes = Benchmark::Instance()->totalEpisodes;
			
	for(unsigned int i = 0; i < num_runs; i++)
	{
		startTimer(&start);
		RL_init();					//initialize interface
		initStats(episodes);	//initialize stats routine	
		run(episodes);			//run experiment	
		endStats(episodes);		//end stats collection½	
		endTimer(&stop);
		printTimeTaken();
		
// 		if(verbose)
// 			graph(episodes,false);	//graph stats
	
		printf("average reward = %f\n",sumReward/(double)RL_num_episodes());
		printf("cummulative reward = %f\n",RL_return());
		printf("average steps = %d\n",RL_num_steps());
	}
	
	RL_cleanup();
}
