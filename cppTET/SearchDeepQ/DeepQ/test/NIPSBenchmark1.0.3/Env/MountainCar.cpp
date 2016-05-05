/*
 *  BenchmarkPlant.cpp
 *  
 *
 *  Created by Martin Riedmiller
 *  Copyright (c) 2005 UAlberta. All rights reserved.
 * 
 *  Modified by Timothy Edmunds
 */

#include "MountainCar.h"
#include <math.h>


//Step variables
#define mcar_min_position -1.2
#define mcar_max_position 0.6
#define mcar_max_velocity 0.07            // the negative of this is also the minimum velocity
#define mcar_goal_position 0.5

/* Definition of random start states */
#define START_SET_DIM 6
#define START_SET_SIZE 50
long episode_ctr;

double start_set[START_SET_SIZE][START_SET_DIM];

void env_set_random_seed(Random_seed_key rsk);

void generate_random_start_set(){
	// Hack
	env_set_random_seed(666);
/* 'generic' procedure for random settings in  max. 10 dimensions.
   problem specific adaption through specification of max min values
   in each dimension */

  double min[START_SET_DIM];
  double max[START_SET_DIM];

  for(int i= 0; i<START_SET_DIM; i++){
    min[i] = 0.0;
    max[i] = 0.0;
  }
  // problem specific definition:
  min[0] = -1.1;
  max[0] = 0.49;

  for(int k = 0; k<START_SET_SIZE; k++){
    for(int i = 0; i<START_SET_DIM; i++){
      start_set[k][i]=drand48() * (max[i]-min[i]) + min[i];
    }
  }
}


Task_specification env_init()
{    
#define STATE_DIM 2
    generate_random_start_set();
    episode_ctr = 0;
    // For NIPS, in continuous environments, the current_state is an array of doubles
    current_state = new double[STATE_DIM];


    // Return task specification:
    char* Task_spec = new char[100];
    char temp[50];
    strcpy(Task_spec,"1:e");
    sprintf(temp,":%d", STATE_DIM); // number of 'f's depends on number of dimensions
    strcat(Task_spec,temp);

    sprintf(temp,"_[f,f]"); // number of 'f's depends on number of dimensions
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",mcar_min_position,mcar_max_position); // min max for dim 1 can be written here
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",-mcar_max_velocity,mcar_max_velocity); // min max for dim 2 can be written here
    strcat(Task_spec,temp);
    sprintf(temp,":1_[i]");
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",-1.0,1.0); // min max for actions can be written here
    strcat(Task_spec,temp);
    sprintf(temp,":%f,%f",-1.0,0.0); // Rmin, Rmax
    strcat(Task_spec,temp);
    sprintf(temp,"\0");
    strcat(Task_spec,temp);
    return Task_spec;
}
  
Observation env_start()
{   
  int start_state_number = episode_ctr % START_SET_SIZE;
  for(int i=0;i<STATE_DIM;i++){ // default
    current_state[i] = start_set[start_state_number][i];
  }

  // for debugging only.
/*  printf("Environment. Start episode %d, starting with start state: %d\n", episode_ctr, start_state_number);
  for (int i=0; i<STATE_DIM;i++){
    printf("%.4f  ", current_state.continuous[i]);
  }
  printf("\n");*/

  episode_ctr ++;
  return current_state;
}

void compute_next_state(const Observation state, const Action action, double* next_state){
//State variables
  double mcar_position;
  double mcar_velocity;

  mcar_position = state[0];
  mcar_velocity = state[1];

  // In NIPS, the action is always a single int
  mcar_velocity += (action)*0.001 + cos(3*mcar_position)*(-0.0025);
  if (mcar_velocity > mcar_max_velocity) mcar_velocity = mcar_max_velocity;
  if (mcar_velocity < -mcar_max_velocity) mcar_velocity = -mcar_max_velocity;
  mcar_position += mcar_velocity;
  if (mcar_position > mcar_max_position) mcar_position = mcar_max_position;
  if (mcar_position < mcar_min_position) mcar_position = mcar_min_position;
  if (mcar_position==mcar_min_position && mcar_velocity<0) mcar_velocity = 0;

  next_state[0]= mcar_position;
  next_state[1]= mcar_velocity;
}

Reward_observation env_step(Action a)
{    
  //  printf("Environment step\n");
  double next_state[STATE_DIM];
  compute_next_state(current_state, a, next_state);
  for(int i=0;i<STATE_DIM;i++)
    current_state[i] = next_state[i];

 // perpare return values;
 current_reward_observation.o	= current_state;
 current_reward_observation.r = getReward();
 current_reward_observation.terminal = is_terminal();
 return current_reward_observation;
}

bool is_terminal(){
  return current_state[0] >= mcar_goal_position;
}

Reward getReward()
{
  if(current_state[0] >= mcar_goal_position)
    return 0; // at goal
  return -1;
}

void env_cleanup()
{
	delete [] current_state;
}

char* env_get_name()
{
	return "MountainCar";
}

State_key env_get_state(){
	return 0;
}

void env_set_state(int sk){
  // This doesn't do anything
}

void env_set_random_seed(Random_seed_key rsk){
		srand48(rsk);
}

Random_seed_key env_get_random_seed(){
	Random_seed_key rs;
	return rs;
}	
