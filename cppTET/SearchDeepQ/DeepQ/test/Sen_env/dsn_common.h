/*
 *  dsn_common.h
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

#ifndef DSN_COMMON_H
#define DSN_COMMON_H

// specify which functions are defined
#define ENV_INIT
#define ENV_CLEANUP
#define AGENT_INIT
#define AGENT_CLEANUP

typedef int*   Observation;          // observation is array of pos targets 
typedef int*   Action;	             // action are different agent actions

typedef char*  Task_specification;   // define task specification
typedef double Reward;               // define reward

typedef struct {                     // define structure with 
  Reward      r;                     //  - reward
  Observation o;                     //  - observation
  bool        terminal;              //  - terminal state
} Reward_observation;

typedef int State_key;
typedef int Random_seed_key;

#endif
