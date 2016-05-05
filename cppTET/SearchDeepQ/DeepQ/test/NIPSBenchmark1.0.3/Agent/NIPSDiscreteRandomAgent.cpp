#include "RandomAgent.h"
#include "RL_agent_util.h"
#include <stdlib.h>
#include <math.h>
#include <stdio.h>

Action randomAction();

void agent_init(Task_specification ts)
{
	parse_task_spec(ts, &taskSpec);
	
	srand48(666);
}

Action agent_start(Observation o)
{
    return randomAction();
}

Action agent_step(Reward r, Observation o)
{
    return randomAction();
}

void agent_end(Reward r)
{
	//Dont care
}

void agent_cleanup()
{
	// Nothing to clean up
}

char* agent_get_name()
{
	return "tedmunds_Rutgers_NIPSDiscreteRandomAgent";
}

Action randomAction()
{
	// Do the discrete dimensions
	int lookup = 0;
	// TODO: don't assume that every dimension has a max and a min
	int range = (int)floor(taskSpec.action_maxs[lookup] - taskSpec.action_mins[lookup]) + 1;
	long int randVal = lrand48();
	int value = randVal%range + (int)taskSpec.action_mins[lookup];
	action = value;
	return action;
}

