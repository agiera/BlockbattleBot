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
#include <set>

Task_specification g_specification; // placeholder for task specification

// initialize the environment and return task specification with holds
// a description of the problem size
Task_specification env_init()
{
  // test whether we can make two chains of sensors
  if( NR_AGENTS < 4 || NR_AGENTS % 2 != 0 )
  {
    fprintf( stderr, "(env_init) %s is an illegal number of agents\n",
             NR_AGENTS );
    exit(0);
  }

  g_o = new int[NR_STATES];    // observation = full state
  g_a = new int[NR_AGENTS];

  g_specification = new char[1024];
  char temp[50];
  
  // task specification is defined as V:E:0:A
  // V=0.9 (version)
  // E=1   (episodic task)
  // O=|x|_[0,0,..]_[0,4]_[0,4].. (|x| dim, discrete, 4 values per dimension)
  // A=|o|_[0,0,..]_[0,4]_[0,4].. (|o| dim, discrete, 3 values per dimension)

 sprintf( g_specification, "0.9:e:%d_[i", NR_STATES );
  for( int i = 0; i < NR_STATES - 1 ; i++ ) // -1: first is already entered
    strcat( g_specification, ",i" );        // all states discrete (0)
  strcat( g_specification, "]" );

  sprintf( temp, "_[0,%d]", START_ENERGY_LEVEL ); // create range of all states
  for( int i = 0; i < NR_STATES; i++ )
    strcat( g_specification, temp );

  sprintf( temp, ":%d_[i", NR_AGENTS );     // create action dimension
  strcat( g_specification, temp );          // add it
  for( int i = 0; i < NR_AGENTS - 1 ; i++ ) // -1: first is already entered
    strcat( g_specification, ",i" );        // all actions discrete (0)
  strcat( g_specification, "]" );
  for( int i = 0; i < NR_AGENTS; i++ )      // range of 3 actions (including 2)
    strcat( g_specification, "_[0,2]" );

  fprintf( stderr, "task spec: %s\n", g_specification );
  return g_specification;

}

// initialize the environment: place the targets randomly
Observation env_start()
{
  // reset the states
  for( int i = 0; i < NR_TARGETS; i++ )
    g_o[i] = 0;

  int r, iAttempts = 0, iMaxAttempts = 100;

  // place the targets randomly on the grid; only on empty spots
  for( int i = 0; i < NR_TARGETS; i++ )
  {
    r = (int)(rand() % NR_STATES);
    iAttempts = 0;
    while( g_o[r] != 0 && iAttempts < iMaxAttempts ) // if non-empty
    {
      r = (int)(rand() % NR_STATES);                 // try again
      iAttempts++;
    }

    if( iAttempts == iMaxAttempts )                  // failed iMaxAttempts
    {
      fprintf( stderr, "(env_start) Cannot find empty spot" );
      exit(0);
    }
    
    g_o[r] = START_ENERGY_LEVEL;                     // place target
  }

  return g_o;
}

// perform one step: calculate rewards and update energy levels targets
Reward_observation env_step( Action actions )   
{
  double reward = 0;
  for( int i = 0; i < NR_AGENTS; i++ )   // reset rewards
  {
    if( actions[i] != 0 )                // 0=do nothing, 1=focus left, 2=right
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
      if( actions[i*2] == 2 )     // left top selected right (2)
        s.insert(i*2);
      if( actions[i*2+1] == 2 )   // left bottom selected right (2)
        s.insert(i*2+1);
      if( actions[i*2+2] == 1 )   // right top selected left (1)
        s.insert(i*2+2);
      if( actions[i*2+3] == 1 )   // right bottom selected left (1)
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
      int r = rand() % 3, j=i;                      // take random action
                                                    // 0=nothing,1=left,2=right
      if( r == 1 )                                  // determine new state
        j = i - 1;
      else if( r == 2 )
        j = i + 1;
      if( i != j && g_o[j] == 0 )                   // check if empty
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
}
