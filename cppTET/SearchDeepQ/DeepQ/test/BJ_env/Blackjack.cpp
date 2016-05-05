/*
A simplified version of Backgammon based on Section 5.1 of Sutton and Barto's book.
Designed to be compatable with the RL-framework

This implementation differs from the description in the book in only one respect:
The episode does *not* terminate immediately if the player receives a "natural" 
(i.e. a 21 from the first two cards).  Hence, a player is always allowed to hit
on a hand of 21.  This alteration is necessary to prevent episodes from beginning
in terminal states, as required by the RL-framework.

Written by Shimon Whiteson (shimon@whiteson.org)
*/

#include "Blackjack.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


using namespace std;
double usewin=0;
double totalgame=0;

Task_specification env_init()
{
	char* ts = new char[10000];
	strcpy(ts,"0.9:e:3_[i,i,i]_[0,21]_[0,11]_[0,1]:1_[i]_[0,1]");
	
	return ts;
}

Observation env_start() {
  // initialize reward and observation
  rewOb.r = 0;
  rewOb.o = observation;
  rewOb.terminal = false;

  // initialize global state variables
  playerTotal = 0;
  dealerTotal = 0;
  playerUsableAce = false;
  dealerUsableAce = false;

  // deal player two cards
  addCard(playerTotal,playerUsableAce);
  addCard(playerTotal,playerUsableAce);

  // deal dealer one card (face up)
  addCard(dealerTotal,dealerUsableAce);

  // update and return observation
  setObservation();
  
  totalgame++;
  
  return observation;
}

Reward_observation env_step(Action a)  {  
  if (a == 0) {
    // deal player another card
    addCard(playerTotal,playerUsableAce);

    // check if player is bust
    if (playerTotal > 21) {
      rewOb.r = -1;
      rewOb.terminal = true;
    }
	
	if(playerTotal == 21 && dealerTotal == 21)
	{
		rewOb.r = 0;
		rewOb.terminal = 1;
	}
	else if(playerTotal == 21)
	{
		rewOb.r = 1;
		rewOb.terminal = 1;
		usewin++;

	}	
  }
  // player sticks
  else if (a == 1) {
    // deal dealer cards until he hits 17 or higher
    while (dealerTotal < 17)
      addCard(dealerTotal,dealerUsableAce);

    // check to see who won
    if (dealerTotal > 21 || dealerTotal < playerTotal){
      rewOb.r = 1; // player won
		usewin++;
	}
    else if (dealerTotal == playerTotal)
      rewOb.r = 0; // draw
    else
      rewOb.r = -1; // dealer won
	     
	rewOb.terminal = true;
  }

  // update and return observation and reward
  setObservation();
  rewOb.o = observation;
  return rewOb;
}   

// update global obvservation variable
void setObservation() {
  observation[0] = playerTotal;
  observation[1] = dealerTotal;
  observation[2] = playerUsableAce;
}

// add a new card to a player's total, handle usuable aces
void addCard(int& total, bool& usableAce) {
  // draw a new card
  int card = 1 + rand() % 13;
  
  // if it's a face card, its value is 10
  if (card > 10)
    card = 10;

  // update total
  total += card;

  // if the player went bust, check for a usable ace
  // if it exists, change its value from 11 to 1
  if (total > 21 && usableAce) {
    total -= 10;
    usableAce = false;
  }

  // if the new card is an ace, check if its usable
  if (card == 1 && total < 12) {
    usableAce = true;
    total += 10;
  }
}

void env_cleanup()
{
	printf("percent = %f\n",usewin/totalgame);
}
