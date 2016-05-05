#ifndef _FANNFA_H_
#define _FANNFA_H_

#include "DoubleVector.h"
#include "FunctionApproximator.h"
#include "Benchmark.h"
#include <doublefann.h>
#include <sstream>

class FannFA : public FunctionApproximator
{
public:
	FannFA();
	FannFA(fann* ann);
	virtual ~FannFA();
	fann* GetANN();
	void SetANN(fann* ann);
	void SetInput(const DoubleVector &observation, const DoubleVector &action);
	
	void SetReward(const DoubleVector &observation, const DoubleVector &action, const double reward);
	double GetReward(const DoubleVector &observation, const DoubleVector &action);	

	unsigned int GetNumHiddenNeurons();
	double GetMSE();
	void PrintStats();
	void ClearStats();
protected:
	fann *ann;
	double *fannInput;
	double InternalGetReward(const DoubleVector &observation, const DoubleVector &action);
	int numGetRewards;
	unsigned int numSetRewards;
	double sumGetReward;
	double sumSetReward;

public:
    template<class Archive>
    void save(Archive & ar, const unsigned int version) const
    {
    	ostringstream str;
    	str << Benchmark::Instance()->GetOutputDir() << "fann_" << rand() << ".txt";
 		string file = str.str();
    	fann_save(ann, file.c_str());
    	
    	ar & file;
    }
    
    template<class Archive>
    void load(Archive & ar, const unsigned int version)
    {
    	string file;
    	ar & file;
    	
    	fann *f = fann_create_from_file(file.c_str());
		SetANN(f);
    }
    
	template<class Archive>
	void serialize(Archive &ar, const unsigned int version)
	{
		ar & boost::serialization::base_object<FunctionApproximator>(*this);
		boost::serialization::split_member(ar, *this, version);
	}
};

#endif
