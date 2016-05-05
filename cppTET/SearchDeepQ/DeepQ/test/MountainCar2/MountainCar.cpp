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
#include "MountainCar.h"

Task_specification env_init()
{
    o = new double[2];
	task_spec = new char[1000];
    char position[40], velocity[40];

    sprintf(position,"[%f,%f]",mcar_min_position,mcar_max_position);
    sprintf(velocity,"[%f,%f]",-mcar_max_velocity,mcar_max_velocity);
    
    sprintf(task_spec,"1:e:2_[f,f]_%s_%s:1_[i]_[0,2])",position,velocity);
    return task_spec;
}

Observation env_start()
{
	mcar_position = (drand48()*(mcar_max_position + fabs(mcar_min_position))) - fabs(mcar_min_position);
	mcar_velocity = (drand48()*mcar_max_velocity*2) - fabs(mcar_max_velocity);
  
    o[0] = mcar_position;
    o[1] = mcar_velocity;
    
    return o;
}

Reward_observation env_step(Action a)   
{	
	if(a<0 || a>2)
	{
		printf("Invalid action: %d, taking random action\n",a);
		a = (int)drand48()*3;
	}
	
    mcar_velocity += (a-1)*0.001 + cos(3*mcar_position)*(-0.0025);
    if (mcar_velocity > mcar_max_velocity) mcar_velocity = mcar_max_velocity;
    if (mcar_velocity < -mcar_max_velocity) mcar_velocity = -mcar_max_velocity;
    mcar_position += mcar_velocity;
    if (mcar_position > mcar_max_position) mcar_position = mcar_max_position;
    if (mcar_position < mcar_min_position) mcar_position = mcar_min_position;
    if (mcar_position==mcar_min_position && mcar_velocity<0) mcar_velocity = 0;
  
    o[0] = mcar_position;
    o[1] = mcar_velocity;
    ro.o = o;
	ro.r = -1;
    ro.terminal = false;
    
    if(mcar_goal())
        ro.terminal = true;
    
    return ro;
}   

void env_cleanup()
{
	delete o;
	delete task_spec;
	
}

bool mcar_goal()  // Is Car within goal region?
{
  return mcar_position >= mcar_goal_position;
}