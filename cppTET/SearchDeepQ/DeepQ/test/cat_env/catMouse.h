/* ----------------------------------------------------------------------
 catMouse.h
 
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
 
#ifndef CATMOUSE_H
#define CATMOUSE_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include "RLcommon.h"


int row, col;
int mx, my;
int cx, cy;
int chx, chy;

int cheeseReward=5, deathPenalty=-100;
	
int** walls; 
		
typedef struct {
	int width;
	int height;
} Dimension;

Dimension moveMouse(int action); 
Dimension moveCat(int catX, int catY, int mouseX, int mouseY);
Dimension moveCat_Cave(int catX, int catY);
void setRandomPos();
Dimension getRandomPos();
bool legal(int x, int y); 

 
Observation o = new int[5];
Reward_observation ro;				//instance of observation type

#endif
