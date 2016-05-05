//Must include all the following files
#include "RL_Interface.h"
#include "gnu.h"
#include "RL_util.h"
#include <time.h>
#include <stdio.h>
#include <iostream>

time_t start;
time_t stop;
double sumReward = 0;
int parseargs(int argc, char *argv[]);
unsigned int episodes = 200;
unsigned int num_runs = 1;
bool verbose = true;

//Function runs an experiment
void run(int num_episodes)
{        
	timeval startTime;
	gettimeofday(&startTime, NULL);
	
	for(int x=0; x < num_episodes; x++)
	{
		RL_episode();	//run a single episode
		
		sumReward += RL_return();
		
		if(verbose)
		{
			cout << "Episodes        : " << RL_num_episodes() << endl
				<< "EpisodeReward   : " << RL_return() << endl
				<< "AvgEpisoseReward: " << episodeReward << endl
				<< "TotalReward     : " << sumReward << endl << endl;
		}
		collectStats();	//collect stats on episode
		
		timeval endTime;
		gettimeofday(&endTime, NULL);
	
		double t = ((double)(endTime.tv_sec - startTime.tv_sec) 
					+ (double)(endTime.tv_usec - startTime.tv_usec)/(1000000.0));
		
		if(t > 3600*24)
		{
			break;
		}            
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
	if(!parseargs(argc, argv))
		exit(-1);
			
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
	
		printf("average reward = %f\n",RL_average_reward());
		printf("cummulative reward = %f\n",RL_return());
		printf("average steps = %d\n",RL_num_steps());
	}
	
	RL_cleanup();
}

int parseargs(int argc, char *argv[]) 
{
	int i = 0;
	int fail = 0;
	char *c, *d;

	/* collect all the switches */
	while (!fail && ++i<argc && *(c = argv[i]) == '-') 
	{
		if(*++c != '\0') 
		{
			if(strcmp(c, "q") == 0)
			{
				verbose = false;
			}
			else if(strcmp(c, "te") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					episodes = (unsigned int) strtoul(argv[i], &d, 10);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "r") == 0)
			{
				if (++i>=argc) fail = 1;
				else 
				{
					num_runs = (unsigned int) strtoul(argv[i], &d, 10);
					if (*d != '\0') fail = 1;
				}
			}
			else if(strcmp(c, "help") == 0)
			{
				fail = 1; //print usage info
			}
			else
			{
				//do nothing, we simply ignore more parameters, so that the same can be sent to pipeagent and pipemain
			}
		}
		else
			fail = 1;
	}

	if(fail) 
	{
		printf("Usage: %s [-q] [-e num-episode] [-r num-runs]\n", argv[0]);
		return 0;
	}

	return 1;
}
