/*
 *  mines.h
 *  
 *
 *  Created by Adam White on Fri Aug 05 2005.
 *  Copyright (c) 2005 UAlberta. All rights reserved.
 * 
 *  A simple grid world with stationary mines.
 *  Episodic task, end of episode when find goal or hit mine
 *  
 *  State: 1D discrete
 *  Actions: 1D discrete (0,1,2,3)
 *
 */
#ifndef MINES_H
#define MINES_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include "RLcommon.h"

int getPosition();
int getNextPosition(int action);
Reward getReward();  

typedef struct 
{
        int START;			//Start marker in grid
        int GOAL;			//End marker in grid
        int LAND;			//Free space in grid
        int OBSTACLE;	    //Obstical in grid
        int MINE;           //Mine in grid
        int row;			//Number of rows in grid
        int col;			//Number of columns in grid
        int startRow;		//Starting position
        int startCol;		//Starting position
        int agentRow;		//Agents current position
        int agentColumn;	//Agents current position
		int mx;
		int my;

} mine_env;

int cc;
		int env_map[30][30];
		
Observation o;
mine_env M;					//mine struct
Reward_observation ro;				//instance of observation type

bool env_terminal;

#endif
