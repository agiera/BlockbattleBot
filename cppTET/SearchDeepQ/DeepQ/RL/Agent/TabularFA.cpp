#include "TabularFA.h"

TabularFA::TabularFA(double initialValue)
 : initialValue(initialValue)
{
	ClearStats();
}

double TabularFA::GetReward(const DoubleVector &observation, const DoubleVector &action)
{
	numGetRewards++;
	double res = initialValue;
	
	std::map<DoubleVector, std::map<DoubleVector, double> >::iterator oIt = table.find(observation);
	if(oIt != table.end())
	{		
		std::map<DoubleVector, double>::iterator aIt = oIt->second.find(action);
		if(aIt != oIt->second.end())
			res = aIt->second;
	}
	
// 	cout << res <<  " = GetReward(" << observation << ", " << action << ")" << endl;
	
	sumGetReward += res;
	return res;
}

void TabularFA::SetReward(const DoubleVector &observation, const DoubleVector &action, const double reward)
{
// 	cout << reward <<  " = SetReward(" << observation << ", " << action << ")" << endl;
	numSetRewards++;
	table[observation][action] = reward;
}

void TabularFA::PrintStats()
{
	cout << endl << "TabularFA" << endl
		<< "numGetRewards:  " << numGetRewards << endl
		<< "avgGetRewards:  " << sumGetReward/numGetRewards << endl
		<< "numSetRewards:  " << numSetRewards << endl;
}
	
void TabularFA::ClearStats()
{
	numGetRewards = 0;
	sumGetReward = 0;
	numSetRewards = 0;
}
