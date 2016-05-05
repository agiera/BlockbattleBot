/* ----------------------------------------------------------------------
 catMouse.cpp
 
 Description:
  
	A cat single piece of cheese are placed in a 2D maze(with walls). The agent (mouse) must collect as much
	cheese as possible while avoiding the cat.
  
	Both the cat and mouse have 8 degrees of movement. Up, down, left and right, as well as the four diagonals.
	The mouse gets positive reward (+50) for getting the cheese. The mouse gets the cheese when it is in the same square as the cheese.
	The mouse gets negative reward (-100) for getting caught, by simply moving to the same square as the cat.
	If the mouse gets the cheese, a new piece is placed randomly while the cat and mouse keep their positions.
	The episode ends when the cat catches the mouse. Single cat and piece of cheese in maze at one time.
	
	Episodic task
	
	State info: 4 dimensional integer array {mouse x pos, mouse y pos, cat x pos, cat y pos}
	Action info: integer - king moves
 ---------------------------------------------------------------------- */	
#include "catMouse.h"


int ccount;

Task_specification env_init()
{
		char* ts;
				
		row = 10;
		col = 10;

		ts = new char[1000];
		sprintf(ts,"1.1:e:3_[i,i,I]_[0,%d]_[0,%d]_[0,1]:1_[i]_[0,8]", row*col, row*col);

		int a; int b;

		srand(666);
		walls = new int*[row];
		for( int i = 0; i < row; i++)
			walls[i] = new int[col];
		
		for(int i=0;i< row; i++)
			for(int j=0;j< col; j++)
				walls[i][j] = 0;
//			
//		walls[1][1] = 1;
//		walls[1][2] = 1;
//		walls[0][2] = 0;  //cheesszzze
//		walls[0][3] = 0;
			
		for(int i=0; i< (row*col*.3); i++)
		{
			a = rand()%row;
			b = rand()%col;
			walls[a][b] = 1;
		}

		for(int i=0; i< (row*col*.03); i++)
		{
			a = rand()%row;
			b = rand()%col;
			while(walls[a][b] != 0)
			{
				a = rand()%row;
				b = rand()%col;
			}
			walls[a][b] = 3;
		}

		a = rand()%row;
		b = rand()%col;
		while(walls[a][b] != 0)
		{
			a = rand()%row;
			b = rand()%col;
		}
		walls[a][b] = 2;

//		for(int i=0;i< row; i++){
//			for(int j=0;j< col; j++)
//						printf("%d  ",walls[i][j]);
//			printf("\n");
//		}
		
				
		return ts;

}
	

Observation env_start()
{
		
		setRandomPos(); 
		o[0] = mx*col + my;
		o[1] = cx*col + cy;
		O[2] = 0;
		
		ccount = 0;

		
		//printf("Start: cat at (%d,%d) || %d || mouse at (%d,%d) || %d ||\n",cx,cy,walls[cx][cy],mx,my,walls[mx][my]);
		return o;
}

Reward_observation env_step(Action action) 
{		


		
		ccount++;
		
		//move mouse based on action
		Dimension d = moveMouse(action);
		int x=d.width, y=d.height;
		if (legal(x,y)) {
			mx = x; my = y;
		}//else mouse doesn't move 
		
		//move cat
		o[2] = 0;
		if(walls[mx][my] == 2){
            		d = moveCat_Cave(cx, cy);
			o[2] = 1;
		}
        	else
		{
            		d = moveCat(cx, cy, mx, my);
			o[2] = 0;
		}
		cx = d.width;
		cy = d.height;		
		
		ro.terminal = false;
		ro.r = 0;
		//calculate reward
		if (walls[mx][my] == 3)
		{
		  ro.r = cheeseReward;
		}
		if ((cx==mx) && (cy==my))
		{ 
			ro.r += deathPenalty;
			ro.terminal = true;
		}
		
		if(ccount > 1000)
		{
			ro.r += 1;
			ro.terminal = true;	
		}
				
		o[0] = mx*col + my;
		o[1] = cx*col + cy;

		//if(ro.terminal)
		//printf("cat at (%d,%d) || %d || mouse at (%d,%d) || %d ||\n",cx,cy,walls[cx][cy],mx,my,walls[mx][my]);

		ro.o = o;
		
		return ro;
	}
	
	void env_cleanup()
	{
		for( int i = 0; i < row; i++)
			delete [] walls[i];
		
		delete [] walls;	
	
	}
	
	Dimension moveMouse(int action) 
	{
		Dimension d;
		int x=mx, y=my;
		
		if (action == 0) 
			y = my - 1;
		else if(action == 1){
			y = my - 1; x = mx + 1;}
		else if(action == 2)
			x = mx + 1;
		else if(action == 3){
			y = my + 1; x = mx + 1;}
		else if(action == 4)
			y = my + 1;
		else if(action == 5){
			y = my + 1; x = mx - 1;}
		else if(action == 6)
			x = mx - 1; 
		else if(action == 7){
			y = my - 1; x = mx - 1;}
		else{
			printf("Invalid action: %d\nExiting ... \n\n",action);
			exit(0);
		}
		d.width = x;
		d.height = y;
		return d;
	}

	Dimension moveCat(int catX, int catY, int mouseX, int mouseY) {
		Dimension d;
		int x=catX, y=catY;
		
		if (mouseX==catX) x = catX;
 		else x += (mouseX - catX)/abs(mouseX-catX); // +/- 1 or 0
		if (mouseY==catY) y = catY;
 		else y += (mouseY - catY)/abs(mouseY-catY); // +/- 1 or 0
		
		// check if move legal	
		if (legal(x, y) && walls[x][y] != 2)
		{	d.width = x;
			d.height = y;
			return d;
		}
			
		int tick=0;
		// not legal, make random move
		while(true && tick < 100) {
			tick++;
			// will definitely exit if 0,0
			x=catX; y=catY;
			x += 1-(int) (drand48() *3);
			y += 1-(int) (drand48() *3);
			
			if (legal(x, y)  && walls[x][y] != 2)
			{	d.width = x;
				d.height = y;
				return d;
			}
		}
		d.width = x;
		d.height = y;
		return d;
	}
	
	Dimension moveCat_Cave(int catX, int catY) {
		Dimension d;
		int x=catX, y=catY;
		

		int tick=0;		
		// not legal, make random move
		while(true && tick < 10000) {
			tick++;
			// will definitely exit if 0,0
			x=catX; y=catY;

			x += 1-(int) (drand48() *2);
			y += 1-(int) (drand48() *2);
			
			if (legal(x, y)  && walls[x][y] != 2)
			{	d.width = x;
				d.height = y;
				return d;
			}
		}
		d.width = x;
		d.height = y;
		return d;
	}


	void setRandomPos() 
	{
		Dimension d = getRandomPos();
		while(walls[d.width][d.height] == 2)
			d = getRandomPos();

		cx = d.width;
		cy = d.height;			

		d = getRandomPos();
		while(d.width == cx && d.height == cy)
			d = getRandomPos();
		mx = d.width;
		my = d.height;
		
//		cx = 2;
//		cy = 2;
//		mx = 0; my=1;
	}

	Dimension getRandomPos() 
	{
		Dimension d;
		int x, y;
		x = (int)(drand48() * row);
		y = (int)(drand48() * col);
		while(!legal(x,y))
		{
			x = (int)(drand48() * row);
			y = (int)(drand48() * col);
		}
		d.width = x;
		d.height = y;
		return d;
	}
	
	bool legal(int x, int y) 
	{
		return ((x>=0) && (x<row) && (y>=0) && (y<col)) && (walls[x][y] != 1);
	}
