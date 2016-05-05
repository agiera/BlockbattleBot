#ifndef BGSTATEREPRESENTATION_H
#define BGSTATEREPRESENTATION_H

class BGStateRepresentation
{
public:
    BGStateRepresentation();

    ~BGStateRepresentation();

	unsigned int GetSize();
	double* getRepresentation(int *board);
	
private:	
	void setPoint(int men, double *inputs);
	unsigned int size;
	double *r;
};

#endif
