/*
 *  carAgent.cpp
 *  
 *
 *  Created by Adam White on 24/02/06.
 *  Copyright 2006 __MyCompanyName__. All rights reserved.
 *
 */

#include "QCMACO.h"
#include <iostream>
using namespace std;

void agent_init(char* ts) 
{
	for (int i=0; i<MEMORY_SIZE; i++) {
		theta[i]= 0.0;                     // clear memory at start of each run
		e[i] = 0.0;                            // clear all traces
	}
	epsilon = 0.1;
	
	//ag_act = new double[1];

	option_len[3] = 40;   
	option_len[4] = 30;  
	option_len[5] = 20;   
	option_len[6] = 10;   
	option_len[7] = 5;    
	option_len[8] = 5;    
	option_len[9] = 10;   
	option_len[10] = 20;
	option_len[11] = 30;
	option_len[12] = 40;   

	option_action[3] = 0;
	option_action[4] = 0;
	option_action[5] = 0;
	option_action[6] = 0;
	option_action[7] = 0;
	option_action[8] = 2;
	option_action[9] = 2;
	option_action[10] = 2;
	option_action[11] = 2;
	option_action[12] = 2;

}



Action agent_start(Observation o)
{
    DecayTraces(0.0);                                            // clear all traces
//	epsilon  = 0.0;
	
	for (int i=0; i<MEMORY_SIZE; i++) 
		h[i] = 0.0;

    loadF(o);                                                      // compute features
    loadQ(); 
		
	if(drand48() <= epsilon)
		oldAction = (int) (drand48() * (NUM_ACTIONS));
	else
		oldAction = argmax(Q);                                      // pick argmax action
	
	if(oldAction > 2)
	{
		option_reward = 0;
		option_count = 0;
		oldO[0] = o[0];
		oldO[1] = o[1];
		return option_action[oldAction];
	}
	else
	{
		return oldAction;
	}
}

Action agent_step(Reward r, Observation o)
{				
	
	if(oldAction > 2 && option_count < option_len[oldAction])
	{
		option_reward += r;
		option_count++;
		return option_action[oldAction];
	}
	else
	{
		if(oldAction > 2)
		{
			r += option_reward;
			option_reward = 0;
			option_count = 0;
    
			loadF(oldO);                                                      // compute features
			loadQ(); 
		}
		option_reward = 0;
		option_count = 0;
		
		for (int j=0; j<NUM_TILINGS; j++) SetTrace(F[oldAction][j],1.0); // replace traces
		
		loadQ(oldAction); 
		double delta = r - Q[oldAction];
// 		cout << "Q[" << Q[oldAction] << "]" << flush;
		loadF(o);                                                 // compute features new state	
		loadQ();
//		int a = argmax(Q);		
		
		delta = delta + gamma*Q[argmax(Q)];

		for (int i=0; i<num_nonzero_traces; i++)                 // update theta (learn)
		{ 
			int f = nonzero_traces[i];
			theta[f] += delta * (alpha/NUM_TILINGS) * e[f];
		}
			
		if(drand48() <= epsilon)
		{
			oldAction = (int) (drand48() * (NUM_ACTIONS));
			DecayTraces(0.0);                               // let traces fall
			
		}
		else
		{
			oldAction = argmax(Q);                                      // pick argmax action
			DecayTraces(gamma*lambda);                               // let traces fall
		
		}

		if(oldAction > 2)
		{
			option_reward = 0;
			option_count = 0;
			oldO[0] = o[0];
			oldO[1] = o[1];
			return option_action[oldAction];
		}
		else
		{
			return oldAction;	
		}
	}
		
}

void agent_end(Reward r)
{	

	if(oldAction > 2)
	{
		option_reward += r;
		r = option_reward;
		
		loadF(oldO);                                                      // compute features
		loadQ();
	}

			
	for (int j=0; j<NUM_TILINGS; j++) SetTrace(F[oldAction][j],1.0); // replace traces

	loadQ(oldAction);                                                 // compute new state values
	double delta = r - Q[oldAction];
	double temp = (alpha/NUM_TILINGS)*delta;

	
	for (int i=0; i<num_nonzero_traces; i++)                 // update theta (learn)
	{ 
			int f = nonzero_traces[i];
			theta[f] += temp * e[f];
	}           
	option_reward = 0;
	option_count = 0;
	
	epsilon *= .995;
	
}

void agent_cleanup()
{}

void loadQ() 
{

//	double bb;
	for (int a=0; a<NUM_ACTIONS; a++) 
	{
		Q[a] = 0;
		for (int j=0; j<NUM_TILINGS; j++) 
			Q[a] += theta[F[a][j]];
	}

	
}
		 
// Compute an action value from current F and theta
void loadQ(int a) 
{
//	double bb;

	Q[a] = 0;
    for (int j=0; j<NUM_TILINGS; j++) 
		Q[a] += theta[F[a][j]];
}

// Compute feature sets for current car state
void loadF(double o[2])
{
    state_vars[0] = o[0] / POS_WIDTH;
    state_vars[1] = o[1] / VEL_WIDTH;
    for (int a=0; a<NUM_ACTIONS; a++)
        tiles(&F[a][0],NUM_TILINGS,MEMORY_SIZE, state_vars,2,a);
}

// Returns index (action) of largest entry in Q array, breaking ties randomly
int argmax(double Q[NUM_ACTIONS])
{
	int best_action = 0;
    double best_value = Q[0];
    int num_ties = 1;                    // actually the number of ties plus 1
    double value;
	
	for (int a=1; a<NUM_ACTIONS; a++) 
	{
		value = Q[a];
        if (value >= best_value) 
            if (value > best_value)
			{
				best_value = value;
				best_action = a;
			}
            else 
			{
				num_ties++;
				if (0 == (int)(drand48()*num_ties))
				{
					best_value = value;
					best_action = a;
				}
			}
	}
    return best_action;
}

void SetTrace(int f, float new_trace_value)
// Set the trace for feature f to the given value, which must be positive
  { if (e[f] >= minimum_trace) e[f] = new_trace_value;         // trace already exists
    else { while (num_nonzero_traces >= MAX_NONZERO_TRACES) IncreaseMinTrace(); // ensure room for new trace
           e[f] = new_trace_value;
           nonzero_traces[num_nonzero_traces] = f;
           nonzero_traces_inverse[f] = num_nonzero_traces;
           num_nonzero_traces++;}}



void ClearTrace(int f)       
// Clear any trace for feature f
{ 
	if (!(e[f]==0.0)) 
        ClearExistentTrace(f,nonzero_traces_inverse[f]); 
}




void ClearExistentTrace(int f, int loc)
// Clear the trace for feature f at location loc in the list of nonzero traces
  { e[f] = 0.0;
    num_nonzero_traces--;
    nonzero_traces[loc] = nonzero_traces[num_nonzero_traces];
    nonzero_traces_inverse[nonzero_traces[loc]] = loc;}



void DecayTraces(float decay_rate)
// Decays all the (nonzero) traces by decay_rate, removing those below minimum_trace
{ 
	for (int loc=num_nonzero_traces-1; loc>=0; loc--)      // necessary to loop downwards
    { 
		int f = nonzero_traces[loc];
        e[f] *= decay_rate;
        if (e[f] < minimum_trace) ClearExistentTrace(f,loc);
	}

}

void IncreaseMinTrace()
// Try to make room for more traces by incrementing minimum_trace by 10%, 
// culling any traces that fall below the new minimum
  { minimum_trace += 0.1 * minimum_trace;
    //cout << "Changing minimum_trace to " << minimum_trace << endl;
    for (int loc=num_nonzero_traces-1; loc>=0; loc--)      // necessary to loop downwards
      { int f = nonzero_traces[loc];
        if (e[f] < minimum_trace) ClearExistentTrace(f,loc);};}
  




