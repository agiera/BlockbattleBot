/*
 *  acrobot.h
 *  
 *  Created by Adam White on September 20 2005.
 *  Copyright (c) 2005 UAlberta. All rights reserved.
 *
 *	Description:
 *		Force is applied at the junction between the two links (Sutton in 1996), and from a horizontal double-arm pendulum 
 *		(where the main link rotates in the horizontal plane, and the secondary link rotates vertically with respect to the main link). 
 *		EPISODIC
 *	
 *		Rewards are zero everywhere but in the balanced region.
 *
 *  State: 4D continuous values
 *  Actions: 1D (0,1,2)
 */
#ifndef ACROBOT_H
#define ACROBOT_H



#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <math.h>
#include "RLcommon.h"

//step function -problem- contants
int numActions = 3;

//termination condition variables
double env_goal = 1.0;
double position;

double const mp = 3.14159265;
double const mp2 =  1.5707963;

//goal condition
bool acrobotGoal();

Observation o;				//instance of Sensation type
Reward_observation ro;				//instance of Observation type

#endif

   
