#ifndef _FANNCASCADEFA_H_
#define _FANNCASCADEFA_H_

#include "FannBatchFA.h"
class SlidingWindowCache;
class NFQ;

class FannCascadeFA : public FannBatchFA
{
public:
    FannCascadeFA(fann *ann, bool useWholeAnnTraining, double desiredError);
    FannCascadeFA();
	void Init();
    ~FannCascadeFA();
	void SetRewards(fann_train_data *data);

	void PrintStats();
	void ClearStats();
private:
	enum TrainingPhase
	{
		InitialTraining,
		OutputTraining,
		WholeAnnTraining
	};
	
	void TrainCandidate(fann_train_data *data);
	TrainingPhase trainingPhase;
	double initialMSE;
	double targetImprovement;
	double backslideImprovement;
	unsigned int epochsSinceChange;
	unsigned int epochsSincePhaseChange;
	unsigned int epochs;
//	unsigned int numSetRewards;
//	double sumMSE;
	bool useWholeAnnTraining;
	unsigned int totalEpochs;
	double desiredError;
public:
	SlidingWindowCache *cache;
	NFQ *nfq;
	template<class Archive>
	void serialize(Archive &ar, const unsigned int version)
	{
		ar & boost::serialization::base_object<FannBatchFA>(*this);
		ar & trainingPhase;
		ar & initialMSE;
		ar & targetImprovement;
		ar & backslideImprovement;
		ar & epochsSinceChange;
		ar & epochsSincePhaseChange;
		ar & useWholeAnnTraining;
		ar & desiredError;
	}
};

#endif
