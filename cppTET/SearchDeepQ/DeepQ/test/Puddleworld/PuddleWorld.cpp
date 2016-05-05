/*
 *  PuddleWorld.cpp
 *
 */

#include "PuddleWorld.h"
#include <math.h>

#define PI 3.141592654

#define STEP 0.05

#define PUDDLES 2
#define PUDDLERADIUS 0.1

#define dot(u,v)   ( u[0] * v[0] + u[1] * v[1] )

double P[PUDDLES][2][2];


double distance(double* state, int p);
double normal();

/* Definition of random start states */
#define START_SET_DIM 2
#define START_SET_SIZE 50
long episode_ctr;

double start_set[START_SET_SIZE][START_SET_DIM];
void env_set_random_seed(Random_seed_key rsk);
void generate_random_start_set(){
	// Hack
	env_set_random_seed(666);
/* 'generic' procedure for random settings in  max. 10 dimensions.
   problem specific adaption through specification of max min values
   in each dimension */

  double min[START_SET_DIM];
  double max[START_SET_DIM];

  for(int i= 0; i<START_SET_DIM; i++){
    min[i] = 0.0;
    max[i] = 1.0;
  }

  for(int k = 0; k<START_SET_SIZE; k++){
    for(int i = 0; i<START_SET_DIM; i++){
      start_set[k][i]=drand48() * (max[i]-min[i]) + min[i];
    }
  }
}

Task_specification env_init()
{    
#define STATE_DIM 2
    generate_random_start_set();

	// For NIPS continuous, we know that Observation is an array of doubles
    current_state = new double[STATE_DIM];

    P[0][0][0] = 0.10; //puddle #1, point #1, x
    P[0][0][1] = 0.75; //puddle #1, point #1, y
    P[0][1][0] = 0.45; //puddle #1, point #2, x
    P[0][1][1] = 0.75; //puddle #1, point #2, y

    P[1][0][0] = 0.45; //puddle #2, point #1, x
    P[1][0][1] = 0.40; //puddle #2, point #1, y
    P[1][1][0] = 0.45; //puddle #2, point #2, x
    P[1][1][1] = 0.80; //puddle #2, point #2, y
   
    // Return task specification:
    Task_specification Task_spec = new char[1000];
  
  strcpy(Task_spec,"1:e:2_[f,f]_[0.0,1.0]_[0.0,1.0]:1_[i]_[0,3]");
  
    return Task_spec;
}
  

Observation env_start()
{   
  int start_state_number = episode_ctr % START_SET_SIZE;
  for(int i=0;i<STATE_DIM;i++){ // default
    current_state[i] = start_set[start_state_number][i];
  }

  // for debugging only.
/*  printf("Environment. Start episode %d, starting with start state: %d\n", episode_ctr, start_state_number);
  for (int i=0; i<STATE_DIM;i++){
    printf("%.4f  ", current_state.continuous[i]);
  }
  printf("\n");*/

  episode_ctr ++;
  return current_state;
}


Reward_observation env_step(Action action)
{    
 int i;
 double noise; 
 
 // For NIPS, we know that the Action is an int
 int a = action;

 //printf("\nCurrent state: (%5.3lf,%5.3lf) Action: %d   ", current_state[0], current_state[1], a); 

 // compute next state out of current state and action
 if (a==0)
   current_state[1] += STEP; // UP
 else if (a==1)
   current_state[1] -= STEP; // DOWN
 else if (a==2) 
   current_state[0] += STEP; // RIGHT
 else if (a==3)
   current_state[0] -= STEP; // LEFT
 else {
   printf("Invalid action %d %f \n", a, a);
   exit(1);
 }

 // add noise
 for(int i=0;i<STATE_DIM;i++){
   noise = (double) normal() * 0.01;
   current_state[i] += noise; 
   //printf("Noise: %5.3lf ", noise);
 }
 
 // bring state within bounds
 for(int i=0;i<STATE_DIM;i++){
   if (current_state[i]>1.0)
     current_state[i] = 1.0;
   else if (current_state[i]<0.0)
     current_state[i] = 0.0;
 }
 
 //printf("New state: (%5.3lf,%5.3lf) ", current_state[0], current_state[1]); 


 // prepare return values;
 current_reward_observation.o	= current_state;
 current_reward_observation.r = getReward();
 current_reward_observation.terminal = is_terminal();

 //printf("Reward: %8.6lf) ", ro.r); 

 return current_reward_observation;
}

bool is_terminal(){

  if ( (1.0-current_state[0]) + (1.0-current_state[1]) < 0.1 )
    return true; 
  else
    return false;
}

Reward getReward()
{
  Reward r; 
  int p; 
  double d, dmin; 

  // standard penalty
  r = -1; 

  // puddle penalty
  for (p=0;p<PUDDLES;p++) {
    d = distance(current_state, p);
    if ( d < PUDDLERADIUS)
    r += - 400.0 * (PUDDLERADIUS - d); 
  }

  return r;
}

void env_cleanup()
{
	delete [] current_state;
}

char* env_get_name()
{
	return "PuddleWorld";
}

State_key env_get_state(){
	return 0;
}

void env_set_state(int sk){
  // This doesn't do anything
}

void env_set_random_seed(Random_seed_key rsk){
	srand48(rsk);
}

Random_seed_key env_get_random_seed(){
	Random_seed_key rs;
	return rs;
}	



double distance(double* state, int p)
{
  int i;
  double v[2];
  double w[2];
  double z[2];
  double d; 

  for(int i=0;i<STATE_DIM;i++){
    v[i] = P[p][1][i] - P[p][0][i];
    w[i] = state[i] - P[p][0][i];
  }

  double c1 = dot(w,v);
  if ( c1 <= 0 ) {
    d = 0.0; 
    for(int i=0;i<STATE_DIM;i++)
      d += (state[i] - P[p][0][i]) * (state[i] - P[p][0][i]);
    d = sqrt(d); 
    return d; 
  }

  double c2 = dot(v,v);
  if ( c2 <= c1 ) {
    d = 0.0; 
    for(int i=0;i<STATE_DIM;i++)
      d += (state[i] - P[p][1][i]) * (state[i] - P[p][1][i]);
    d = sqrt(d); 
    return d; 
  }

  double b = c1 / c2;
  d = 0.0;
  for(int i=0;i<STATE_DIM;i++) {
    z[i] =  P[p][0][i] + b * v[i];
    d += (state[i] - z[i]) * (state[i] - z[i]);
  }
  d = sqrt(d); 
  return d;
}



/* returns a random variate from the standard normal */
/* distribution. Taken from Numerical Recipes in C. */ 
double normal()
{
        static int iset = 0;
        static double gset;
        double fac, r, v1, v2;
 
        if (iset == 0){
                do {
                        v1 = 2.0 * drand48() - 1.0;
                        v2 = 2.0 * drand48() - 1.0;
                        r = v1*v1 + v2*v2;
                } while (r >= 1.0);
                fac = sqrt(-2.0 * log((float)r)/(float)r);
                gset = v1 * fac;
                iset = 1;
                return v2*fac;
        } else {
                iset = 0;
                return gset;
        }
}
