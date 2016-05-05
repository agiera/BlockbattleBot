/*
 *  MountainCar.h
 *  
 *  Created by Rich Sutton, modified by Adam White on September 20 2005.
 *  Copyright (c) 2005 UAlberta. All rights reserved.
 *
 *  Description.
 *		This file contains a simulation of the mountain and car dynamic system 
 *		EPISODIC
 *
 *  State: 2D Continous
 *  Actions: 1D discrete (0 1 2)
 */
#ifndef MOUNTAINCAR_H
#define MOUNTAINCAR_H

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "RLcommon.h"

//State variables
double mcar_position;
double mcar_velocity;

//Step variables
double mcar_min_position = -1.2;
double mcar_max_position = 0.6;
double mcar_max_velocity = 0.07;            // the negative of this is also the minimum velocity
double mcar_goal_position = 0.5;

bool mcar_goal();  // Is Car within goal region?

Observation o;				//instance of Sensation type
Reward_observation ro;				//instance of observation type
Task_specification task_spec;


#endif

   
