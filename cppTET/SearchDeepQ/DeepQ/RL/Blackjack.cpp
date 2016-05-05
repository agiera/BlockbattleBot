/*********************************************************************************
 *  Blackjack.cpp
 *  
 *
 *  Created by Shimon Whiteson, modified by Adam White. 
 * 
 *	A simplified version of Backgammon based on Section 5.1 of Sutton and Barto's book.
 *	http://www.cs.ualberta.ca/%7Esutton/book/ebook/node51.html 
 *
 *	This implementation differs from the description in the book in only one respect:
 *	The episode does *not* terminate immediately if the player receives a "natural" 
 *	(i.e. a 21 from the first two cards).  Hence, a player is always allowed to hit
 *	on a hand of 21. The environment "Remembers" if the player gets a natural and 
 *	awards a win to the player if the player sticks on the natural and the dealer does 
 *	not also get a natural.
 *
 *  Episodic task
 *	Reward: (in terminal state) -1 for a lose, 0 for draw, +1 for win
 *			0 otherwise
 *	Actions: Discrete: 0 "hit", 1 "stick"
 *	Observation: 3D discrete
 *						players sum of cards (0 - 21)
 *						dealers "face-up" card (0 - 11)
 *						useable ace? (1 or 0)
 *
 **********************************************************************************/

#include "Blackjack.h"

//Output the agent's percent wins
//#define OUTPUT_PERCENT

// RL-Glue functions -------------------------------------------------------------------------
Task_specification env_init()
{
	task_spec = new char[10000];
	observation = new int[3];
	
	strcpy(task_spec,"1.0:e:3_[i,i,i]_[0,21]_[0,11]_[0,1]:1_[i]_[0,1]");
	
	return task_spec;
}

Observation env_start() 
{
  // initialize global state variables
  playerTotal = 0;
  dealerTotal = 0;
  playerHits = 0;
  playerUsableAce = false;
  dealerUsableAce = false;
  playerNatural = false;

  // deal player two cards
  addCard(playerTotal,playerUsableAce);
  addCard(playerTotal,playerUsableAce);

  // deal dealer one card (face up)
  addCard(dealerTotal,dealerUsableAce);

  // update and return observation
  if(playerTotal == 21)
	playerNatural = true;
	
  totalGames++;
  
  setObservation();
  return observation;
}

Reward_observation env_step(Action a)  
{  
  if (a == 0) //hit
  {
	playerHits++;
    
	// deal player another card
    addCard(playerTotal,playerUsableAce);

    // check if player is bust
    if (playerTotal > 21) 
	{
      rewOb.r = -1;
      rewOb.terminal = true;
    }
	else
	{
		rewOb.r = 0;
		rewOb.terminal = false;
	}
  
  }
  else if (a == 1) // player sticks
  {
  
    // deal dealer a single card 	
	addCard(dealerTotal,dealerUsableAce);
	
	if(playerNatural && playerHits == 0 && dealerTotal == 21)
      rewOb.r = 0; //both get naturals ... tie
	else if(playerNatural && playerHits == 0 && dealerTotal < 21)
      rewOb.r = 1; //player has natural and dealer doesn't .. win
	else
	{
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
	}
	rewOb.terminal = true;
  }

  if(rewOb.r == 1)playerWins++;
	
  // update and return observation and reward
  setObservation();
  rewOb.o = observation;
  return rewOb;
}   

void env_cleanup()
{
	delete task_spec;
	delete observation;
#ifdef OUTPUT_PERCENT
	printf("\n\nwinning percentage = %f\n\n",(double)playerWins/(double)totalGames);
#endif
}

//Helper functions -------------------------------------------------------------
void setObservation() 
{
// update global obvservation variable
  
  observation[0] = playerTotal;
  //if(dealerTotal == 11)observation[1]=1;
  /*else*/ observation[1] = dealerTotal;
  observation[2] = playerUsableAce;
}

void addCard(int& total, bool& usableAce) 
{
  // add a new card to a player's total, handle usuable aces
  
  int card = 1 + (int)(drand48() * 13);   // draw a new card
  
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


