#!/bin/sh

date;

#rm -f summary.txt;

max_seconds_training=420;
secs_between_reports=0.1;
number_of_runs=4;

function benchmark_algorithm() {
    echo "./quality $algo datasets/$prob.train datasets/$prob.test $prob.$algo.train.out $prob.$algo.test.out $n1 $n2 $sec_train $secs_between_reports $number_of_runs"
    date;
}

function benchmark_problem() {
    rm -f *_fixed.net
    #algo="fann_rprop_stepwise"; benchmark_algorithm;
    #echo "./quality_fixed $prob.$algo.train.out_fixed_train $prob.$algo.train.out_fixed_test $prob.$algo.fixed_train.out $prob.$algo.fixed_test.out *_fixed.net"    	
    algo="fann_cascade_rprop_one_activation"; benchmark_algorithm;
    algo="fann_cascade_rprop_multi_activation"; benchmark_algorithm;
	#    algo="fann_cascade_sarprop_one_activation"; benchmark_algorithm;
	#    algo="fann_cascade_sarprop_multi_activation"; benchmark_algorithm;
    algo="fann_cascade_quickprop_one_activation"; benchmark_algorithm;
    algo="fann_cascade_quickprop_multi_activation"; benchmark_algorithm;
    #algo="fann_cascade_batch_one_activation"; benchmark_algorithm;
    # algo="fann_cascade_batch_multi_activation"; benchmark_algorithm;
    algo="fann_rprop"; benchmark_algorithm;
	#    algo="fann_sarprop"; benchmark_algorithm;
    algo="fann_quickprop"; benchmark_algorithm;
    #algo="fann_quickprop_stepwise"; benchmark_algorithm;
    algo="fann_batch"; benchmark_algorithm;
    #algo="fann_batch_stepwise"; benchmark_algorithm;
    #algo="fann_incremental"; benchmark_algorithm;
    algo="fann_incremental_momentum"; benchmark_algorithm;
    #algo="fann_incremental_stepwise"; benchmark_algorithm;

    #comment out two following lines if the libraries are not available
    algo="lwnn"; benchmark_algorithm;
    algo="jneural"; benchmark_algorithm;
}