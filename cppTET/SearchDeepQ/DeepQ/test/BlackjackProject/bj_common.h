/*********************************************************************************
 *  bj_common.h
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

#ifndef BJ_COMMON_H
#define BJ_COMMON_H

#define AGENT_INIT
#define ENV_INIT
#define AGENT_CLEANUP
#define ENV_CLEANUP
#define AGENT_FREEZE

typedef int Action;	  
typedef int* Observation;	  


typedef char* Task_specification;
typedef double Reward;

typedef struct {
	Reward r;
	Observation o;
	bool terminal;
} Reward_observation;

typedef int State_key;
typedef int Random_seed_key;

#endif


