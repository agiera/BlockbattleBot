/*
 *  mine_common.h
 *  
 *
 *  Created by Adam White on Fri Aug 05 2005.
 *  Copyright (c) 2005 UAlberta. All rights reserved.
 * 
 *  A simple grid world with stationary mines.
 *  Episodic task, end of episode when find goal or hit mine
 *  
 *  State: 1D discrete
 *  Actions: 1D discrete (0,1,2,3)
 *
 */
#ifndef MINE_COMMON_H
#define MINE_COMMON_H

//This tells interface that you will provide definitions for optional functions: env_init, agent_init, and agent_clean.
//See DOC for list of optional functions and flags that allow implementation of some or all of these methods
#define ENV_INIT
#define AGENT_INIT
#define AGENT_CLEANUP
#define ENV_CLEANUP
#define ENV_STATE
#define ENV_RANDOM

#include <vector>
typedef int Observation;    //Defining what type a Observation is
typedef int Action;	  //Defining what type a action is

typedef char* Task_specification;
typedef double Reward;

typedef struct {
	Reward r;
	Observation o;
	bool terminal;
} Reward_observation;

typedef int State_key;
typedef int Random_seed_key;


#endif