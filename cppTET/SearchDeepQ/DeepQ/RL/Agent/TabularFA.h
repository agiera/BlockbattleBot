#ifndef _TABULARFA_H_
#define _TABULARFA_H_

#include <boost/archive/text_iarchive.hpp>
#include <boost/archive/text_oarchive.hpp>
#include <boost/serialization/base_object.hpp>
#include <boost/serialization/utility.hpp>
#include <boost/serialization/map.hpp>

#include "FunctionApproximator.h"
#include <map>

class TabularFA : public FunctionApproximator
{
public:
	TabularFA(double initialValue = 0);
	double GetReward(const DoubleVector &observation, const DoubleVector &action);
	void SetReward(const DoubleVector &observation, const DoubleVector &action, const double reward);

	void PrintStats();
	void ClearStats();
private:
	std::map<DoubleVector, std::map<DoubleVector, double> > table;
	double initialValue;

	unsigned int numSetRewards;
	unsigned int numGetRewards;
	double sumGetReward;

public:
	template<class Archive>
	void serialize(Archive &ar, const unsigned int version)
	{
		ar & boost::serialization::base_object<FunctionApproximator>(*this);
		ar & table;
		ar & initialValue;
	}
};

#endif
