#include "FannFA.h"
#include <stdexcept>

FannFA::FannFA()
{
	ann = NULL;
	fannInput = NULL;
	numGetRewards = 0;
	sumGetReward = 0;
	sumSetReward = 0;
	numSetRewards = 0;
}

FannFA::FannFA(fann* ann)
{
	fannInput = NULL;
	SetANN(ann);
}

FannFA::~FannFA()
{
	if(fannInput != NULL)
		delete fannInput;
}

void FannFA::SetInput(const DoubleVector &observation, const DoubleVector &action)
{
	if(fann_get_num_input(ann) != observation.size() + action.size())
		throw std::runtime_error("ANN input not same size as observation.size()+action.size()");
	
	observation.ExportValues(fannInput);
	double *actionFill = fannInput + observation.size();
	action.ExportValues(actionFill);	
}

fann* FannFA::GetANN()
{
	return ann;
}

void FannFA::SetANN(fann* ann)
{
	this->ann = ann;
	
	if(fannInput != NULL)
		delete fannInput;
		
	fannInput = new double[fann_get_num_input(ann)];

	if(ann->prev_train_slopes == NULL)
		fann_clear_train_arrays(ann);
}

double FannFA::GetReward(const DoubleVector &observation, const DoubleVector &action)	
{
//  	std::cout << "G" << std::flush;
	double res = 0;
	
	//if(numGetRewards > 100)
	{
		SetInput(observation, action);
		double *output = fann_run(ann, fannInput);
		res = output[0];
	}
	
	sumGetReward += res;
	numGetRewards++;
	return res;	
}

void FannFA::SetReward(const DoubleVector &observation, const DoubleVector &action, const double reward)
{
	SetInput(observation, action);
	fann_train(ann, fannInput, (double *)&reward);
	sumSetReward += reward;
	numSetRewards++;
	
// 	std::cout << "S" << std::flush;
	
// 	std::cout << observation << action;
//  std::cout << "reward: " << reward << " learned reward: " << GetReward(observation, action) << std::endl;
}

void FannFA::PrintStats()
{
	cout << endl << "FannIncrementalFA" << endl
		<< "numGetRewards:  " << numGetRewards << endl
		<< "avgGetRewards:  " << sumGetReward/numGetRewards << endl
		<< "avgSetRewards:  " << sumSetReward/numSetRewards << endl
		<< "numSetRewards:  " << numSetRewards << endl
		<< "averageMSE   :  " << fann_get_MSE(ann) << endl;
}

void FannFA::ClearStats()
{
	numGetRewards = 0;
	numSetRewards = 0;
	sumGetReward = 0;
	sumSetReward = 0;
	fann_reset_MSE(ann);
}

unsigned int FannFA::GetNumHiddenNeurons()
{
	return fann_get_total_neurons(ann)-fann_get_num_input(ann)-fann_get_num_output(ann)-1;
}

double FannFA::GetMSE()
{
	return fann_get_MSE(ann);
}
