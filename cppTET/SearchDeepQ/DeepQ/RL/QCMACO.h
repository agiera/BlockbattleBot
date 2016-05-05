/*
 *  carAgent.h
 *  
 *
 *  Created by Adam White on 24/02/06.
 *  Copyright 2006 __MyCompanyName__. All rights reserved.
 *
 */
 #include <iostream>
#include "tiles.h"
#include "stdio.h"
#include "stdlib.h"
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <math.h>
#include "RLcommon.h"

#ifndef AGENT_H
#define AGENT_H


#define NUM_ACTIONS 3                            // number of actions


int option_count = 0;
double option_reward;
#define num_options  13
int option_len[num_options];
int option_action[num_options];

double POS_WIDTH = (1.7 / 8);               // the tile width for position
double VEL_WIDTH = (0.14 / 8);              // the tile width for velocity

#define MEMORY_SIZE 10000                        // number of parameters to theta, memory size
#define NUM_TILINGS 14
#define MAX_NONZERO_TRACES 1000
int nonzero_traces[MAX_NONZERO_TRACES];
int num_nonzero_traces = 0;
int nonzero_traces_inverse[MEMORY_SIZE];
float minimum_trace = 0.01;

double h[MEMORY_SIZE];
double b[MEMORY_SIZE];
double al[MEMORY_SIZE];
double th;
double tmp;

// Global RL variables:
double Q[NUM_ACTIONS];                            // action values
int feats[MEMORY_SIZE];
double theta[MEMORY_SIZE];                        // modifyable parameter vector, aka memory, weights
double e[MEMORY_SIZE];                            // eligibility traces
int F[NUM_ACTIONS][NUM_TILINGS];                 // sets of features, one set per action

float state_vars[2];							 //temp array
double oldO[2];

int actionsV[NUM_ACTIONS];

// Standard RL parameters:
double epsilon = 0.1;                    // probability of random action
double alpha = 0.1;                      // step size parameter
double lambda = 0.9;                     // trace-decay parameters
#define gamma  1.0                      // discount-rate parameters

int oldAction;						//action selected on previous time step
int newAction;						//action selected on current time step

void loadQ();                                    // compute action values for current theta, F
void loadQ(int a);                               // compute one action value for current theta, F
void loadF(double oo[2]);                                    // compute feature sets for current state
int argmax(double Q[NUM_ACTIONS]);              // compute argmax action from Q

void ClearTrace(int f);                          // clear or zero-out trace, if any, for given feature
void ClearExistentTrace(int f, int loc);         // clear trace at given location in list of nonzero-traces

void DecayTraces(float decay_rate);              // decay all nonzero traces
void SetTrace(int f, float new_trace_value);     // set trace to given value
void IncreaseMinTrace();                         // increase minimal trace value, forcing more to 0, making room for new ones

#endif
