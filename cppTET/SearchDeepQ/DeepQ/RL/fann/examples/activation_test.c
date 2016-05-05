/*
  Fast Artificial Neural Network Library (fann)
  Copyright (C) 2003 Steffen Nissen (lukesky@diku.dk)
  
  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.
  
  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.
  
  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

#include "fann.h"

#define num_act 13
#define num_steep 3

int main()
{
	int j = 0, i = 0;
	fann_type value = 0, result = 0, last_result = 0,
		derived = 0, last_derived = 0, calc_derived = 0;
	fann_type step = 0.05;
	fann_type foo = 0;
	
	enum fann_activationfunc_enum activations[num_act] =
		{FANN_LINEAR,
		 FANN_SIGMOID,
		 FANN_SIGMOID_STEPWISE,
		 FANN_SIGMOID_SYMMETRIC,
		 FANN_SIGMOID_SYMMETRIC_STEPWISE,
		 FANN_GAUSSIAN,
		 FANN_GAUSSIAN_SYMMETRIC,
		 FANN_ELLIOT,
		 FANN_ELLIOT_SYMMETRIC,
		 FANN_SIN_SYMMETRIC,
		 FANN_COS_SYMMETRIC,
		 FANN_SIN,
		 FANN_COS};
	
	fann_type steepness[num_steep] = {1, 2, 0.5};
	
	for(i = 0; i < num_steep; i++)
	{
		printf("Steepness: %f\n", steepness[i]);
		for(j = 0; j < num_act; j++)
		{
			printf("START %s:\n", FANN_ACTIVATIONFUNC_NAMES[activations[j]]);
			last_result = 0;
			last_derived = 0;
			
			for(value = -200; value < 200; value += step)
			{
				foo = steepness[i]*value;
				fann_activation_switch(activations[j], foo, result);
				
				switch (activations[j])
				{
					case FANN_LINEAR_PIECE_SYMMETRIC:
					case FANN_THRESHOLD_SYMMETRIC:
					case FANN_SIGMOID_SYMMETRIC:
					case FANN_SIGMOID_SYMMETRIC_STEPWISE:
					case FANN_ELLIOT_SYMMETRIC:
					case FANN_GAUSSIAN_SYMMETRIC:
					case FANN_SIN_SYMMETRIC:
					case FANN_COS_SYMMETRIC:
						if(result > 1 || result < -1)
							printf("%s result %f\n", FANN_ACTIVATIONFUNC_NAMES[activations[j]], result);
						break;
					case FANN_THRESHOLD:
					case FANN_SIGMOID:
					case FANN_SIGMOID_STEPWISE:
					case FANN_GAUSSIAN:
					case FANN_GAUSSIAN_STEPWISE:
					case FANN_ELLIOT:
					case FANN_LINEAR_PIECE:
					case FANN_SIN:
					case FANN_COS:
						if(result > 1 || result < 0)
							printf("%s result %f\n", FANN_ACTIVATIONFUNC_NAMES[activations[j]], result);
						break;
					case FANN_LINEAR:
						break;
				}
				
				if(last_result != 0 &&
					fann_abs(last_result - result) > 0.1*steepness[i])
				{
					printf("%s : %f -> %f, %f -> %f\n", FANN_ACTIVATIONFUNC_NAMES[activations[j]], value-step, last_result, value, result);
				}
				
				derived = fann_activation_derived(activations[j], steepness[i], result, value);
				
				if(last_derived != 0)
				{
					calc_derived = (result - last_result)/step;
					
					if(fann_abs(last_derived - derived) > 0.2*steepness[i])
						printf("%s : (%f,%f) -> %f, (%f,%f) -> %f\n", FANN_ACTIVATIONFUNC_NAMES[activations[j]], value-step, last_result, last_derived, value, result, derived);
					
					if(fann_abs(calc_derived - derived) > 0.2*steepness[i])
						printf("%s, diff=%f : (%f-%f)/%f -> %f, (%f,%f) -> %f\n", FANN_ACTIVATIONFUNC_NAMES[activations[j]], fann_abs(calc_derived - derived), last_result, result, step, calc_derived, value, result, derived);
				}
				
				last_result = result;
				last_derived = derived;
			}
			printf("END %s: TODO, here should be sums of some of the diffs\n", FANN_ACTIVATIONFUNC_NAMES[activations[j]]);
		}
	}
	return 0;
}
