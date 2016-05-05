#!/bin/sh

#Default (for this test)
#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Default"

#Alpha
#./rl -q -te 100000 -select 1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Alpha_0.0001" -a 0.0001
#./rl -q -te 100000 -select 1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Alpha_0.001" -a 0.001
#./rl -q -te 100000 -select 1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Alpha_0.01" -a 0.01
#./rl -q -te 100000 -select 1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Alpha_0.1" -a 0.1
#./rl -q -te 100000 -select 1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Alpha_0.2" -a 0.2
#./rl -q -te 100000 -select 1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Alpha_0.5" -a 0.5

#./gnuplot.pl BJ_Batch_Default BJ_Batch_Alpha_0.0001 BJ_Batch_Alpha_0.001 BJ_Batch_Alpha_0.1 BJ_Batch_Alpha_0.2 BJ_Batch_Alpha_0.5 | gnuplot
#mv allplots.ps benchmarkdata/BJ_Batch_Alpha.ps

#Epsilon
#./rl -q -te 100000 -select 1 -a 0.1 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Epsilon_0.0" -e 0.0
#./rl -q -te 100000 -select 1 -a 0.1 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Epsilon_0.001" -e 0.001
#./rl -q -te 100000 -select 1 -a 0.1 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Epsilon_0.01" -e 0.01
#./rl -q -te 100000 -select 1 -a 0.1 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Epsilon_0.1" -e 0.1
#./rl -q -te 100000 -select 1 -a 0.1 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Epsilon_0.2" -e 0.2

#./gnuplot.pl BJ_Batch_Default BJ_Batch_Epsilon_0.0 BJ_Batch_Epsilon_0.001 BJ_Batch_Epsilon_0.01 BJ_Batch_Epsilon_0.1 BJ_Batch_Epsilon_0.2 | gnuplot
#mv allplots.ps benchmarkdata/BJ_Batch_Epsilon.ps

#cache & cache commit
#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Cache_500_CC_5" -cachesize 500 500 -cc 5
#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Cache_1000_CC_5" -cachesize 1000 1000 -cc 5
#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Cache_2000_CC_5" -cachesize 2000 2000 -cc 5

#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Cache_500_CC_10" -cachesize 500 500 -cc 10
#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Cache_1000_CC_10" -cachesize 1000 1000 -cc 10
#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Cache_2000_CC_10" -cachesize 2000 2000 -cc 10

#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Cache_500_CC_100" -cachesize 500 500 -cc 100
#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Cache_1000_CC_100" -cachesize 1000 1000 -cc 100
#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Cache_2000_CC_100" -cachesize 2000 2000 -cc 100

#./gnuplot.pl BJ_Batch_Default BJ_Batch_Cache_500_CC_5 BJ_Batch_Cache_1000_CC_5 BJ_Batch_Cache_2000_CC_5 BJ_Batch_Cache_500_CC_10 BJ_Batch_Cache_1000_CC_10 BJ_Batch_Cache_2000_CC_10 BJ_Batch_Cache_500_CC_100 BJ_Batch_Cache_1000_CC_100 BJ_Batch_Cache_2000_CC_100 | gnuplot
#mv allplots.ps benchmarkdata/BJ_Batch_Cache.ps

#Lambda
#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Lambda_0.0" -l 0.0
#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Lambda_0.2" -l 0.2
#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Lambda_0.4" -l 0.4
#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Lambda_0.6" -l 0.6
#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Lambda_0.8" -l 0.8
#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Lambda_1.0" -l 1.0

#./gnuplot.pl BJ_Batch_Default BJ_Batch_Lambda_0.0 BJ_Batch_Lambda_0.2 BJ_Batch_Lambda_0.4 BJ_Batch_Lambda_0.6 BJ_Batch_Lambda_0.8 BJ_Batch_Lambda_1.0 | gnuplot
#mv allplots.ps benchmarkdata/BJ_Batch_Lambda.ps

#Gamma
#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Gamma_0.0" -g 0.0
#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Gamma_0.2" -g 0.2
#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Gamma_0.4" -g 0.4
#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Gamma_0.6" -g 0.6
#./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Gamma_0.8" -g 0.8
./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Gamma_1.0" -g 1.0

./gnuplot.pl BJ_Batch_Gamma_0.0 BJ_Batch_Gamma_0.2 BJ_Batch_Gamma_0.4 BJ_Batch_Gamma_0.6 BJ_Batch_Gamma_0.8 BJ_Batch_Gamma_1.0 | gnuplot
mv allplots.ps benchmarkdata/BJ_Batch_Gamma.ps

#Lambda & Gamma
./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Gamma_0.0_Lambda_0.0" -g 0.0 -l 0.0
./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Gamma_0.6_Lambda_0.0" -g 0.6 -l 0.0
./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Gamma_1.0_Lambda_0.0" -g 1.0 -l 0.0
./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Gamma_0.0_Lambda_0.6" -g 0.0 -l 0.6
./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Gamma_0.6_Lambda_0.6" -g 0.6 -l 0.6
./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Gamma_1.0_Lambda_0.6" -g 1.0 -l 0.6
./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Gamma_0.0_Lambda_1.0" -g 0.0 -l 1.0
./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Gamma_0.6_Lambda_1.0" -g 0.6 -l 1.0
./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Gamma_1.0_Lambda_1.0" -g 1.0 -l 1.0

./gnuplot.pl BJ_Batch_Gamma_0.0_Lambda_0.0 BJ_Batch_Gamma_0.6_Lambda_0.0 BJ_Batch_Gamma_1.0_Lambda_0.0 BJ_Batch_Gamma_0.0_Lambda_0.6 BJ_Batch_Gamma_0.6_Lambda_0.6 BJ_Batch_Gamma_1.0_Lambda_0.6 BJ_Batch_Gamma_0.0_Lambda_1.0 BJ_Batch_Gamma_0.6_Lambda_1.0 BJ_Batch_Gamma_1.0_Lambda_1.0 | gnuplot
mv allplots.ps benchmarkdata/BJ_Batch_Gamma_lambda.ps

#Sigma
./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Sigma_0.0" -s 0.0
./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Sigma_0.2" -s 0.2
./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Sigma_0.4" -s 0.4
./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Sigma_0.6" -s 0.6
./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Sigma_0.8" -s 0.8
./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Sigma_1.0" -s 1.0

./gnuplot.pl BJ_Batch_Sigma_0.0 BJ_Batch_Sigma_0.2 BJ_Batch_Sigma_0.4 BJ_Batch_Sigma_0.6 BJ_Batch_Sigma_0.8 BJ_Batch_Sigma_1.0 | gnuplot
mv allplots.ps benchmarkdata/BJ_Batch_Sigma.ps

#rehearsing
./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Rehearsing" -rehearse

./gnuplot.pl BJ_Batch_Rehearsing | gnuplot
mv allplots.ps benchmarkdata/BJ_Batch_Rehearsing.ps

#tabu
./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Tabu_100" -tabu 100
./rl -q -te 100000 -select 1 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "BJ_Batch_Tabu_1000" -tabu 1000

./gnuplot.pl BJ_Batch_Tabu_100 BJ_Batch_Tabu_1000 | gnuplot
mv allplots.ps benchmarkdata/BJ_Batch_Tabu.ps
