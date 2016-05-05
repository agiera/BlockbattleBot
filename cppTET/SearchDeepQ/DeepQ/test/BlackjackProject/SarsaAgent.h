/*********************************************************************************
 *  SarsaAgent.h
 *  
 *
 *  Created by Adam White on Fri Aug 10 2005.
 *  Copyright (c) 2005 UAlberta. All rights reserved.
 * 
 *  A simple tabluar agent that uses sarsa or Q-learning policy iteration.
 *  Desgined for Episodic tasks. This implementation has been tuned to
 *  the Blackjack problem
 *  
 *  State: Integer Single Dimension
 *  Actions: Integer Single dimension (0,1)
 *
 **********************************************************************************/ 

#ifndef SARSAAGENT_H
#define SARSAAGENT_H

#include <stdio.h>
#include <stdlib.h>
#include "RLcommon.h"

const int numStates = 22*12*2;		// Set to the state size of the problem
const int numActions = 2; 			//number of actions

int A;								//index of last action taken
int S;								//index of last state/sensation observed

double Q[numStates][numActions];	//action value function

double alpha;						//step-size parameter
double epsilon;						//exploration probability parameter

//Helper functions
int get_state(Observation o);
int egreedy(int s);
int argmax(int s); 

#endif
