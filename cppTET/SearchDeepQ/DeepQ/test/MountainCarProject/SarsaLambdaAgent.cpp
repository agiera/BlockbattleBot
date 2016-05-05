/*******************************************************************************
 *  SarsaLambdaAgent.cpp
 *  
 *  Created by Adam White, created on March 29 2007.
 *  Copyright (c) 2005 UAlberta. All rights reserved.
 *
 *  Description.
 *
 *		A Sarsa Lambda control Agent with Tile coding Function Approximation. 
 *		This agent has been tuned for the Mountain Car task. It is based on 
 *		Sutton's code, found here:
 *
 *      http://www.cs.ualberta.ca/~sutton/MountainCar/MountainCar2.cp
 *
 *      The code follows the psuedo-code for linear, gradient-descent 
 *		Sarsa(lambda) given in Figure 8.8 of the book "Reinforcement Learning: 
 *		An Introduction", by Sutton and Barto. One difference is that we use 
 *		the implementation trick mentioned on page 189 to only keep track of 
 *		the traces that are larger than "min-trace". 
 *					
 ********************************************************************************/

#include "SarsaLambdaAgent.h"

// RLGLUE INTERFACE FUNCTIONS ----------------------------------------------
void agent_init(Task_specification ts)
{
	for (int i=0; i<MEMORY_SIZE; i++) {
		weights[i]= 0.0;                     // clear weights 
		traces[i] = 0.0;                     // clear all traces
	}

	epsilon = 0.1;                    // probability of random action
	alpha = 0.5;                      // step size parameter
	lambda = 0.95;                    // trace-decay parameters	
}


Action agent_start(Observation o)
{
    DecayTraces(0.0);                                           
    computeActiveFeatures(o);                                                     
    computeActionValues(); 
	
	oldAction = selectEpsilonGreedyAction();
                                     
	return oldAction;
}

Action agent_step(Reward r, Observation o)
{
	updateTraces();
	
	computeActionValues(oldAction);    //compute value of Q[oldObservation][oldAction]
	double delta = r - QSA[oldAction];
	
	computeActiveFeatures(o);                                              
	computeActionValues();			  //new action values based on new observation											
	
	newAction = selectEpsilonGreedyAction();

	delta += RLgamma * QSA[newAction];
	
    updateWeights(delta);

	oldAction = newAction;    
		
	return newAction;
}

void agent_end(Reward r)
{
	updateTraces();
		
	computeActionValues(oldAction);
	double delta = r - QSA[oldAction];
			
	updateWeights(delta);
	
	epsilon *= 0.99;
}

void agent_cleanup()
{}
 
void agent_freeze()
{
	alpha = 0.0;
} 
 
// HELPER FUNCTIONS ----------------------------------------------
 
Action selectEpsilonGreedyAction()
{
//select an action according to epsilon greedy policy 

	if(drand48() <= epsilon) 
		return (int) (drand48() * (NUM_ACTIONS));
	else
		return argmax(QSA); 
}

void updateTraces()
{
//At the beggining of every episode, decay traces, clear action traces and replace current trace

	DecayTraces(RLgamma*lambda);                              

	for (int a=0; a<NUM_ACTIONS; a++)                        
		if (a != oldAction)
			for (int j=0; j<NUM_TILINGS; j++) ClearTrace(activeFeatures[a][j]);
        for (int j=0; j<NUM_TILINGS; j++) SetTrace(activeFeatures[oldAction][j],1.0); // replace traces
}

void updateWeights(double delta)
{
//Update weights with nonzero traces using td-error

	double temp = (alpha/NUM_TILINGS)*delta;
	for (int i=0; i<num_nonzero_traces; i++)                
	{ 
		int index = nonzero_traces[i];
		weights[index] += temp * traces[index];
	}  
}

void computeActionValues() 
{
// Compute all the action values from current activeFeatures and weights

	for (int a=0; a<NUM_ACTIONS; a++) 
	{
		QSA[a] = 0;
		for (int j=0; j<NUM_TILINGS; j++) 
			QSA[a] += weights[activeFeatures[a][j]];
	}
}
		 
void computeActionValues(int a) 
{
// Compute a particular action value from current activeFeatures and weights

	QSA[a] = 0;
    for (int j=0; j<NUM_TILINGS; j++) 
		QSA[a] += weights[activeFeatures[a][j]];
}

void computeActiveFeatures(double o[NUM_OBSERVATIONS])
{
// get set of active features for current observation. One for each action

	float inputObservations[NUM_OBSERVATIONS];
    inputObservations[0] = o[0] / POS_WIDTH;
    inputObservations[1] = o[1] / VEL_WIDTH;
	
    for (int a=0; a<NUM_ACTIONS; a++)
        tiles(&activeFeatures[a][0],NUM_TILINGS,MEMORY_SIZE, inputObservations,NUM_OBSERVATIONS,a);
}

int argmax(double QSA[NUM_ACTIONS])
{
// Returns index (action) of largest entry in QSA array, breaking ties randomly

	int best_action = 0;
    double best_value = QSA[0];
    int num_ties = 1;                    // actually the number of ties plus 1
    double value;
	
	for (int a=1; a<NUM_ACTIONS; a++) 
	{
		value = QSA[a];
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

// ------------------------ Suttons Trace Code -----------------------------------------------------
void SetTrace(int f, float new_trace_value)
// Set the trace for feature f to the given value, which must be positive
  { if (traces[f] >= minimum_trace) traces[f] = new_trace_value;         // trace already exists
    else { while (num_nonzero_traces >= MAX_NONZERO_TRACES) IncreaseMinTrace(); // ensure room for new trace
           traces[f] = new_trace_value;
           nonzero_traces[num_nonzero_traces] = f;
           nonzero_traces_inverse[f] = num_nonzero_traces;
           num_nonzero_traces++;}}

void ClearTrace(int f)       
// Clear any trace for feature f
{ 
	if (!(traces[f]==0.0)) 
        ClearExistentTrace(f,nonzero_traces_inverse[f]); 
}

void ClearExistentTrace(int f, int loc)
// Clear the trace for feature f at location loc in the list of nonzero traces
  { traces[f] = 0.0;
    num_nonzero_traces--;
    nonzero_traces[loc] = nonzero_traces[num_nonzero_traces];
    nonzero_traces_inverse[nonzero_traces[loc]] = loc;}

void DecayTraces(float decay_rate)
// Decays all the (nonzero) traces by decay_rate, removing those below minimum_trace
{ 
	for (int loc=num_nonzero_traces-1; loc>=0; loc--)      // necessary to loop downwards
    { 
		int f = nonzero_traces[loc];
        traces[f] *= decay_rate;
        if (traces[f] < minimum_trace) ClearExistentTrace(f,loc);
	}

}

void IncreaseMinTrace()
// Try to make room for more traces by incrementing minimum_trace by 10%, 
// culling any traces that fall below the new minimum
  { minimum_trace += 0.1 * minimum_trace;
    for (int loc=num_nonzero_traces-1; loc>=0; loc--)      // necessary to loop downwards
      { int f = nonzero_traces[loc];
        if (traces[f] < minimum_trace) ClearExistentTrace(f,loc);};}
  
// ------------------------ Suttons Trace Code -----------------------------------------------------



