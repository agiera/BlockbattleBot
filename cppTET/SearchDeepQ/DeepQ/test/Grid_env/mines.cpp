/*
 *  mines.cpp
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
#include "mines.h"
int env_count;


	
void gen_rand_map()
{
	int a; int b;
	
	for(int i=0;i< M.row; i++)
		for(int j=0;j< M.col; j++)
			env_map[i][j] = 2;
		
	for(int i=0; i< (M.row*M.col*0.1); i++)
	{
		a = rand()%M.row;
		b = rand()%M.col;
		env_map[a][b] = 3;
	}
	
 	for(int i=0; i< (M.row*M.col*0.2); i++)
	{
		a = rand()%M.row;
		b = rand()%M.col;
		while(env_map[a][b] != 2)
		{
			a = rand()%M.row;
			b = rand()%M.col;
		}
		env_map[a][b] = 4;
	}

	a = rand()%M.row;
	b = rand()%M.col;
	while(env_map[a][b] != 2)
	{
		a = rand()%M.row;
		b = rand()%M.col;
	}
	env_map[a][b] = 1;
	M.mx = a;
	M.my = b;	
	
	a = rand()%M.row;
	b = rand()%M.col;
	while(env_map[a][b] != 2 || abs(M.mx - a) < (8) || abs(M.my - b) < 8 )
	{
			a = rand()%M.row;
			b = rand()%M.col;
	}
	env_map[a][b] = 0;
	M.startRow= a;
	M.startCol = b;			


}

bool legal(int x, int y)
{
	if(x >= 0 && y >= 0 && x < M.row && y < M.col && env_map[x][y] != 3 && env_map[x][y] != 4)
		return true;
	else
		return false;
}

bool test_map()
{

	int x = M.startRow;
	int y = M.startCol;
	int oldx = x;
	int oldy = y;
	
	
	for(int i = 0; i < M.row*M.col*10;i++)
	{			
		int tick=0;
		x=oldx; y=oldy;
		if(drand48() < .5)
		{
			if(drand48() < .5)
				x = x -1;
			else
				x = x + 1;
		}
		else
		{
			if(drand48() < .5)
				y = y -1;
			else
				y = y + 1;	
		}			 
		while(!legal(x, y) && tick < 10) 
		{
			tick++;
			x=oldx; y=oldy;
			if(drand48() < .5)
			{
				if(drand48() < .5)
					x = x -1;
				else
					x = x + 1;
			}
			else
			{
				if(drand48() < .5)
					y = y -1;
				else
					y = y + 1;	
			}
		}
		if(!legal(x, y))
		{
			x = oldx;
			y = oldy;
		}
		else
		{
			oldx = x;
			oldy = y;
		}

		if(x == M.mx && y == M.my)
			return true;
	}
		return false;
}

Task_specification env_init()
{    

	M.START = 0;
    M.GOAL = 1;
    M.LAND = 2;
    M.OBSTACLE = 3;
    M.MINE = 4;
	
    M.row = 20;
	M.col = 20;
	
	gen_rand_map();
	while(!test_map())
		gen_rand_map();
//
//	for(int i=0;i<M.row;i++){
//		for(int j=0;j<M.col;j++)
//			printf("%d ",env_map[i][j]);
//		printf("\n");
//	}
//		printf("\n");
	
    // Return task specification:
    char* Task_spec = new char[100];
    char temp[50];
    
    strcpy(Task_spec,"1:e:1_[i]_[0,");
    sprintf(temp,"%d", M.row*M.col-1);
    strcat(Task_spec,temp);
    sprintf(temp,"]:1_[i]_[0,");
    strcat(Task_spec,temp);
    sprintf(temp,"%d]",4-1);
    strcat(Task_spec,temp); 
    return Task_spec;
}
  
void RandStart()
{
    int r = 0, c = 0;
    env_map[M.startRow][M.startCol] = M.LAND;
 
    while(env_map[r][c] != M.LAND)
    {
        r =  rand()% M.row;
        c = rand()% M.col;
    }
    M.startRow = r;
    M.startCol = c;
    env_map[M.startRow][M.startCol] = M.START;    
    
    M.agentColumn =  M.startCol;
    M.agentRow = M.startRow;
}
Observation env_start()
{   
    env_terminal = false;

	M.agentRow = M.startRow;
	M.agentColumn = M.startCol;	
//	RandStart();
//	while(!test_map())
//		RandStart();
	
    return M.startRow * M.col + M.startCol;
}

Reward_observation env_step(Action a)
{    
    ro.o = getNextPosition(a); 
    ro.r = getReward();
	
    if(env_terminal) //end of episode?
        ro.terminal = true;
    else
        ro.terminal = false;

    return ro;
}

int getPosition()
{
    if (env_map[M.agentRow][M.agentColumn] != M.GOAL && env_map[M.agentRow][M.agentColumn] != M.MINE)
    {    // The episode terminates if the agent hits a mine
        return M.agentRow*M.col + M.agentColumn;
    }
    else
    {	env_terminal = true;
        return -1;
    }
}

int getNextPosition(int a)
{
    // When the move would result in hitting an obstacles, the agent simply doesn't move
	int oldR = M.agentRow; 
	int oldC = M.agentColumn ;
	
    
	
    if (a == 0)
        M.agentColumn = M.agentColumn - 1;
    else if (a == 1)
        M.agentColumn = M.agentColumn + 1;
    else if (a == 2)
        M.agentRow = M.agentRow - 1;
    else if (a == 3)
        M.agentRow = M.agentRow + 1;
	else{
		printf("action error\n\n");
		exit(0);
		}
    		
	if(!legal(M.agentRow,M.agentColumn))
	{
		M.agentRow = oldR;
		M.agentColumn = oldC;
	}
		
	
	return getPosition();

}

Reward getReward()
{
    if (env_map[M.agentRow][M.agentColumn] == M.GOAL){
        return 0;}
    else if (env_map[M.agentRow][M.agentColumn] == M.MINE){
        return -10000;}
    else
        return -1;
}

void env_cleanup()
{
}

State_key env_get_state()
{	
	return M.agentRow*M.col + M.agentColumn;
}

void env_set_state(State_key sk)
{
	M.agentRow = sk/M.col;
	M.agentColumn = sk%M.col;
}

void env_set_random_seed(Random_seed_key rsk)
{
	srand(rsk);
}
Random_seed_key env_get_random_seed()
{
	Random_seed_key rsk;
	return rsk;
}	
