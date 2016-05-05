#ifndef _ACTION_PARTITION_H_
#define _ACTION_PARTITION_H_

#include "C_agent_parser.h"
#include "Agent.h"
#include <math.h>
#include <iostream>
#include "RL_Interface.h"
#include "Benchmark.h"


unsigned int* first_k_actions(const vector<DoubleVector> &actions, 
	vector<double> &actionValues, int k);

#endif