/********************************************************************************
 *  MountainCar.cpp
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
#ifndef MOUNTAINCAR_H
#define MOUNTAINCAR_H

#include <math.h>
#include "stdio.h"
#include "stdlib.h"

#include "RLcommon.h"

//State variables
double mcar_position;
double mcar_velocity;

int max_steps = 1000000;
int current_num_steps;

const int state_size = 2;
const int num_actions = 3;

const double mcar_min_position = -1.2;
const double mcar_max_position = 0.6;
const double mcar_goal_position = 0.5;
const double mcar_max_velocity = 0.07;            // the negative of this is also the minimum velocity

//helper functions
void test_termination();  
void set_initial_position_random();
void set_initial_position_at_bottom();
void update_velocity(Action a);
void update_position();

//Create instances of RL-Glue types
Observation current_observation;				
Reward_observation ro;							
Task_specification env_task_spec;

#endif

   
