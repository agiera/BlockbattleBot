/*
 *  YahtzeeSortedFull.h
 *
 *  Created by Andrea Bonarini, Alessandro Lazaric, Marcello Restelli
 *  Copyright (c) 2005 Politecnico di Milano. All rights reserved.
 * 
 *  A simplified version of Yahtzee. For details about Yahtzee and its rules
 *  please refer to http://www.hasbro.com/common/instruct/Yahtzee.pdf. For
 *  details about this implementation of yahtzee refer to the paper
 *  be published in the proceedings of the "Reinforcement Learning Benchmarks 
 *  and Bake-offs II" workshop at NIPS 2005.
 * 
 *  Sorted version: consists of 19 variables. One is related to the number of rolls
 *  performed in the current round. Thirteen are binary variables that store 0 if
 *  the category has not yet been played, and 1 otherwise. The remaining 5 variables
 *  represent the current values of the dice, sorted in ascending order (e.g., if we
 *  roll $<2,6,6,2,4>$, the five variables assume the following values:
 *  $<2,2,4,6,6>$ ). The size of this state space is about $0,19\cdot 10^{9}$.
 * 
 *  Full version: the available configurations are the same as in the
 *  original game.
 *  
 *  State:   19 discrete variables
 *  Actions:  1 discrete variable
 *
 */

#ifndef YAHTZEE_H
#define YAHTZEE_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <map>
#include "RLcommon.h"

using namespace std;

/**
 * Points obtained with special configuration
 */
#define FULL_VALUE      25
#define SMALL_VALUE     30
#define LARGE_VALUE     40
#define YAHTZEE_VALUE   50

// the number of dice
#define NUMBER_OF_DICE 5

// the number of configurations
#define NUMBER_OF_COMBO 13

#define COMBO_ONES     0
#define COMBO_TWOS     1
#define COMBO_THREES   2
#define COMBO_FOURS    3
#define COMBO_FIVES    4
#define COMBO_SIXES    5
#define COMBO_TRIS     6
#define COMBO_POKER    7
#define COMBO_FULL     8
#define COMBO_SMALL    9
#define COMBO_LARGE   10
#define COMBO_CHANCE  11
#define COMBO_YAHTZEE 12


// the inner configuration of the game, it is independent with
// the specific state representation used
struct YahtzeeEnv
{
    // the number of times the dice can be re-rolled (0..3)
    unsigned int mReroll;

    // whether the i-th configuration has been selected
    bool mIsAvailableCombo[NUMBER_OF_COMBO];

    // the current values of dice
    unsigned int mDice[NUMBER_OF_DICE];

}
gYahtzeeEnv;

/**
 * Global state information.
 */

// the number of state variables
#define STATE_SIZE 19

#define STATE_REROLL         0
#define STATE_AVAIL_ONES     1
#define STATE_AVAIL_TWOS     2
#define STATE_AVAIL_THREES   3
#define STATE_AVAIL_FOURS    4
#define STATE_AVAIL_FIVES    5
#define STATE_AVAIL_SIXES    6
#define STATE_AVAIL_TRIS     7
#define STATE_AVAIL_POKER    8
#define STATE_AVAIL_FULL     9
#define STATE_AVAIL_SMALL   10
#define STATE_AVAIL_LARGE   11
#define STATE_AVAIL_CHANCE  12
#define STATE_AVAIL_YAHTZEE 13
#define STATE_DICE1         14
#define STATE_DICE2         15
#define STATE_DICE3         16
#define STATE_DICE4         17
#define STATE_DICE5         18

// the state space
struct
{
    int mState[STATE_SIZE];
}
gYahtzeeState;

/**
 * Global action information
 */
// The identifiers for the actions available to the player
#define A_Reroll        0
#define A_Ones          1
#define A_Twos          2
#define A_Threes        3
#define A_Fours         4
#define A_Fives         5
#define A_Sixes         6
#define A_Tris          7
#define A_Poker         8
#define A_Full          9
#define A_Small         10
#define A_Large         11
#define A_Chance        12
#define A_Yahtzee       13

/**
 * Global observation and reward
 */
// Global observation vector
Observation gObservation;

// Global reward variable
Reward_observation gRewardOb;

/**
 * Useful methods
 */
// Roll dice
void castDice();

// Compute the reware according to the current state and the
// chosen action
void computeReward(Action a);

// Compute the result of taking action "a" and the reward (i.e. the points)
// obtained by the player
void getNextPosition(Action a);

// Return true when there are no more available configurations
bool isTerminal();

// Update global obvservation variable
void setObservation();

// Print the values of the state variables, of the observation and of the reward
void printState();

#endif
