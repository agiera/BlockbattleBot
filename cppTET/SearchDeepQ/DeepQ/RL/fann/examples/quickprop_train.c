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

int main()
{
	const float desired_error = (const float) 0.0;
	const unsigned int max_epochs = 5000;
	const unsigned int epochs_between_reports = 1000;
	struct fann *ann;
	struct fann_train_data *train_data, *test_data;
	unsigned int bit_fail_train, bit_fail_test, i;
	float mse_train, mse_test;
	fann_type *output;
	
	printf("Reading data.\n");
	
	train_data = fann_read_train_from_file("../benchmarks/datasets/parity8.train");
	test_data = fann_read_train_from_file("../benchmarks/datasets/parity8.train");
	
	fann_scale_train_data(train_data, -1, 1);
	fann_scale_train_data(test_data, -1, 1);
	
	printf("Creating network.\n");
	
	ann = fann_create_standard(3, fann_num_input_train_data(train_data), 16, fann_num_output_train_data(train_data));
	
	fann_set_training_algorithm(ann, FANN_TRAIN_QUICKPROP);
	fann_set_activation_function_hidden(ann, FANN_SIGMOID_SYMMETRIC);
	fann_set_activation_function_output(ann, FANN_SIGMOID_SYMMETRIC);
	fann_set_train_error_function(ann, FANN_ERRORFUNC_TANH);
	
	fann_set_learning_rate(ann, 0.35);
	fann_randomize_weights(ann, -2.0,2.0);
	fann_set_bit_fail_limit(ann, 0.5);
	fann_set_train_stop_function(ann, FANN_STOPFUNC_BIT);

	fann_train_on_data(ann, train_data, max_epochs, epochs_between_reports, desired_error);

	mse_train = fann_test_data(ann, train_data);
	bit_fail_train = fann_get_bit_fail(ann);
	mse_test = fann_test_data(ann, test_data);
	bit_fail_test = fann_get_bit_fail(ann);
	
	printf("\nTrain error: %f, Train bit-fail: %d, Test error: %f, Test bit-fail: %d\n\n", 
		   mse_train, bit_fail_train, mse_test, bit_fail_test);
	
	for(i = 0; i < train_data->num_data; i++)
	{
		output = fann_run(ann, train_data->input[i]);
		if((train_data->output[i][0] >= 0 && output[0] <= 0) ||
				  (train_data->output[i][0] <= 0 && output[0] >= 0))
		{
			printf("ERROR: %f does not match %f\n", train_data->output[i][0], output[0]);
		}
	}
	
	fann_save(ann, "quickprop_train.net");

	fann_destroy(ann);

	return 0;
}
