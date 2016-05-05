#ifndef _FUNCTIONAPPROXIMATOR_H_
#define _FUNCTIONAPPROXIMATOR_H_

#include "DoubleVector.h"

class FunctionApproximator
{
public:
	virtual double GetReward(const DoubleVector &observation, const DoubleVector &action) = 0;
	virtual void SetReward(const DoubleVector &observation, const DoubleVector &action, const double reward) = 0;
	virtual void UpdateReward(const DoubleVector &observation, const DoubleVector &action, const double reward)
	{
		//Some fa like e.g. slidingwindow would like to do other things when an update occurs
		SetReward(observation, action, reward);
	}
	
	virtual void AddToReward(const DoubleVector &observation, const DoubleVector &action, const double deltaReward)
	{
		SetReward(observation, action, GetReward(observation, action)+deltaReward);
	}
	
	virtual void UpdateAddToReward(const DoubleVector &observation, const DoubleVector &action, const double deltaReward)
	{
		UpdateReward(observation, action, GetReward(observation, action)+deltaReward);
	}
	
	virtual ~FunctionApproximator(){};
	virtual void PrintStats() = 0;
	virtual void ClearStats() = 0;
	
	virtual unsigned int GetNumHiddenNeurons(){ return 0; }
	
	virtual double GetMSE(){ return 0; }
	
    template<class Archive>
    void serialize(Archive &ar, const unsigned int version)
    {
	}	
};

BOOST_IS_ABSTRACT(FunctionApproximator);

#endif
