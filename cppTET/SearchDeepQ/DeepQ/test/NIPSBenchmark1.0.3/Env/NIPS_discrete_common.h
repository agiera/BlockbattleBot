/**
 * This is the RLCommon for use in the NIPS 2005 benchmarking event.
 * This applies only to continuous domains.
 * 
 * Created by Timothy Edmunds
 **/
#ifndef NIPS_COMMON_H
#define NIPS_COMMON_H

// For NIPS, all optional functions will be called.  It is assumed that the
// implementors will insert empty methods where necessary
#define RL_USE_ALL
#define ENV_NAME
#define AGENT_NAME

// For NIPS, all Observations will conform to a standard format:
typedef int* Observation;

// For NIPS, all Actions will conform to a standard format:
typedef int Action;

typedef char* Task_specification;
// For NIPS, all rewards will be a single continuous value
typedef double Reward;

typedef struct {
	Reward r;
	Observation o;
	bool terminal;
} Reward_observation;

typedef int State_key;
typedef int Random_seed_key;

#endif
