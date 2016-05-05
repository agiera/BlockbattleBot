#include <algorithm>    // std::nth_element
#include <vector>
#include "C_agent_parser.h"
#include "Agent.h"
#include <math.h>
#include <iostream>
#include "RL_Interface.h"
#include "Benchmark.h"


unsigned int* first_k_actions(const vector<DoubleVector> &actions, 
	vector<double> &actionValues, int k)
{
    unsigned int* indexes = unsigned int[k];
    int l = 0;
    std::vector<int> ties;
    
    double kth_biggest = std::nth_element(v.vegin(), v.end()-k, v.end())
    
    for (int i=0; i < actions.size(); i++)
    {
        if (actionValues[i] > kth_biggest) {
            indexes[l++] = i;
        } else if (actionValues[i] == kth_biggest) {
            ties.push_back(i);
        }
    }
    
    while (l < k) {
        indexes[l++] = ties.pop_back();
    }
    

    return indexes;
}
