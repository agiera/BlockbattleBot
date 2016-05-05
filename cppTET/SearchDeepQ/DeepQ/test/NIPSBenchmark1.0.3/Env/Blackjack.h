#ifndef BLACKJACK_H
#define BLACKJACK_H

#include "RLcommon.h"

// global observation and reward variables
Observation observation;
Reward_observation rewOb;

// global state information
int playerTotal; // current value of player's hand
int dealerTotal; // current value of dealer's hand

bool playerUsableAce; // whether the player has a usable ace
bool dealerUsableAce; // whether the agent has a usable ace

// update global obvservation variable
void setObservation();

// add a new card to a player's total, handle usuable aces
void addCard(int& total, bool& usableAce);

#endif

   

