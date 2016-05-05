#!/bin/bash
g++ -Wall --pedantic --pipe scaling_gen_data.cpp -o scaling_gen_data
g++ -Wall --pedantic --pipe -L/usr/local/lib scaling_train.c -o scaling_train `pkg-config --cflags --libs fann`
g++ -Wall --pedantic --pipe -L/usr/local/lib scaling_test.c -o scaling_test `pkg-config --cflags --libs fann`
