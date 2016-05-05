#ifndef YAHTZEE_COMMON_H
#define YAHTZEE_COMMON_H

#define ENV_INIT
#define AGENT_INIT
#define AGENT_CLEANUP
#define ENV_CLEANUP

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


