#!/bin/sh

#Default (for this test)
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Default2"
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Default3"
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -cc 10 -name "BG_Competitive_Cascade_Default"
./BenchAgents.pl 100 BG_Competitive_Cascade_Default2 BG_Competitive_Cascade_Default
mv allplots.ps benchmarkdata/BG_Competitive_Cascade_Default.ps

#stagnation
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 10 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Stagnation_10"
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 15 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Stagnation_15"
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 20 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Stagnation_20"
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Stagnation_30"
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 50 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Stagnation_50"
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 100 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Stagnation_100"
./BenchAgents.pl 100  BG_Competitive_Cascade_Stagnation_10 BG_Competitive_Cascade_Stagnation_15 BG_Competitive_Cascade_Stagnation_20 BG_Competitive_Cascade_Stagnation_30 BG_Competitive_Cascade_Stagnation_50 BG_Competitive_Cascade_Stagnation_100
mv allplots.ps benchmarkdata/BG_Competitive_Cascade_Stagnation.ps
# psselect 1,2 benchmarkdata/BG_Competitive_Cascade_Stagnation.ps benchmarkdata/BG_Competitive_Cascade_Stagnation.select.ps

#cache & cache commit (use whole)
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1 -name "BG_Competitive_Cascade_Cache_500_CC_10_Whole" -cachesize 500 500 -cc 10 -whole-ann
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1 -name "BG_Competitive_Cascade_Cache_1000_CC_10_Whole" -cachesize 1000 1000 -cc 10 -whole-ann
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1 -name "BG_Competitive_Cascade_Cache_2000_CC_10_Whole" -cachesize 2000 2000 -cc 10 -whole-ann

./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1 -name "BG_Competitive_Cascade_Cache_500_CC_100_Whole" -cachesize 500 500 -cc 100 -whole-ann
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1 -name "BG_Competitive_Cascade_Cache_1000_CC_100_Whole" -cachesize 1000 1000 -cc 100 -whole-ann
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1 -name "BG_Competitive_Cascade_Cache_2000_CC_100_Whole" -cachesize 2000 2000 -cc 100 -whole-ann

./BenchAgents.pl 100 BG_Competitive_Cascade_Cache_500_CC_10_Whole BG_Competitive_Cascade_Cache_1000_CC_10_Whole BG_Competitive_Cascade_Cache_2000_CC_10_Whole BG_Competitive_Cascade_Cache_500_CC_100_Whole BG_Competitive_Cascade_Cache_1000_CC_100_Whole BG_Competitive_Cascade_Cache_2000_CC_100_Whole BG_Competitive_Cascade_Default
mv allplots.ps benchmarkdata/BG_Competitive_Cascade_Cache_Whole.ps

#cache & cache commit (no whole)
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1 -name "BG_Competitive_Cascade_Cache_500_CC_10_NoWhole" -cachesize 500 500 -cc 10 -no-whole-ann
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1 -name "BG_Competitive_Cascade_Cache_1000_CC_10_NoWhole" -cachesize 1000 1000 -cc 10 -no-whole-ann
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1 -name "BG_Competitive_Cascade_Cache_2000_CC_10_NoWhole" -cachesize 2000 2000 -cc 10 -no-whole-ann

./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1 -name "BG_Competitive_Cascade_Cache_500_CC_100_NoWhole" -cachesize 500 500 -cc 100 -no-whole-ann
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1 -name "BG_Competitive_Cascade_Cache_1000_CC_100_NoWhole" -cachesize 1000 1000 -cc 100 -no-whole-ann
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1 -name "BG_Competitive_Cascade_Cache_2000_CC_100_NoWhole" -cachesize 2000 2000 -cc 100 -no-whole-ann

./BenchAgents.pl 100 BG_Competitive_Cascade_Cache_500_CC_10_NoWhole BG_Competitive_Cascade_Cache_1000_CC_10_NoWhole BG_Competitive_Cascade_Cache_2000_CC_10_NoWhole BG_Competitive_Cascade_Cache_500_CC_100_NoWhole BG_Competitive_Cascade_Cache_1000_CC_100_NoWhole BG_Competitive_Cascade_Cache_2000_CC_100_NoWhole BG_Competitive_Cascade_Default
mv allplots.ps benchmarkdata/BG_Competitive_Cascade_Cache_NoWhole.ps

#Alpha
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Alpha_0.01" -a 0.01
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Alpha_0.1" -a 0.1
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Alpha_0.2" -a 0.2
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Alpha_0.3" -a 0.3
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Alpha_0.5" -a 0.5

./BenchAgents.pl 100 BG_Competitive_Cascade_Alpha_0.01 BG_Competitive_Cascade_Alpha_0.1 BG_Competitive_Cascade_Alpha_0.2  BG_Competitive_Cascade_Alpha_0.3 BG_Competitive_Cascade_Alpha_0.5
mv allplots.ps benchmarkdata/BG_Competitive_Cascade_Alpha.ps

#Epsilon
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Epsilon_0.0" -e 0.0
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Epsilon_0.001" -e 0.001
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Epsilon_0.01" -e 0.01
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Epsilon_0.1" -e 0.1
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Epsilon_0.2" -e 0.2

./BenchAgents.pl 100 BG_Competitive_Cascade_Epsilon_0.0 BG_Competitive_Cascade_Epsilon_0.001 BG_Competitive_Cascade_Epsilon_0.01 BG_Competitive_Cascade_Epsilon_0.1 BG_Competitive_Cascade_Epsilon_0.2
mv allplots.ps benchmarkdata/BG_Competitive_Cascade_Epsilon.ps

#Lambda
./runbgcompetitive.sh -q -te 6000 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1 -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Lambda_0.0" -l 0.0
./runbgcompetitive.sh -q -te 6000 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Lambda_0.2" -l 0.2
./runbgcompetitive.sh -q -te 6000 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Lambda_0.4" -l 0.4
./runbgcompetitive.sh -q -te 6000 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Lambda_0.6" -l 0.6
./runbgcompetitive.sh -q -te 6000 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Lambda_0.8" -l 0.8
./runbgcompetitive.sh -q -te 6000 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Lambda_1.0" -l 1.0

./BenchAgents.pl 100  BG_Competitive_Cascade_Lambda_0.0 BG_Competitive_Cascade_Lambda_0.2 BG_Competitive_Cascade_Lambda_0.4 BG_Competitive_Cascade_Lambda_0.6 BG_Competitive_Cascade_Lambda_0.8 BG_Competitive_Cascade_Lambda_1.0
mv allplots.ps benchmarkdata/BG_Competitive_Cascade_Lambda.ps

#Gamma
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Gamma_0.0" -g 0.0
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Gamma_0.2" -g 0.2
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Gamma_0.4" -g 0.4
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Gamma_0.6" -g 0.6
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Gamma_0.8" -g 0.8
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Gamma_1.0" -g 1.0

./BenchAgents.pl 100  BG_Competitive_Cascade_Gamma_0.0 BG_Competitive_Cascade_Gamma_0.2 BG_Competitive_Cascade_Gamma_0.4 BG_Competitive_Cascade_Gamma_0.6 BG_Competitive_Cascade_Gamma_0.8 BG_Competitive_Cascade_Gamma_1.0
mv allplots.ps benchmarkdata/BG_Competitive_Cascade_Gamma.ps

#Lambda & Gamma
./runbgcompetitive.sh -q -te 6000 -select 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Gamma_0.0_Lambda_0.0" -g 0.0 -l 0.0
./runbgcompetitive.sh -q -te 6000 -select 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Gamma_0.6_Lambda_0.0" -g 0.6 -l 0.0
./runbgcompetitive.sh -q -te 6000 -select 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Gamma_1.0_Lambda_0.0" -g 1.0 -l 0.0
./runbgcompetitive.sh -q -te 6000 -select 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Gamma_0.0_Lambda_0.6" -g 0.0 -l 0.6
./runbgcompetitive.sh -q -te 6000 -select 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Gamma_0.6_Lambda_0.6" -g 0.6 -l 0.6
./runbgcompetitive.sh -q -te 6000 -select 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Gamma_1.0_Lambda_0.6" -g 1.0 -l 0.6
./runbgcompetitive.sh -q -te 6000 -select 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Gamma_0.0_Lambda_1.0" -g 0.0 -l 1
./runbgcompetitive.sh -q -te 6000 -select 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Gamma_0.6_Lambda_1.0" -g 0.6 -l 1
./runbgcompetitive.sh -q -te 6000 -select 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Gamma_1.0_Lambda_1.0" -g 1.0 -l 1

./BenchAgents.pl 100  BG_Competitive_Cascade_Gamma_0.0_Lambda_0.0 BG_Competitive_Cascade_Gamma_0.6_Lambda_0.0 BG_Competitive_Cascade_Gamma_1.0_Lambda_0.0 BG_Competitive_Cascade_Gamma_0.0_Lambda_0.6 BG_Competitive_Cascade_Gamma_0.6_Lambda_0.6 BG_Competitive_Cascade_Gamma_1.0_Lambda_0.6 BG_Competitive_Cascade_Gamma_0.0_Lambda_1.0 BG_Competitive_Cascade_Gamma_0.6_Lambda_1.0 BG_Competitive_Cascade_Gamma_1.0_Lambda_1.0
mv allplots.ps benchmarkdata/BG_Competitive_Cascade_Gamma_Lambda.ps

#Sigma
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Sigma_0.0" -s 0.0
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Sigma_0.2" -s 0.2
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Sigma_0.4" -s 0.4
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Sigma_0.6" -s 0.6
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Sigma_0.8" -s 0.8
./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Sigma_1.0" -s 1.0

./BenchAgents.pl 100  BG_Competitive_Cascade_Sigma_0.0 BG_Competitive_Cascade_Sigma_0.2 BG_Competitive_Cascade_Sigma_0.4 BG_Competitive_Cascade_Sigma_0.6 BG_Competitive_Cascade_Sigma_0.8 BG_Competitive_Cascade_Sigma_1.0
mv allplots.ps benchmarkdata/BG_Competitive_Cascade_Sigma.ps

#rehearsing
# ./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Rehearsing" -rehearse
# ./BenchAgents.pl 100  BG_Competitive_Cascade_Rehearsing
# mv allplots.ps benchmarkdata/BG_Competitive_Cascade_Rehearsing.ps

#tabu
# ./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Tabu_0"
# ./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Tabu_100" -tabu 100
# ./runbgcompetitive.sh -q -te 6000 -l 0.8 -select 1 -g 1 -s 0.6 -s-epochs 30 -a 0.2 -e 0.1 -fa cascade -fann-layers 2 196 1  -cachesize 2000 2000 -whole-ann -cc 10 -name "BG_Competitive_Cascade_Tabu_1000" -tabu 1000

# ./BenchAgents.pl 100  BG_Competitive_Cascade_Tabu_0 BG_Competitive_Cascade_Tabu_100 BG_Competitive_Cascade_Tabu_1000
# mv allplots.ps benchmarkdata/BG_Competitive_Cascade_Tabu.ps