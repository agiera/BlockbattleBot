/* ----------------------------------------------------------------------
 cat_common.h
 
 Description:
  
	A cat single piece of cheese are placed in a 2D maze(with walls). The agent (mouse) must collect as much
	cheese as possible while avoiding the cat.
  
	Both the cat and mouse have 8 degrees of movement. Up, down, left and right, as well as the four diagonals.
	The mouse gets positive reward (+50) for getting the cheese. The mouse gets the cheese when it is in the same square as the cheese.
	The mouse gets negative reward (-100) for getting caught, by simply moving to the same square as the cat.
	If the mouse gets the cheese, a new piece is placed randomly while the cat and mouse keep their positions.
	The episode ends when the cat catches the mouse. Single cat and piece of cheese in maze at one time.
	
	Episodic task
	
	State info: 6 dimensional integer array {mouse x pos, mouse y pos, cat x pos, cat y pos, cheese x pos, cheese y pos}
	Action info: integer - king moves
 ---------------------------------------------------------------------- */	
 
#ifndef CAT_COMMON_H
#define CAT_COMMON_H

#define ENV_INIT
#define AGENT_INIT
#define AGENT_CLEANUP
#define ENV_CLEANUP


#include <vector>
typedef int* Observation;    //Defining what type a Observation is
typedef int Action;	  //Defining what type a action is

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