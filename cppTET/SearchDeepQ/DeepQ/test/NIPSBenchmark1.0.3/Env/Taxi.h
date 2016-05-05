#ifndef TAXI_H
#define TAXI_H

#include "RLcommon.h"

// global observation and reward variables
Observation observation;
Reward_observation rewOb;

// global state information
int taxi;
int pass;
int dest;

// update global obvservation variable
void setObservation();

#endif

   

