#include "FannBatchFA.h"
#include "SlidingWindowCache.h"

FannBatchFA::FannBatchFA(fann *ann)
	: FannFA(ann)
{
	ClearStats();
}

FannBatchFA::FannBatchFA()
{
	ClearStats();
}

FannBatchFA::~FannBatchFA()
{
}

void FannBatchFA::SetRewards(fann_train_data *data)
{
	numSetRewards++;
	double mse = fann_train_epoch(ann, data);
	sumMSE += mse;
//   	std::cout << "S " << mse << ", " << sumMSE << " (" << data->output[0][0] << ")" << endl;
}

void FannBatchFA::PrintStats()
{
	cout << endl << "FannBatchFA" << endl
		<< "numGetRewards:  " << numGetRewards << endl
		<< "avgGetRewards:  " << sumGetReward/numGetRewards << endl
		<< "numSetRewards:  " << numSetRewards << endl
		<< "averageMSE   :  " << sumMSE/(double)numSetRewards << endl;
}

void FannBatchFA::ClearStats()
{
	numGetRewards = 0;
	sumGetReward = 0;
	numSetRewards = 0;
	sumMSE = 0;
}

double FannBatchFA::GetMSE()
{
	return sumMSE/(double)numSetRewards;
}
