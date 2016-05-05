/*
 *  MountainCar.cpp
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
#include "MountainCarSV.h"
#include <iostream>
using namespace std;

//Step variables
const double mcar_min_position = -1.2;
const double mcar_max_position = 0.6;
const double mcar_max_velocity = 0.07;            // the negative of this is also the minimum velocity
const double mcar_goal_position = 0.5;
const double POS_WIDTH = 1.7 / 8.0;               // the tile width for position
const double VEL_WIDTH = 0.14 / 8.0;              // the tile width for velocity

const int numActions = 3;
const int stateSize = 2;
const int maxSteps = 100000;

double mcar_position = 0;
double mcar_velocity = 0;

int env_count = 0;

Observation o = 0;
Reward_observation ro;

Task_specification env_init()
{

  o = new double[stateSize];
  mcar_position = -0.5;
  mcar_velocity = 0.0;
  
  Task_specification ret = new char[1000];
  char position[30], velocity[30];
  
  sprintf(position,"[%f,%f]",mcar_min_position,mcar_max_position);
  sprintf(velocity,"[%f,%f]",-mcar_max_velocity,mcar_max_velocity);
  
  sprintf(ret,"1:e:2_[f,f]_%s_%s:1_[i]_[0,2] %f, %f",position,velocity, -100.0, 100.0);
  return ret;
}

Observation env_start()
{
  cout << endl << env_count << endl;
  env_count = 0;
  mcar_position = -0.5;
  mcar_velocity = 0.0;
  
  o[0] = mcar_position;
  o[1] = mcar_velocity;
    
  return o;
}

Reward_observation env_step(Action a)   
{
// 	cout << "A[" << a << "]" << flush;
  double noise = 1 - drand48(); 
  if ( noise < 0.0001 )
    noise = 0.0001;
	
double offset = (-drand48()*0.05 + drand48()*.05)/2.0;
	
offset = 0;

  env_count += 1;
  
  mcar_velocity += (a-1)*0.001*noise + cos(3*mcar_position)*(-0.0025) + offset;
  if (mcar_velocity > mcar_max_velocity) mcar_velocity = mcar_max_velocity;
  if (mcar_velocity < -mcar_max_velocity) mcar_velocity = -mcar_max_velocity;
  
  mcar_position += mcar_velocity;
  if (mcar_position > mcar_max_position) mcar_position = mcar_max_position;
  if (mcar_position < mcar_min_position) mcar_position = mcar_min_position;
  if (mcar_position==mcar_min_position && mcar_velocity<0) mcar_velocity = 0;
  
  o[0] = mcar_position;
  o[1] = mcar_velocity;

  ro.o = o;
  //ro.r = -0.1;
  //ro.r = 0;
  ro.r = -1;
  ro.terminal = false;
  
  if(mcar_goal())
  {
    ro.r = 100;
    ro.terminal = true;
  }
  else if(env_count > maxSteps)
  {
    ro.r = -100;
//     ro.r = -1;
    ro.terminal = true;
  }
    
//   cout << "O[" << o[0] << "," << o[1] << "]" << flush;
  return ro;
}   

void env_cleanup()
{
  delete [] o;
  o = 0;
}

bool mcar_goal()  // Is Car within goal region?
{
  return mcar_position >= mcar_goal_position;
}
