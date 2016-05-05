/*
 *  cart_common.h
 *
 *  Created by Adam White on September 20 2005.
 *  Copyright (c) 2005 UAlberta. All rights reserved.
 *
 *  Description.
 *		Cart-pole consists of a cart which is able to move on a bounded track and trying to balance a pole on its top. 
 *		Actions consist of appling a consatant force to the left or right. Failure when pole falls.
 *		EPISODIC
 *
 *  State: 1D discrete (0,161)
 *  Actions: 1D discrete (0,1)
 */
#ifndef CART_COMMON_H
#define CART_COMMON_H

//This tells interface that you will provide definitions for optional functions: env_init, agent_init, and agent_clean.
//See DOC for list of optional functions and flags that allow implementation of some or all of these methods
#define ENV_INIT
#define AGENT_INIT
#define AGENT_CLEANUP
#define ENV_CLEANUP


#include <vector>
typedef double* Observation;    //Defining what type a sensation is
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