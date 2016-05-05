/*
 * A port of Shimone Whiteson's Java version of Taxi adapted from Carlos Diuk's
 * JTaxiEnvVanilla.java.
 * 
 * Ported by Timothy Edmunds
*/

#include "Taxi.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

using namespace std;

#define NORTH 0
#define SOUTH 1
#define WEST 2
#define EAST 3
#define PICK 4
#define DROP 5
#define NACTIONS 6

#define PASSINTAXI 4

#define XTAXI 5
#define YTAXI 5
#define NTAXISTATES XTAXI * YTAXI
#define NPASSSTATES 5
#define NDESTSTATES 4
#define NSTATES NTAXISTATES * NDESTSTATES * NPASSSTATES

int getTaxiPos(int x, int y)
{
	return x + XTAXI*y;
}

int getx(int taxiLoc)
{
	return taxiLoc % XTAXI;
}

int gety(int taxiLoc)
{
	return (taxiLoc-getx(taxiLoc)) / YTAXI;
}

int getLoc(int passLoc)
{
	switch (passLoc)
	{
		case 0: return getTaxiPos(0, 0);
		case 1: return getTaxiPos(0, 4);
		case 2: return getTaxiPos(3, 0);
		case 3: return getTaxiPos(4, 4);
		default: return -1;
	}
}

void nextstate(int a);
 
/* Definition of random start states */
#define START_SET_DIM 3
#define START_SET_SIZE 50
long episode_ctr;

void generateRandomStart(int* start)
{
  // initialize global state variables
  taxi = lrand48()%NTAXISTATES;
  pass = lrand48()%NPASSSTATES;
  dest = lrand48()%NDESTSTATES;

  start[0] = taxi;
  start[1] = pass;
  start[2] = dest;
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
    sprintf(temp,"_[%d,%d]",0,NTAXISTATES-1); // min max for dim 1 can be written here
    strcat(Task_spec,temp);
    sprintf(temp,"_[%d,%d]",0,NPASSSTATES-1); // min max for dim 2 can be written here
    strcat(Task_spec,temp);
    sprintf(temp,"_[%d,%d]",0,NDESTSTATES-1); // min max for dim 3 can be written here
    strcat(Task_spec,temp);
    sprintf(temp,":1_[i]");
    strcat(Task_spec,temp);
    sprintf(temp,"_[%d,%d]",0,NACTIONS-1); // min max for actions can be written here
    strcat(Task_spec,temp);
    sprintf(temp,":%f,%f",-10.0,0.0); // Rmin, Rmax
    strcat(Task_spec,temp);
    sprintf(temp,"\0");
    strcat(Task_spec,temp);
    return Task_spec;
}
  
Observation env_start()
{   
	rewOb.r = 0;
  int start_state_number = episode_ctr % START_SET_SIZE;
  taxi = start_set[start_state_number][0];
  pass = start_set[start_state_number][1];
  dest = start_set[start_state_number][2];

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
	return "Taxi";
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
  // We know for NIPS that Action is an int
    nextstate(a);

  // update and return observation and reward
  setObservation();
  return rewOb;
}   

// update global obvservation variable
void setObservation() {
  observation[0] = taxi;
  observation[1] = pass;
  observation[2] = dest;
}

	 void nextstate(int a) { 
	 	 int cx;
	 	 int cy;

		 cx=getx(taxi);
		 cy=gety(taxi);
	
		 switch(a) {
			 case NORTH:
			     if ((cy+1) < 4)
			     {
			     	cy = cy + 1;
			     }
			     else
			     {
			     	cy = 4;
			     }
				 rewOb.r=-1;
				 break;
	
			 case SOUTH:
			     if ((cy - 1) > 0)
			     {
			     	cy = cy - 1;
			     }
			     else
			     {
			     	cy = 0;
			     }
				 rewOb.r=-1;
				 break;
	
			 case WEST:
				 // Check for walls (hardcoded...)
				 if (!(taxi==3 || taxi==8 || taxi==1 || taxi==6 || taxi==17 || taxi==22)) {
				 	if ((cx - 1) > 0)
				 	{
				 		cx = cx - 1;
				 	}
				 	else
				 	{
				 		cx = 0;
				 	}
				 }
				 rewOb.r=-1;
				 break;
	
			 case EAST:
				 // Check for walls (hardcoded...)
				 if(!(taxi==0 || taxi==5 || taxi==2 || taxi==7 || taxi==16 || taxi==21)) {
				 	if ((cx + 1) < 4)
				 	{
				 		cx = cx + 1;
				 	}
				 	else
				 	{
				 		cx = 4;
				 	}
				 }
				 rewOb.r=-1;
				 break;
	
			 case PICK:
				 if(pass!=PASSINTAXI && getLoc(pass)==taxi) {
					 pass=PASSINTAXI; // Passenger is now on taxi
					 rewOb.r = -1;
				 } else {
					 rewOb.r = -10;
				 }
				 break;
	
			 case DROP:
				 if(pass==PASSINTAXI && getLoc(dest)==taxi) { // If passenger is on taxi, and taxi at destination.
					 pass=dest; // Passenger is now on destination
					 //rew = 20; changed to 0 -Alex
					 rewOb.r = 0;
					 rewOb.terminal=true;
				 } else {
					 rewOb.r = -10;
				 }
				 break;
		 };
	
		 taxi=getTaxiPos(cx,cy);
	 }

