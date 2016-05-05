/*
 *  MountainCarSV.h
 *  
 *  Created by Rich Sutton, modified by Adam White on September 20 2005.
 *  Modified by Andrew Butcher on July 27, 2006
 *  Copyright (c) 2005 UAlberta. All rights reserved.
 *
 *  Description.
 *		This file contains a simulation of the mountain and car dynamic system 
 *		EPISODIC
 *
 *  State: 2D Continous
 *  Actions: 1D discrete (0 1 2)
 */
#ifndef MOUNTAINCARSV_H
#define MOUNTAINCARSV_H

#include <cstdio>
#include <ctime>
#include <cstring>
#include <cstdlib>
#include <cerrno>
#include <cmath>
#include "RLcommon.h"

/*
//Step variables
#define mcar_min_position -1.2
#define mcar_max_position 0.6
#define mcar_max_velocity 0.07            // the negative of this is also the minimum velocity
#define mcar_goal_position 0.5
#define POS_WIDTH (1.7 / 8)               // the tile width for position
#define VEL_WIDTH (0.14 / 8)              // the tile width for velocity

//State variables
extern double mcar_position;
extern double mcar_velocity;

extern int env_count;

extern const int numActions;// = 3;
extern const int stateSize;// = 2;

extern Observation o;				//instance of Sensation type
extern Reward_observation ro;				//instance of observation type
*/

bool mcar_goal();  // Is Car within goal region?

#endif

   
