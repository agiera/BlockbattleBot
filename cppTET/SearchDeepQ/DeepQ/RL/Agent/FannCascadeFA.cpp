#include "FannCascadeFA.h"
#include "SlidingWindowCache.h"
#include "NFQ.h"
#include "Benchmark.h"
#include <stdexcept>

FannCascadeFA::FannCascadeFA(fann *ann, bool useWholeAnnTraining, double desiredError)
	: FannBatchFA(ann)
{
	Init();
	this->useWholeAnnTraining = useWholeAnnTraining;
	this->desiredError = desiredError;
}

FannCascadeFA::FannCascadeFA()
{
	ann = NULL;
	Init();
}

void FannCascadeFA::Init()
{
// 	cerr << "FannCascadeFA::Init" << endl;
	useWholeAnnTraining = true;
	trainingPhase = InitialTraining;
	targetImprovement = 0;
	backslideImprovement = 0;
	epochsSinceChange = 0;
	initialMSE = 0;
	desiredError = 0.0001;
	
	epochs = 0;
	totalEpochs = 0;
	ClearStats();
}

FannCascadeFA::~FannCascadeFA()
{ 
}

void FannCascadeFA::SetRewards(fann_train_data *data)
{
// 	cerr << "FannCascadeFA::SetRewards" << endl;
	if(trainingPhase == InitialTraining)
	{
// 		cout << "1ANN mse: " << fann_test_data(ann, data) << endl;
// 		cout << "2ANN mse: " << fann_test_data(ann, data) << endl;
		initialMSE = fann_train_outputs_epoch(ann, data);
// 		cout << "3ANN mse: " << fann_test_data(ann, data) << endl;
		epochs++;
		
		targetImprovement = 0;
		backslideImprovement = 0;
		epochsSinceChange = 0;
		epochsSincePhaseChange = 0;
		trainingPhase = OutputTraining;
	}
	
	double currentMSE = 0;
	if(trainingPhase == OutputTraining)
		currentMSE = fann_train_outputs_epoch(ann, data);
	else // trainingPhase == WholeAnnTraining 
	{
		currentMSE = fann_train_epoch(ann, data);
	}
	
	epochs++;		
	epochsSinceChange++;
	epochsSincePhaseChange++;
	sumMSE += currentMSE;
	numSetRewards++;
	
	double mseImprovement = initialMSE - currentMSE;
	mseImprovement = currentMSE;

	if(Benchmark::Instance()->verbose)
	{
// 		cout << "AGENT: cascade [" << backslideImprovement << ", " << mseImprovement << ", " 
// 			<< targetImprovement << "] " << epochsSinceChange << " " << epochsSincePhaseChange << endl;
	}
	/* After any significant change, set a new goal and
		* allow a new quota of epochs to reach it */
	if((targetImprovement >= 0 &&
			(mseImprovement > targetImprovement || mseImprovement < backslideImprovement)) ||
		(targetImprovement < 0 &&
			(mseImprovement < targetImprovement || mseImprovement > backslideImprovement)))
	{
		targetImprovement = mseImprovement * (1.0f + ann->cascade_output_change_fraction);
		backslideImprovement = mseImprovement * (1.0f - ann->cascade_output_change_fraction);
		epochsSinceChange = 0;
	}

	if(currentMSE > desiredError) //no reason to add candidates when the mse is low enough
	{
		/* No improvement in allotted period */
		if(epochsSincePhaseChange >= ann->cascade_max_out_epochs ||
		(epochsSinceChange >= ann->cascade_output_stagnation_epochs &&
			epochsSincePhaseChange >= ann->cascade_min_out_epochs))
		{
			if(trainingPhase == OutputTraining && useWholeAnnTraining)
			{
				trainingPhase = WholeAnnTraining;
				initialMSE = currentMSE;
				targetImprovement = 0;
				backslideImprovement = 0;
			}
			else // trainingPhase == WholeAnnTraining
			{
				cout << "Installing candidate number: " <<
					fann_get_total_neurons(ann)-fann_get_num_input(ann)-fann_get_num_output(ann) << " with " << epochsSincePhaseChange << " epochs since change." << flush;
				if(cache != NULL)
					TrainCandidate(cache->GetFannTrainData());
				else if(nfq != NULL)
					TrainCandidate(nfq->GetFannTrainData());
				else
					TrainCandidate(data);
				cout << endl;
				trainingPhase = InitialTraining;
			}			
			epochsSincePhaseChange = 0;
		}
	}
}

void FannCascadeFA::TrainCandidate(fann_train_data *data)
{
	if(fann_initialize_candidates(ann) == -1)
		throw runtime_error("Unable to initialize room for candidates");

// 	cout << "4ANN mse: " << fann_test_data(ann, data) << endl;

	/* train new candidates */
	epochs += fann_train_candidates(ann, data);
	
	/* this installs the best candidate */
	fann_install_candidate(ann);
	
// 	cout << "5ANN mse: " << fann_test_data(ann, data) << endl;
	
	epochs += fann_train_outputs(ann, data, 0);

// 	cout << "6ANN mse: " << fann_test_data(ann, data) << endl;
}

void FannCascadeFA::PrintStats()
{
	char* TrainingPhases[] = {"InitialTraining",
			"OutputTraining",
			"WholeAnnTraining"};

	cout << endl << "FannCascadeFA" << endl
		<< "numCandidates : " <<
			fann_get_total_neurons(ann)-fann_get_num_input(ann)-fann_get_num_output(ann)-1 << endl
		<< "epochs        : " << epochs << endl
		<< "totalEpochs   : " << (totalEpochs+epochs) << endl
		<< "trainingPhase : " << TrainingPhases[trainingPhase] << endl
		<< "epochsChange  : " << epochsSincePhaseChange << endl
		<< "numGetRewards : " << numGetRewards << endl
		<< "avgGetRewards : " << sumGetReward/numGetRewards << endl
		<< "numSetRewards : " << numSetRewards << endl
		<< "averageMSE    : " << sumMSE/(double)numSetRewards << endl;
}

void FannCascadeFA::ClearStats()
{
	totalEpochs += epochs;
	epochs = 0;
	numGetRewards = 0;
	sumGetReward = 0;
	numSetRewards = 0;
	sumMSE = 0;
}
