#ifndef _FANNBATCHFA_H_
#define _FANNBATCHFA_H_

#include "FannFA.h"
 
class FannBatchFA : public FannFA
{
public:
    FannBatchFA(fann *ann);
    FannBatchFA();
   ~FannBatchFA();
	virtual void SetRewards(fann_train_data *data);

	void PrintStats();
	void ClearStats();
	double GetMSE();
protected:
	double sumMSE;
	
public:
	template<class Archive>
	void serialize(Archive &ar, const unsigned int version)
	{
		ar & boost::serialization::base_object<FannFA>(*this);
	}
};

#endif
