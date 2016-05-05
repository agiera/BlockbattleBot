/*
 *  CartPole.cpp
 *  
 *
 *  Created by Martin Riedmiller
 *  Copyright (c) 2005 UAlberta. All rights reserved.
 * 
 *  Modified by Timothy Edmunds
 */

#include "CartPole.h"
#include <math.h>


//plant specific variables
#define STATE_DIM 4

#define PI     3.14159265

#define car_max_position 2.4
#define car_goal_position 0.05 
#define pole_max_angle 30./180.*PI
#define pole_goal_angle 3./180.*PI

#define THETA  0   
#define THETAP 1   
#define S      2  
#define SP     3   

#define MIN_ACTION -10
#define MAX_ACTION 10

/* Definition of random start states */
#define START_SET_DIM 6
#define START_SET_SIZE 50
long episode_ctr;
long steps;

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
    max[i] = 0.0;
  }
  // problem specific definition:
  min[THETA] = -10./180. * PI;
  max[THETA] = 10./180. * PI;
  min[S] = -.5;
  max[S] = .5;

  for(int k = 0; k<START_SET_SIZE; k++){
    for(int i = 0; i<START_SET_DIM; i++){
      start_set[k][i]=drand48() * (max[i]-min[i]) + min[i];
    }
  }
}


Task_specification env_init()
{    
    generate_random_start_set();
    episode_ctr = 0;
    steps = 0;

	// For NIPS continuous, we know that the observation is an array of doubles    
    current_state = new double[STATE_DIM];

    // Return task specification:
    char* Task_spec = new char[1000];
    char temp[500];
    strcpy(Task_spec,"1:e");
    sprintf(temp,":%d", STATE_DIM); // number of 'f's depends on number of dimensions
    strcat(Task_spec,temp);

    sprintf(temp,"_[f,f,f,f]"); // number of 'f's depends on number of dimensions
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",-pole_max_angle,pole_max_angle); // min max for dim 1 can be written here
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",-5.,5.); // min max for dim 2 can be written here
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",-car_max_position,car_max_position); // min max for dim 3 can be written here
    strcat(Task_spec,temp);
    sprintf(temp,"_[%f,%f]",-10.,10.); // min max for dim 4 can be written here
    strcat(Task_spec,temp);
    sprintf(temp,":1_[i]");
    strcat(Task_spec,temp);
    sprintf(temp,"_[%d,%d]",-10,10); // min max for actions can be written here
    strcat(Task_spec,temp);

    sprintf(temp,":%f,%f",-1000.0,0.0); // Rmin, Rmax

    strcat(Task_spec,temp);
    strcat(temp,"\0");
    strcat(Task_spec,temp);

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

  steps = 0;
  episode_ctr ++;
  return current_state;
}


Reward_observation env_step(Action a)
{    
  //  printf("Environment step\n");
  double next_state[STATE_DIM];
  compute_next_state(current_state, a, next_state);
  for(int i=0;i<STATE_DIM;i++)
    current_state[i] = next_state[i];

/*  for (int i=0; i<STATE_DIM;i++){
    printf("%.4f  ", current_state.continuous[i]);
  }
  printf("\n");*/

 steps++;
 // perpare return values;
 current_reward_observation.o	= current_state;
 current_reward_observation.r = getReward();
 current_reward_observation.terminal = is_terminal();
 return current_reward_observation;
}

bool is_terminal(){
  if(fabs(current_state[THETA]) >= pole_max_angle || fabs(current_state[S]) >= car_max_position)
    return true; // failure  !!
  if(steps >= 300)
  {	
  	printf("*");
  	return false;
  }
  return false; 
}

Reward getReward()
{
  if(fabs(current_state[THETA]) >= pole_max_angle || fabs(current_state[S]) >= car_max_position)
    return -1000;
  if(fabs(current_state[THETA]) <= pole_goal_angle && fabs(current_state[S]) <= car_goal_position)
    return 2;
  return 1;
}

void env_cleanup()
{
	delete [] current_state;
}

char* env_get_name()
{
	return "CartPole";
}

State_key env_get_state(){	
  return 0;
}

void env_set_state(State_key sk){
  // This doesn't work
}

void env_set_random_seed(Random_seed_key rsk){
	printf("random seed : %d\n",rsk);
	srand48(rsk);
}

Random_seed_key env_get_random_seed(){
	Random_seed_key rs = 0;
	return rs;
}

/***************************************************************************************/

/* computation of dynamics */

/***************************************************************************************/

/* taken from CLSQUARE */

#define X_DIM 4


/*****************************************************************
 * PlantPendulum specific parameters
 *****************************************************************/
//#define PI     3.14159265
#define G      9.81


/** Modified Signum-Function macro */
#define SGN(x)((x)>=0.0? 1.0:-1.0)

/** The number of ingegration steps */
static int no_of_integration_steps=10;

static float mp=0.1;
static float mc=1.0;
static float mg=1.1;
static float lengthp=.5;
static float frc=.0;
static float frp=.0;
static float delta_t=.02;



/*****************************************************************
 * CartPole Dynamics
 *****************************************************************/

static void f(double* x,const double* u,double* dx)
{
  float sinus ,kosinus,h1, thetapp, spp, fric_pole, fric_cart;

  mg=mc+mp;
  sinus = (float)sin((double)x[THETA]); 
  kosinus = (float)cos((double)x[THETA]);

  // Semantics: h1 == f(t) + mp * lengthp * (thetapunkt)**2 sin(theta) 
  h1 = u[0] + mp * lengthp * x[THETAP] * x[THETAP] * sinus;
  
  fric_pole = frp * x[THETAP]/(mp * lengthp);
  thetapp = ((mg * G * sinus - kosinus * h1 + kosinus*frc*SGN(x[SP])) - fric_pole)/
    (4./3.*mg*lengthp - mp *lengthp *kosinus*kosinus);

  fric_cart = frc* SGN(x[SP]);    
  
  if (fabs(x[SP])<0.001) fric_cart = 0.0;
  
  spp = ((h1 - mp * lengthp *thetapp * kosinus) - fric_cart) / mg ;
  
  // Update internal state
  dx[THETA] = x[THETAP];
  dx[THETAP] = thetapp;
  dx[S] = x[SP];
  dx[SP] = spp;
}


static void rk4(double* start_x,const double* start_u,int dim,float dt,double* end_x)
{
  int i;
  static double* dx_0=new double[dim];
  static double* dx_1=new double[dim];
  static double* dx_2=new double[dim];
  static double* dx_3=new double[dim];
  static double* x_1=new double[dim];
  static double* x_2=new double[dim];
  static double* x_3=new double[dim];

  f(start_x,start_u,dx_0);
  for(i=0;i<dim;i++){
    x_1[i] = start_x[i] + dt/2*dx_0[i];
  }
  f(x_1,start_u,dx_1);
  for(i=0;i<dim;i++){
    x_2[i] = start_x[i] + dt/2*dx_1[i];
  }
  f(x_2,start_u,dx_2);
  for(i=0;i<dim;i++){
    x_3[i] = start_x[i] + dt*dx_2[i];
  }
  f(x_3,start_u,dx_3);

  for(i=0;i<dim;i++){
    end_x[i] = start_x[i] + dt/6 * (dx_0[i] + 2*(dx_1[i]+dx_2[i]) + dx_3[i]);    
  }

  // Testing rk4 only:
  // for(i=0;i<dim;i++)
  //   cout << "\n" << start_x[i] << " " << dx_0[i] << " " << x_1[i] << " " << dx_1[i] << " " << x_2[i]  << " " << dx_2[i] << " " << x_3[i]  << " " << dx_3[i] << " " << end_x[i];
}

void cartpole_next_state(const double* state, const double* action, 
			 double* next_state){
// Plant dynamics: x(t+1) = f(x,u) 

  double x[X_DIM];
  static double* x_tmp[2] = {x,new double[X_DIM]};
  float dt;
  int t;

  int x_idx=0;
  dt = delta_t /(float)no_of_integration_steps;
  for (int i=0; i< X_DIM; i++) 
    x[i]= state[i];
  x_tmp[x_idx] = x;
  
  for(t=0;t<no_of_integration_steps;t++){
    rk4(x_tmp[x_idx],action,X_DIM,dt,x_tmp[(x_idx+1)%2]);
    x_idx = (x_idx+1)%2;
  }
  
  next_state[THETA] = x_tmp[x_idx][THETA];
  next_state[THETAP] = x_tmp[x_idx][THETAP];
  next_state[S] = x_tmp[x_idx][S];
  next_state[SP] = x_tmp[x_idx][SP];

  // Transfer to values between -PI and PI
  if(next_state[THETA] < - PI)
    next_state[THETA] +=  2.0 * PI;
  else  if(next_state[THETA] > PI)
    next_state[THETA] -= 2.0 * PI;
}


/* END CLSQUARE Code */

void compute_next_state(const Observation state, const Action action, double* next_state){
  double actuatorValue[1];
  // For NIPS, we know that Action is an int
  actuatorValue[0] = action;
  if (action < MIN_ACTION) actuatorValue[0] = MIN_ACTION;
  if (action > MAX_ACTION) actuatorValue[0] = MAX_ACTION;
  cartpole_next_state(state,actuatorValue,next_state); 
}


