/*
 *  CartPole.h
 *  
 *
 *  Created by Martin Riedmiller
 *  Modified by Timothy Edmunds
 */

#ifndef  CARTPOLE_H
#define CART_POLE_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include "RLcommon.h"

Reward getReward();  
bool is_terminal();

void compute_next_state(const Observation state, const Action action, double* next_state);

Observation current_state;
Reward_observation current_reward_observation;

#endif
