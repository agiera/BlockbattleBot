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
#include "MountainCarOld.h"

Task_specification env_init()
{

    current_observation = new double[state_size];

    env_task_spec = new char[1000];
    char position[200], velocity[200];
    
    sprintf(position,"[%f,%f]",mcar_min_position,mcar_max_position);
    sprintf(velocity,"[%f,%f]",-mcar_max_velocity,mcar_max_velocity);
    
    sprintf(env_task_spec,"1:e:%d_[f,f]_%s_%s:1_[i]_[0,%d]",state_size,position,velocity,num_actions-1);
    return env_task_spec;
}

Observation env_start()
{

#ifdef RANDOM
	set_initial_position_random();
#else	
	set_initial_position_at_bottom();
#endif
	  
    current_observation[0] = mcar_position;
    current_observation[1] = mcar_velocity;

	current_num_steps = 0;
	
    return current_observation;
}

Reward_observation env_step(Action a)   
{	
	
    current_num_steps++;

	update_velocity(a);
	update_position();
	
	ro.r = -1;
	ro.terminal = false;
		
	test_termination();

    current_observation[0] = mcar_position;
    current_observation[1] = mcar_velocity;
	ro.o = current_observation;
	    
    return ro;
}   

void env_cleanup()
{
	delete current_observation;
	delete env_task_spec;
}

//Helper functions ----------------------------------------------
void test_termination()  
{
	if (mcar_position >= mcar_goal_position) 
	{
 		//ro.r = 1000;
		ro.terminal = true;
	}
	else if(current_num_steps > max_steps)
        ro.terminal = true;

}

void set_initial_position_at_bottom()
{
	mcar_position = -M_PI/6.0; 
    mcar_velocity = 0.0; 
}

void set_initial_position_random()
{
	mcar_position = (drand48()*(mcar_goal_position + fabs(mcar_min_position)) + mcar_min_position);
    mcar_velocity = (drand48()*(mcar_max_velocity*2) - mcar_max_velocity);
}


void update_velocity(Action action)
{
	mcar_velocity += (action-1)*0.001 + cos(3*mcar_position)*(-0.0025);
    if (mcar_velocity > mcar_max_velocity) mcar_velocity = mcar_max_velocity;
    if (mcar_velocity < -mcar_max_velocity) mcar_velocity = -mcar_max_velocity;
}

void update_position()
{
	mcar_position += mcar_velocity;
	if (mcar_position > mcar_max_position) mcar_position = mcar_max_position;
	if (mcar_position < mcar_min_position) mcar_position = mcar_min_position;
    if (mcar_position==mcar_min_position && mcar_velocity<0) mcar_velocity = 0;	
}
