/*
A simplified version of Backgammon based on Section 5.1 of Sutton and Barto's book.
Designed to be compatable with the RL-framework

This implementation differs from the description in the book in only one respect:
The episode does *not* terminate immediately if the player receives a "natural" 
(i.e. a 21 from the first two cards).  Hence, a player is always allowed to hit
on a hand of 21.  This alteration is necessary to prevent episodes from beginning
in terminal states, as required by the RL-framework.

Written by Shimon Whiteson (shimon@whiteson.org)
Modified by Timothy Edmunds
*/

#include "Blackjack.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

using namespace std;

/* Definition of random start states */
#define START_SET_DIM 4
#define START_SET_SIZE 50
long episode_ctr;

void generateRandomStart(int* start)
{
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
  
  start[0] = playerTotal;
  start[1] = dealerTotal;
  start[2] = playerUsableAce;
  start[3] = dealerUsableAce;
}

int start_set[START_SET_SIZE][START_SET_DIM];
void env_set_random_seed(Random_seed_key rsk);
void generate_random_start_set(){
	// Hack
	env_set_random_seed(666);
/* 'generic' procedure for random settings in  max. 10 dimensions.
   problem specific adaption through specification of max min values
   in each dimension */

  for(int k = 0; k<START_SET_SIZE; k++){
  	generateRandomStart(start_set[k]);
  }
}

Task_specification env_init()
{
    generate_random_start_set();
    episode_ctr = 0;

  // initialize reward and observation
  // We know for NIPS that Observation is an array of ints
  observation = new int[3];
  rewOb.r = 0;
  rewOb.o = observation;
  rewOb.terminal = false;

    // Return task specification:
    char* Task_spec = new char[1000];
    char temp[500];
    strcpy(Task_spec,"1:e");
    sprintf(temp,":%d", 3); // number of 'i's depends on number of dimensions
    strcat(Task_spec,temp);

    sprintf(temp,"_[i,i,i]"); // number of 'i's depends on number of dimensions
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",4.0,21.0); // min max for dim 1 can be written here
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",2.0,11.0); // min max for dim 2 can be written here
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",0.0,1.0); // min max for dim 3 can be written here
    strcat(Task_spec,temp);
    sprintf(temp,":1_[i]");
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",0.0,1.0); // min max for actions can be written here
    strcat(Task_spec,temp);
    sprintf(temp,":%f,%f",-1.0,1.0); // Rmin, Rmax
    strcat(Task_spec,temp);
    sprintf(temp,"\0");
    strcat(Task_spec,temp);
	
	
    return Task_spec;
}
  
Observation env_start()
{   
  int start_state_number = episode_ctr % START_SET_SIZE;
  playerTotal = start_set[start_state_number][0];
  dealerTotal = start_set[start_state_number][1];
  playerUsableAce = start_set[start_state_number][2];
  dealerUsableAce = start_set[start_state_number][3];

  episode_ctr ++;

  // update and return observation
  setObservation();
  return observation;
}

void env_cleanup()
{
	delete [] observation;
}

char* env_get_name()
{
	return "Blackjack";
}

State_key env_get_state(){	
  return 0;
}

void env_set_state(State_key sk){
  printf("Env set state, key: %d\n",sk);
}

void env_set_random_seed(Random_seed_key rsk){
	srand48(rsk);
}

Random_seed_key env_get_random_seed(){
}	

Reward_observation env_step(Action a)  {  
	rewOb.terminal = false;
	rewOb.r = 0;
  // player hits
  // We know for NIPS that Action is an int
  if (a == 0) {
    // deal player another card
    addCard(playerTotal,playerUsableAce);

    // check if player is bust
    if (playerTotal > 21) {
      rewOb.r = -1;
      rewOb.terminal = true;
    }
    
  }

  // player sticks
  else if (a == 1) {
    // deal dealer cards until he hits 17 or higher
    while (dealerTotal < 17)
      addCard(dealerTotal,dealerUsableAce);

    // check to see who won
    if (dealerTotal > 21 || dealerTotal < playerTotal)
      rewOb.r = 1; // player won
    else if (dealerTotal == playerTotal)
      rewOb.r = 0; // draw
    else
      rewOb.r = -1; // dealer won

    rewOb.terminal = true;
  }

  // update and return observation and reward
  setObservation();
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

