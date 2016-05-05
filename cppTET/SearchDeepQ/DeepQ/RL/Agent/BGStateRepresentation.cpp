#include "BGStateRepresentation.h"
#include <cstring>

BGStateRepresentation::BGStateRepresentation()
{
	size = 196;
	r = new double[size];
}


BGStateRepresentation::~BGStateRepresentation()
{
}

void BGStateRepresentation::setPoint(int men, double *inputs)
{
    if (men >= 1)
    {
      inputs[0] = 1.0;
      if (men >= 2)
      {
        inputs[1] = 1.0;
        if (men >= 3)
        {
          inputs[2] = 1.0;
          if (men >= 4)
            inputs[3] = ((double)(men - 3)) / 2.0;
        }
      }
    }
}

unsigned int BGStateRepresentation::GetSize()
{
	return size;
}

double* BGStateRepresentation::getRepresentation (int *board)
{
	//memset(r, 0, sizeof(double)*size);
	for(unsigned int i = 0; i < size; i++)
		r[i] = -1.0;

    for (int i = 0; i != 24; i++)
    {
    	if(board[i] > 0)
    		setPoint(board[i], r + 8*i);
    	else if(board[i] < 0)
      		setPoint(-board[i], r + 8*i+4);
    }

    // Now we encode the number of men on the bar as n/2
    r[192] = ((double)board[24])/2.0;
    r[193] = ((double)board[25])/2.0;
    // The number of checkers already borne off as n/15
    r[194] = ((double)board[26])/15.0;
    r[195] = ((double)board[27])/15.0;

    return r;
}
