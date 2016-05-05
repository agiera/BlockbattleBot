#!/bin/bash
./scaling_gen_data
./scaling_train > noscaling.txt
./scaling_test >> noscaling.txt
./scaling_train scale > scaling.txt
./scaling_test scale >> scaling.txt
