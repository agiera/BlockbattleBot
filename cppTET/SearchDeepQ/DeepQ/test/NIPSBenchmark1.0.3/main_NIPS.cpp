#include "RL_Interface.h"
#include "RLcommon.h"
#include "gnu.h"
#include "RL_util.h"
#include <time.h>
#include <sys/time.h>
#include <stdio.h>
/*********************************************************************************
*	Benchmark driver program. 
*
*	Completely defines the experimental setup of the benchmark. 
*
*	THIS FILE: episodic task   -    online training
*********************************************************************************/

Reward_observation_action_terminal roat;

void run(int num_episodes, int max_steps, int aggregationSize)
{        
	printf("\nBeginning episodes \n");
	for(int z=0; z < num_episodes; z++)
	{
        RL_episode(max_steps);	//run a single episode
		collectStatsBenchmark(aggregationSize,z);
		if (z%100 == 0)
		{
			printf("...episode %d\n", z);
		}
	}
	printf("\nDone.");        
}

int main(int argc, char *argv[])
{
	int Nmax = 10000;
	int Cmax = 300;
	int aggregationSize = 50;

    RL_init(argv[0]);

	char* envName = RL_env_get_name();
	char* agentName = RL_agent_get_name();
	printf("Env: ");
	printf(envName);
	printf("\n");
	printf("Agent: ");
	printf(agentName);
	printf("\n");
		
	initStatsBenchmark(envName, agentName, Nmax);		
	run(Nmax, Cmax, aggregationSize);            
	endStatsBenchmark();
	RL_cleanup();
}
