#include "DoubleVector.h"
#include <math.h>
#include <stdexcept>

DoubleVector::DoubleVector(int data, unsigned int size)
 : v(size, -1) //-1 means that the class is not set
{
	if(data < 0 || data >= (int)size)
		throw std::runtime_error("data not in valid range");
		
	v[data] = 1; //1 means that the class is set
}

void DoubleVector::ExportValues(int &data) const
{
	for(unsigned int i = 0; i < v.size(); i++)
	{
		if(v[i] > 0){
			//over 0 means that it is set
			data = i;		
			return;
		}
	}
}

DoubleVector::DoubleVector(double *data, unsigned int size)
 : v(size)
{
	for(unsigned int i = 0; i < size; i++)
	{
		v[i] = data[i];
	}
}

void DoubleVector::ExportValues(double *&data) const
{
	for(unsigned int i = 0; i < v.size(); i++)
	{
		data[i] = v[i];
	}
}

DoubleVector::DoubleVector(int *data, unsigned int size)
 : v(size)
{
	for(unsigned int i = 0; i < size; i++)
	{
		v[i] = data[i];
	}
}

void DoubleVector::ExportValues(int *data) const
{
	for(unsigned int i = 0; i < v.size(); i++)
	{
		data[i] = (int)rint(v[i]);
	}
}

std::ostream& operator<<(std::ostream& s, const DoubleVector& v)
{
	s << "[";
	unsigned int size = v.size();
	for(unsigned int i = 0; i < size; i++)
	{
		if(i != size-1)
  			s << v[i] << ",";
  		else
  			s << v[i];
  	}
  	s << "]";
  	return s;
}
