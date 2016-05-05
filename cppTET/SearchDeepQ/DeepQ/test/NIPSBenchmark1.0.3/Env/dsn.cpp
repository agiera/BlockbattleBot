/*
 *  dsn.cpp
 *
 *  Created by Jelle Kok on Fri Oct 14 2005.
 *  Copyright (c) 2005 University of Amsterdam. All rights reserved.
 * 
 *  An implementation of a distributed sensor network. See dsn.h for a
 *  description. 
 *
 *  Episodic task, end of episode when all targets are captured.
 *  
 *  State:   1D discrete (size 4^m where m = number of targets)
 *  Actions: 1D discrete (size 3^n where n = number of agents)
 *
 */
#include "dsn.h"
#include <math.h>
#include <set>

Task_specification g_specification; // placeholder for task specification

/* Definition of random start states */
#define START_SET_DIM NR_STATES
#define START_SET_SIZE 50
long episode_ctr;

void generateRandomStart(int* start)
{
  int r, iAttempts = 0, iMaxAttempts = 100;

  // place the targets randomly on the grid; only on empty spots
  for( int i = 0; i < NR_TARGETS; i++ )
  {
    r = (int)(rand() % NR_STATES);
    iAttempts = 0;
    while( start[r] != 0 && iAttempts < iMaxAttempts ) // if non-empty
    {
      r = (int)(rand() % NR_STATES);                 // try again
      iAttempts++;
    }

    if( iAttempts == iMaxAttempts )                  // failed iMaxAttempts
    {
      fprintf( stderr, "(env_start) Cannot find empty spot" );
      exit(0);
    }
    
    start[r] = START_ENERGY_LEVEL;                     // place target
  }
}

int start_set[START_SET_SIZE][START_SET_DIM];
void env_set_random_seed(Random_seed_key rsk);
void generate_random_start_set(){
	// Hack
	env_set_random_seed(666);
/* 'generic' procedure for random settings in  max. 10 dimensions.
   problem specific adaption through specification of max min values
   in each dimension */

  for(int k = 0; k<START_SET_SIZE; k++){
  	generateRandomStart(start_set[k]);
  }
}

// initialize the environment and return task specification with holds
// a description of the problem size
Task_specification env_init()
{
    generate_random_start_set();
    episode_ctr = 0;

  // test whether we can make two chains of sensors
  if( NR_AGENTS < 4 || NR_AGENTS % 2 != 0 )
  {
    fprintf( stderr, "(env_init) %s is an illegal number of agents\n",
             NR_AGENTS );
    exit(0);
  }

  g_o             = new int[NR_STATES];    // observation = full state
  g_a             = new int[NR_AGENTS];
  g_actions       = new int[NR_AGENTS];
  g_specification = new char[1024];
  char temp[50];
  
  // task specification is defined as V:E:0:A
  // V=0.9 (version)
  // E=1   (episodic task)
  // O=|x|_[0,0,..]_[0,4]_[0,4].. (|x| dim, discrete, 4 values per dimension)
  // A=|o|_[0,0,..]_[0,4]_[0,4].. (|o| dim, discrete, 3 values per dimension)

  sprintf( g_specification, "0.9:1:%d_[i", NR_STATES );
  for( int i = 0; i < NR_STATES - 1 ; i++ ) // -1: first is already entered
    strcat( g_specification, ",i" );        // all states discrete (0)
  strcat( g_specification, "]" );

  sprintf( temp, "_[0,%d]", START_ENERGY_LEVEL ); // create range of all states
  for( int i = 0; i < NR_STATES; i++ )
    strcat( g_specification, temp );

#if SCALAR_ACTION
  sprintf( temp, ":1_[i]_[0,%d]", (int)pow(NR_ACTIONS,NR_AGENTS) );
  strcat( g_specification, temp );          
#else
  sprintf( temp, ":%d_[i", NR_AGENTS );     // create action dimension
  strcat( g_specification, temp );          // add it
  for( int i = 0; i < NR_AGENTS - 1 ; i++ ) // -1: first is already entered
    strcat( g_specification, ",i" );        // all actions discrete (0)
  strcat( g_specification, "]" );
  for( int i = 0; i < NR_AGENTS; i++ )      // range of 3 actions (including 2)
    strcat( g_specification, "_[0,2]" );
#endif
  sprintf( temp, ":%d,%d", -NR_AGENTS, NR_TARGETS*3*9); // Rmin, Rmax
  strcat( g_specification, temp );

  fprintf( stderr, "task spec: %s\n", g_specification );
  return g_specification;

}

// initialize the environment: place the targets randomly
Observation env_start()
{
  int start_state_number = episode_ctr % START_SET_SIZE;
  for(int i=0;i<START_SET_DIM;i++){ // default
    g_o[i] = start_set[start_state_number][i];
  }

  episode_ctr ++;

  return g_o;
}

// perform one step: calculate rewards and update energy levels targets
Reward_observation env_step( Action actions )   
{
#if SCALAR_ACTION
  g_actions = splitAction( actions );
#else
  for( int i = 0; i < NR_AGENTS; i++ )
    g_actions[i] = actions[i];
#endif
  double reward = 0;
  for( int i = 0; i < NR_AGENTS; i++ )   // reset rewards
  {
    if( g_actions[i] != 0 )              // 0=do nothing, 1=focus left, 2=right
      reward -= 1.0;                     // focusing has small cost
  }

  // determine reward
  for( int i = 0; i < NR_STATES; i++ )  // check all positions
  {
    // sensors are numbered from 0..m_iNragents -1 and ordered as
    //  0 2 4 6
    //  o o o o
    //   0 1 2
    //   x x x
    //  o o o o
    //  1 3 5 7
    
    if( g_o[i] > 0 )                       // if there is a target
    {
      std::set<int> s;

      // check whether it is hit by at least three neigboring sensors
      // neigboring sensors are lefttop (i*2), righttop (i*2+2),
      // leftbottom (i*2+1) and rightbottom (i*2+3)
      if( g_actions[i*2] == 2 )     // left top selected right (2)
        s.insert(i*2);
      if( g_actions[i*2+1] == 2 )   // left bottom selected right (2)
        s.insert(i*2+1);
      if( g_actions[i*2+2] == 1 )   // right top selected left (1)
        s.insert(i*2+2);
      if( g_actions[i*2+3] == 1 )   // right bottom selected left (1)
        s.insert(i*2+3);

      int iNr = 0;
      if( s.size() >= 3 )         // if enough focused
      {
        g_o[i]--;                 // decrease energy level
        if( g_o[i] == 0 )         // when deleted
        {
          std::set<int>::iterator iter;
          for( iter = s.begin(); iter != s.end(); iter++ )
          {
            if( iNr < 3 )           // reward at most three agents
            {
              iNr ++; 
              reward += 10;         //  give reward
            }
          }
        }
      }
    }
  }

  // state transition
  for( int i = 0; i < NR_STATES; i++ )
  {
    if( g_o[i] > 0 &&                               // if target and
        ( 
          ( i > 0 && g_o[i-1] == 0 ) ||             //  next of empty spot 
          ( i < NR_STATES-1 && g_o[i+1] == 0 ) 
        )
      ) 
    {
      int r = rand() % NR_ACTIONS, j=i;             // take random action
                                                    // 0=nothing,1=left,2=right
      if( r == 1 )                                  // determine new state
        j = i - 1;
      else if( r == 2 )
        j = i + 1;
      if( i != j && j >= 0 && j < NR_STATES &&      // if legal and empty
          g_o[j] == 0 )                   
      {
        g_o[j] = g_o[i];                            // move target
        g_o[i] = 0;
      }
    }
  }
  
  g_ro.r = reward;
  g_ro.o = g_o;
  g_ro.terminal = true;
  for( int i = 0 ; i < NR_STATES; i++ )
    if( g_o[i] != 0 )
      g_ro.terminal = false;
  
  return g_ro;  
}
 
void env_cleanup( )
{
  delete g_specification;
  delete [] g_o;
  delete [] g_a;
  delete [] g_actions;
}

char* env_get_name()
{
	return "DSN";
}

State_key env_get_state(){	
  return 0;
}

void env_set_state(State_key sk){
  printf("Env set state, key: %d\n",sk);
}

void env_set_random_seed(Random_seed_key rsk){
	srand48(rsk);
}

Random_seed_key env_get_random_seed(){
}	

#if SCALAR_ACTION
int getAction( ActionDim a )
{
  int iAction = 0;
  for( int i = 1; i < NR_AGENTS+1; i++ )
    iAction = iAction*NR_ACTIONS + a[i-1] ;
  return iAction;
}


// split a joint action into a factorized action
ActionDim splitAction( int a ) 
{
  for( int i = 1; i < NR_AGENTS + 1 ; i++ )
  {
    // split uses size as the number of joint actions of remaining agents
    int iActions = (int)pow((double)NR_ACTIONS, NR_AGENTS-i );
    g_actions[i-1]  = a/iActions;
    a -= g_actions[i-1]*iActions;
  }
  return g_actions;
}
#endif
