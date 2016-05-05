/*
 *  MountainCar.h
 *  
 *
 *  Created by Martin Riedmiller
 *  Modified by Timothy Edmunds
 */

#ifndef  MOUNTAIN_CAR_H_
#define MOUNTAIN_CAR_H_

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include "RLcommon.h"

Reward getReward();  
bool is_terminal();

Observation current_state;
Reward_observation current_reward_observation;

#endif
