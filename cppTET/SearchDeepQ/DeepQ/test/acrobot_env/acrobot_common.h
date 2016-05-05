/*
 *  acrobot_common.cpp
 *  
 *  Created by Adam White on September 20 2005.
 *  Copyright (c) 2005 UAlberta. All rights reserved.
 *
 *	Description:
 *		Force is applied at the junction between the two links (Sutton in 1996), and from a horizontal double-arm pendulum 
 *		(where the main link rotates in the horizontal plane, and the secondary link rotates vertically with respect to the main link). 
 *	
 *		Rewards are zero everywhere but in the balanced region.
 *
 *  State: 4D continuous values
 *  Actions: 1D (-1,0,1)
 */
#ifndef ACROBOT_COMMON_H
#define ACROBOT_COMMON_H

//This tells interface that you will provide definitions for optional functions: env_init, agent_init, and agent_clean.
//See DOC for list of optional functions and flags that allow implementation of some or all of these methods
#define ENV_INIT
#define AGENT_INIT
#define AGENT_CLEANUP
#define ENV_CLEANUP

#include <vector>
typedef double* Observation;    //Defining what type a Observation is
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