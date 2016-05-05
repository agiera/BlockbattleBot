/*********************************************************************************
 *  SarsaAgent.cpp
 *  
 *
 *  Created by Adam White on Fri Aug 10 2005.
 *  Copyright (c) 2005 UAlberta. All rights reserved.
 * 
 *  A simple tabluar agent that uses sarsa or Q-learning policy iteration.
 *  Desgined for Episodic tasks. This implementation has been tuned to
 *  the Blackjack problem
 *  
 *  State: Integer Single Dimension
 *  Actions: Integer Single dimension (0,1)
 *
 **********************************************************************************/ 
#include "SarsaAgent.h"
	double gamma = 1.0;
	
//Turn on Q-learning	
//#define QLEARN

//Output final policy
//#define OUTPUT_POLICY

// RL-Glue Functions ------------------------------------
void agent_init(Task_specification task_spec)
{	
	for(int i=0; i<numActions;i++)
	for(int j=0; j<numStates;j++)
			 Q[j][i] = 1.0;

	alpha = 0.001;
	epsilon = 0.2;
}

Action agent_start(Observation o)
{
	S = get_state(o);
	A = egreedy(S);  

	return A;
}

Action agent_step(Reward r, Observation o)
{
	int s = get_state(o);
    int a = egreedy(s);

#ifdef QLEARN
	double delta = r + gamma*(Q[s][argmax(s)] - Q[S][a]);
	Q[S][A] = Q[S][A] + alpha*delta;
#else
	double delta = r + gamma*(Q[s][a] - Q[S][A]);
	Q[S][A] = Q[S][A] + alpha*delta;
#endif

	A = a;
	S = s;

	return a;    
}

void agent_end(Reward r)
{
	double error = r - gamma*Q[S][A];
	Q[S][A] = Q[S][A]+ alpha*error;	
	
	epsilon*=0.9995;
}

void agent_cleanup()
{
#ifdef OUTPUT_POLICY
	int card[3];
	printf("\nUseable Ace:\n\n");
	for(int i=21;i>10;i--)
	{
		int j=11;
		card[0]=i; card[1]=j;card[2]=1;
		if(argmax(get_state(card)) == 0) printf("H ");
		else printf("S ");
			
		for(j=2;j<11;j++)
		{
			card[0]=i; card[1]=j;card[2]=1;
			if(argmax(get_state(card)) == 0) printf("H ");
			else printf("S ");
		}
		printf("   %d\n",i);
	}
	
	printf("\nA ");
	for(int j=2;j<11;j++)
		printf("%d ",j);
	printf("\n\n");
	
	printf("\n NO Useable Ace:\n\n");
	for(int i=21;i>10;i--)
	{
		int j=11;
		card[0]=i; card[1]=j;card[2]=0;
		if(argmax(get_state(card)) == 0) printf("H ");
		else printf("S ");
			
		for(j=2;j<11;j++)
		{
			card[0]=i; card[1]=j;card[2]=0;
			if(argmax(get_state(card)) == 0) printf("H ");
			else printf("S ");
		}
		printf("   %d\n",i);
	}
	
	printf("\nA ");
	for(int j=2;j<11;j++)
		printf("%d ",j);
	printf("\n\n");
#endif
}

void agent_freeze()
{
	alpha = 0.0;
	//epsilon = 0.0;
}

// Helper functions ---------------------------
int get_state(Observation o)
{	//convert 3D observation into a 1D intger label
	return o[0] + o[1] * 22 + o[2]*12*22;
} 

int egreedy(int s)
{	//e-greedy policy
	if( drand48() >= epsilon ) 
		return argmax(s);
	else
		return (int)(drand48()*numActions);
}

int argmax(int s)
{	//find best action in a given state s
	if(Q[s][0] > Q[s][1])
		return 0;
	else if (Q[s][0] < Q[s][1])
		return 1;
	else
		return (int)(drand48()*numActions);     
}
