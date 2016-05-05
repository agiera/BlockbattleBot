#ifndef _DOUBLEVECTOR_H_
#define _DOUBLEVECTOR_H_

#include <vector>
#include <iostream>
#include <boost/archive/text_iarchive.hpp>
#include <boost/archive/text_oarchive.hpp>
#include <boost/serialization/base_object.hpp>
#include <boost/serialization/utility.hpp>
#include <boost/serialization/vector.hpp>

using namespace std;

/*
The different constructors and different ToRLGlue functions match together 2 and 2, 
and is used to support different versions of Observation and Action types
*/
class DoubleVector
{
public:
	/* A discrete integer value is made into an array, to better fit into a function approximation
	   method, where -1 means that the place is not set and +1 means that it is.
	*/
	DoubleVector(int data, unsigned int size);
	void ExportValues(int &data) const;
	
	DoubleVector(double *data, unsigned int size);
	void ExportValues(double *&data) const;
	
	DoubleVector(int *data, unsigned int size);
	void ExportValues(int *data) const;
	
	DoubleVector(){}
	
	double operator[](unsigned int i) const 
	{
		return v[i];
	}
	
	bool operator<(const DoubleVector &obj) const
	{
		return v < obj.v;
	}
	
	bool operator!=(const DoubleVector &obj) const
	{
		return v != obj.v;
	}
	
	bool operator==(const DoubleVector &obj) const
	{
		return v == obj.v;
	}
	
	unsigned int size() const
	{
		return v.size();
	}
	
	template<class Archive>
	void serialize(Archive &ar, const unsigned int version)
	{
		ar & v;
	}	
private:
	std::vector<double> v;
};

std::ostream& operator<<(std::ostream& s, const DoubleVector& v);

#endif
