/********************************************************************************
 *  MCcar_common.h
 *  
 *  Created by Adam White, created on March 29 2007.
 *  Copyright (c) 2005 UAlberta. All rights reserved.
 *
 *  Description.
 *
 *		The Standard Mountain Car, given in Figure 8.8 of the book 
 *		"Reinforcement Learning: An Introduction", by Sutton and Barto.
 *
 *      http://www.cs.ualberta.ca/%7Esutton/book/ebook/node89.html
 *
 *		The environment program implements the dynamics described in Sutton 
 *		and Barto. Except, that the environment program allows episodes to begin 
 *		with the car at the bottom of the hill with zero velocity or with the 
 *		car at a random position and velocity. This is controlled by a flag in 
 *		MCcar_common.h.
 *
 *		Episodic Task
 *		Reward: -1 per step
 *		Actions: Discrete
 *					0 - reverse 
 *					1 - coast 
 *					2 - forward 
 *		State: 2D Continuous
 *					car's x-position (-1.2 to .6)
 *					car's velocity (-.7 to .7)
 *					
 ********************************************************************************/
#ifndef CAR_COMMON_H
#define CAR_COMMON_H

#define RANDOM

//This tells interface that you will provide definitions for optional functions: env_init, agent_init, and agent_clean.
//See DOC for list of optional functions and flags that allow implementation of some or all of these methods
#define ENV_INIT
#define AGENT_INIT
#define ENV_CLEANUP
#define AGENT_CLEANUP
#define AGENT_FREEZE

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
