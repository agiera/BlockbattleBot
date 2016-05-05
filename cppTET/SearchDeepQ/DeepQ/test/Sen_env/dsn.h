/*
 *  dsn.h
 *
 *
 *  Created by Jelle Kok on Fri Oct 14 2005.
 *  Copyright (c) 2005 University of Amsterdam. All rights reserved.
 *
 *  This problems specifies a distributed sensor network and is a
 *  sequential decision making variant of the distributed constraint
 *  optimization problem described in [1]. 
 * 
 *  The network consists of two chains of an arbitrary but equal
 *  number of sensors. Targets move between the two chains of sensors
 *  and one target is thus always located between four sensors. Each
 *  sensor is able to focus on the cell to its left (action 1) or to
 *  its right (action 2), or don't focus at all (action 0). When in
 *  one time step at least three of the four surrounding sensors focus
 *  on the target, it is 'hit'. Every focus action has a small cost.
 *  When a target is hit it looses some of its energy level. After
 *  three hits it is 'captured' and removed. This provides the system
 *  with a reward. Multiple targets move between the sensors so the
 *  sensors should coordinate their actions who to focus on. A target
 *  moves uniformly at random to an adjacent cell or remains on its
 *  current position. It is not possible for multiple targets to
 *  occupy the same cell. The state space is relatively small,
 *  however, the action space is big, especially when it is modeled as
 *  one big joint action (3 to the power of the number of
 *  agents/sensors).
 * 
 *  Sample configuration o=sensor, x=possible location of a target.  A
 *  problems has 4^|x| states (since each x has 4 possible values: 0
 *  when there is no target and 1-3 for one target with different
 *  energy levels). Each sensors can perform 3 actions (focus on
 *  position on the left / right and don't focus) so the complete
 *  action space is 3^|o|. 
 * 
 *   0 2 4 6 ...
 *   o o o o ...
 *    x x x  ...
 *   o o o o ...
 *   1 3 5 7 ...
 *
 * [1] Preprocessing Techniques for Accelerating the DCOP Algorithm
 * ADOPT Syed Muhammad Ali, Sven Koenig, Milind Tambe. AAMAS'05.
 * 
 */


#ifndef DSN_H
#define DSN_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include "RLcommon.h"

// specify the size of the problem

#define NR_AGENTS          8 // total number of sensors in grid (>4, %2==0)
#define NR_TARGETS         2 // number of targets
#define START_ENERGY_LEVEL 3 // starting energy level for a target
#define NR_STATES          (NR_AGENTS/2-1) // number of target positions

// Global variables
Observation         g_o;
Action              g_a;
Reward_observation  g_ro;

#endif

   
