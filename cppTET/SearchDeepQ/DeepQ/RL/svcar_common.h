/*
 *  svcar_common.h
 *  
 *  Created by Rich Sutton, modified by Adam White on September 20 2005.
 *  Modified by Andrew Butcher July 27, 2006
 *  Copyright (c) 2006 UAlberta. All rights reserved.
 *
 *  Description.
 *		This file contains a simulation of the mountain and car dynamic system 
 *		EPISODIC
 *
 *  State: 2D Continous
 *  Actions: 1D discrete (0 1 2)
 */
#ifndef SVCAR_COMMON_H
#define SVCAR_COMMON_H

//This tells interface that you will provide definitions for optional functions: env_init, agent_init, and agent_clean.
//See DOC for list of optional functions and flags that allow implementation of some or all of these methods
#define ENV_INIT
#define ENV_CLEANUP
#define AGENT_INIT
#define AGENT_CLEANUP

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
