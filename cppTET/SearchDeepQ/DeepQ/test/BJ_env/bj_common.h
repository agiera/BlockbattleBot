#ifndef BJ_COMMON_H
#define BJ_COMMON_H

// An observation is an array of three integers
// 0th element: current value of player's hand
// 1st element: current value of dealer's hand
// 2nd element: 0 -> player does NOT have usable ace

#define AGENT_INIT
#define ENV_INIT
#define AGENT_CLEANUP
#define ENV_CLEANUP

// An action is an integer
// 0 -> player hits
// 1 -> player sticks
typedef int Action;	  
typedef int* Observation;	  


typedef char* Task_specification;
typedef double Reward;

typedef struct {
	Reward r;
	Observation o;
	bool terminal;
} Reward_observation;

typedef int State_key;
typedef int Random_seed_key;

#endif


