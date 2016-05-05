/*
 *  PuddleWorld.h
 *  
 */

#ifndef PUDDLEWORLD_H
#define PUDDLEWORLD_H

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
