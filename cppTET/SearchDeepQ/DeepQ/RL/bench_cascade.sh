#!/bin/sh

#Default (for this test)
./runbg.sh -q -te 6000 -select 1 -g 1 -s 0.6 -s-epochs 30 -tabu 100 -a 0.2 -e 0.01 -fa cascade -fann-layers 2 196 1  -cachesize 500 500 -no-whole-ann -cc 50 -name "BG_Heuristic_Cascade_Default2"

./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1  -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Default"

#stagnation
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -s-epochs 10 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Stagnation_10"
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -s-epochs 15 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Stagnation_15"
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -s-epochs 20 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Stagnation_20"
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -s-epochs 30 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Stagnation_30"
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -s-epochs 50 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Stagnation_50"
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -s-epochs 100 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Stagnation_100"
./gnuplot.pl BG_Heuristic_Cascade_Default BG_Heuristic_Cascade_Stagnation_10 BG_Heuristic_Cascade_Stagnation_15 BG_Heuristic_Cascade_Stagnation_20 BG_Heuristic_Cascade_Stagnation_30 BG_Heuristic_Cascade_Stagnation_50 BG_Heuristic_Cascade_Stagnation_100 | gnuplot
mv allplots.ps benchmarkdata/BG_Heuristic_Cascade_Stagnation.ps
psselect 21,35 benchmarkdata/BG_Heuristic_Cascade_Stagnation.ps benchmarkdata/BG_Heuristic_Cascade_Stagnation.select.ps

#cache & cache commit (use whole)
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -name "BG_Heuristic_Cascade_Cache_500_CC_1_Whole" -cachesize 500 500 -cc 1 -whole-ann
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -name "BG_Heuristic_Cascade_Cache_1000_CC_1_Whole" -cachesize 1000 1000 -cc 1 -whole-ann
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -name "BG_Heuristic_Cascade_Cache_2000_CC_5_Whole" -cachesize 2000 2000 -cc 5 -whole-ann

./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -name "BG_Heuristic_Cascade_Cache_500_CC_10_Whole" -cachesize 500 500 -cc 10 -whole-ann
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -name "BG_Heuristic_Cascade_Cache_1000_CC_10_Whole" -cachesize 1000 1000 -cc 10 -whole-ann
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -name "BG_Heuristic_Cascade_Cache_2000_CC_10_Whole" -cachesize 2000 2000 -cc 10 -whole-ann

./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -name "BG_Heuristic_Cascade_Cache_500_CC_100_Whole" -cachesize 500 500 -cc 100 -whole-ann
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -name "BG_Heuristic_Cascade_Cache_1000_CC_100_Whole" -cachesize 1000 1000 -cc 100 -whole-ann
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -name "BG_Heuristic_Cascade_Cache_2000_CC_100_Whole" -cachesize 2000 2000 -cc 100 -whole-ann

./gnuplot.pl BG_Heuristic_Cascade_Cache_500_CC_1_Whole BG_Heuristic_Cascade_Cache_1000_CC_1_Whole BG_Heuristic_Cascade_Cache_2000_CC_5_Whole BG_Heuristic_Cascade_Cache_500_CC_10_Whole BG_Heuristic_Cascade_Cache_1000_CC_10_Whole BG_Heuristic_Cascade_Cache_2000_CC_10_Whole BG_Heuristic_Cascade_Cache_500_CC_100_Whole BG_Heuristic_Cascade_Cache_1000_CC_100_Whole BG_Heuristic_Cascade_Cache_2000_CC_100_Whole BG_Heuristic_Cascade_Default | gnuplot
mv allplots.ps benchmarkdata/BG_Heuristic_Cascade_Cache_Whole.ps

#cache & cache commit (no whole)
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -name "BG_Heuristic_Cascade_Cache_500_CC_1_NoWhole" -cachesize 500 500 -cc 1 -no-whole-ann
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -name "BG_Heuristic_Cascade_Cache_1000_CC_1_NoWhole" -cachesize 1000 1000 -cc 1 -no-whole-ann
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -name "BG_Heuristic_Cascade_Cache_2000_CC_1_NoWhole" -cachesize 2000 2000 -cc 1 -no-whole-ann

./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -name "BG_Heuristic_Cascade_Cache_500_CC_10_NoWhole" -cachesize 500 500 -cc 10 -no-whole-ann
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -name "BG_Heuristic_Cascade_Cache_1000_CC_10_NoWhole" -cachesize 1000 1000 -cc 10 -no-whole-ann
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -name "BG_Heuristic_Cascade_Cache_2000_CC_10_NoWhole" -cachesize 2000 2000 -cc 10 -no-whole-ann

./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -name "BG_Heuristic_Cascade_Cache_500_CC_100_NoWhole" -cachesize 500 500 -cc 100 -no-whole-ann
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -name "BG_Heuristic_Cascade_Cache_1000_CC_100_NoWhole" -cachesize 1000 1000 -cc 100 -no-whole-ann
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -name "BG_Heuristic_Cascade_Cache_2000_CC_100_NoWhole" -cachesize 2000 2000 -cc 100 -no-whole-ann

./gnuplot.pl BG_Heuristic_Cascade_Cache_500_CC_1_NoWhole BG_Heuristic_Cascade_Cache_1000_CC_1_NoWhole BG_Heuristic_Cascade_Cache_2000_CC_1_NoWhole BG_Heuristic_Cascade_Cache_500_CC_10_NoWhole BG_Heuristic_Cascade_Cache_1000_CC_10_NoWhole BG_Heuristic_Cascade_Cache_2000_CC_10_NoWhole BG_Heuristic_Cascade_Cache_500_CC_100_NoWhole BG_Heuristic_Cascade_Cache_1000_CC_100_NoWhole BG_Heuristic_Cascade_Cache_2000_CC_100_NoWhole BG_Heuristic_Cascade_Default | gnuplot
mv allplots.ps benchmarkdata/BG_Heuristic_Cascade_Cache_NoWhole.ps

#Alpha
./runbg.sh -q -te 6000 -select 1 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Alpha_0.0001" -a 0.0001
./runbg.sh -q -te 6000 -select 1 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Alpha_0.001" -a 0.001
./runbg.sh -q -te 6000 -select 1 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Alpha_0.01" -a 0.01
./runbg.sh -q -te 6000 -select 1 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Alpha_0.1" -a 0.1
./runbg.sh -q -te 6000 -select 1 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Alpha_0.2" -a 0.2
./runbg.sh -q -te 6000 -select 1 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Alpha_0.5" -a 0.5

./gnuplot.pl BG_Heuristic_Cascade_Default BG_Heuristic_Cascade_Alpha_0.0001 BG_Heuristic_Cascade_Alpha_0.001  BG_Heuristic_Cascade_Alpha_0.01 BG_Heuristic_Cascade_Alpha_0.1 BG_Heuristic_Cascade_Alpha_0.2 BG_Heuristic_Cascade_Alpha_0.5 | gnuplot
mv allplots.ps benchmarkdata/BG_Heuristic_Cascade_Alpha.ps

#Epsilon
./runbg.sh -q -te 6000 -select 1 -a 0.2 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Epsilon_0.0" -e 0.0
./runbg.sh -q -te 6000 -select 1 -a 0.2 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Epsilon_0.001" -e 0.001
./runbg.sh -q -te 6000 -select 1 -a 0.2 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Epsilon_0.01" -e 0.01
./runbg.sh -q -te 6000 -select 1 -a 0.2 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Epsilon_0.1" -e 0.1
./runbg.sh -q -te 6000 -select 1 -a 0.2 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Epsilon_0.2" -e 0.2

./gnuplot.pl BG_Heuristic_Cascade_Default BG_Heuristic_Cascade_Epsilon_0.0 BG_Heuristic_Cascade_Epsilon_0.001 BG_Heuristic_Cascade_Epsilon_0.01 BG_Heuristic_Cascade_Epsilon_0.1 BG_Heuristic_Cascade_Epsilon_0.2 | gnuplot
mv allplots.ps benchmarkdata/BG_Heuristic_Cascade_Epsilon.ps

#Lambda
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Lambda_0.0" -l 0.0
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Lambda_0.2" -l 0.2
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Lambda_0.4" -l 0.4
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Lambda_0.6" -l 0.6
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Lambda_0.8" -l 0.8
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Lambda_1.0" -l 1.0

./gnuplot.pl BG_Heuristic_Cascade_Default BG_Heuristic_Cascade_Lambda_0.0 BG_Heuristic_Cascade_Lambda_0.2 BG_Heuristic_Cascade_Lambda_0.4 BG_Heuristic_Cascade_Lambda_0.6 BG_Heuristic_Cascade_Lambda_0.8 BG_Heuristic_Cascade_Lambda_1.0 | gnuplot
mv allplots.ps benchmarkdata/BG_Heuristic_Cascade_Lambda.ps

#Gamma
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Gamma_0.0" -g 0.0
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Gamma_0.2" -g 0.2
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Gamma_0.4" -g 0.4
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Gamma_0.6" -g 0.6
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Gamma_0.8" -g 0.8
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Gamma_1.0" -g 1.0

./gnuplot.pl BG_Heuristic_Cascade_Default BG_Heuristic_Cascade_Gamma_0.0 BG_Heuristic_Cascade_Gamma_0.2 BG_Heuristic_Cascade_Gamma_0.4 BG_Heuristic_Cascade_Gamma_0.6 BG_Heuristic_Cascade_Gamma_0.8 BG_Heuristic_Cascade_Gamma_1.0 | gnuplot
mv allplots.ps benchmarkdata/BG_Heuristic_Cascade_Gamma.ps

#Lambda & Gamma
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Gamma_0.0_Lambda_0.0" -g 0.0 -l 0.0
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Gamma_0.6_Lambda_0.0" -g 0.6 -l 0.0
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Gamma_1.0_Lambda_0.0" -g 1.0 -l 0.0
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Gamma_0.0_Lambda_0.6" -g 0.0 -l 0.6
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Gamma_0.6_Lambda_0.6" -g 0.6 -l 0.6
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Gamma_1.0_Lambda_0.6" -g 1.0 -l 0.6
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Gamma_0.0_Lambda_1.0" -g 0.0 -l 1.0
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Gamma_0.6_Lambda_1.0" -g 0.6 -l 1.0
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Gamma_1.0_Lambda_1.0" -g 1.0 -l 1.0

./gnuplot.pl BG_Heuristic_Cascade_Default BG_Heuristic_Cascade_Gamma_0.0_Lambda_0.0 BG_Heuristic_Cascade_Gamma_0.6_Lambda_0.0 BG_Heuristic_Cascade_Gamma_1.0_Lambda_0.0 BG_Heuristic_Cascade_Gamma_0.0_Lambda_0.6 BG_Heuristic_Cascade_Gamma_0.6_Lambda_0.6 BG_Heuristic_Cascade_Gamma_1.0_Lambda_0.6 BG_Heuristic_Cascade_Gamma_0.0_Lambda_1.0 BG_Heuristic_Cascade_Gamma_0.6_Lambda_1.0 BG_Heuristic_Cascade_Gamma_1.0_Lambda_1.0 | gnuplot
mv allplots.ps benchmarkdata/BG_Heuristic_Cascade_Gamma_Lambda.ps

#Sigma
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Sigma_0.0" -s 0.0
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Sigma_0.2" -s 0.2
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Sigma_0.4" -s 0.4
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Sigma_0.6" -s 0.6
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Sigma_0.8" -s 0.8
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Sigma_1.0" -s 1.0

./gnuplot.pl BG_Heuristic_Cascade_Default BG_Heuristic_Cascade_Sigma_0.0 BG_Heuristic_Cascade_Sigma_0.2 BG_Heuristic_Cascade_Sigma_0.4 BG_Heuristic_Cascade_Sigma_0.6 BG_Heuristic_Cascade_Sigma_0.8 BG_Heuristic_Cascade_Sigma_1.0 | gnuplot
mv allplots.ps benchmarkdata/BG_Heuristic_Cascade_Sigma.ps

#rehearsing
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Rehearsing" -rehearse

./gnuplot.pl BG_Heuristic_Cascade_Default BG_Heuristic_Cascade_Rehearsing | gnuplot
mv allplots.ps benchmarkdata/BG_Heuristic_Cascade_Rehearsing.ps

#tabu
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Tabu_100" -tabu 100
./runbg.sh -q -te 6000 -select 1 -a 0.2 -e 0.001 -fa cascade -fann-layers 2 196 1 -cachesize 500 500 -cc 10 -name "BG_Heuristic_Cascade_Tabu_1000" -tabu 1000

./gnuplot.pl BG_Heuristic_Cascade_Default BG_Heuristic_Cascade_Tabu_100 BG_Heuristic_Cascade_Tabu_1000 | gnuplot
mv allplots.ps benchmarkdata/BG_Heuristic_Cascade_Tabu.ps

psselect 21,35 benchmarkdata/BG_Heuristic_Cascade_Alpha.ps benchmarkdata/BG_Heuristic_Cascade_Alpha.select.ps
psselect 21,35 benchmarkdata/BG_Heuristic_Cascade_Cache_NoWhole.ps benchmarkdata/BG_Heuristic_Cascade_Cache_NoWhole.select.ps
psselect 21,35 benchmarkdata/BG_Heuristic_Cascade_Cache_Whole.ps benchmarkdata/BG_Heuristic_Cascade_Cache_Whole.select.ps
psselect 21,35 benchmarkdata/BG_Heuristic_Cascade_Epsilon.ps benchmarkdata/BG_Heuristic_Cascade_Epsilon.select.ps
psselect 21,35 benchmarkdata/BG_Heuristic_Cascade_Gamma_Lambda.ps benchmarkdata/BG_Heuristic_Cascade_Gamma_Lambda.select.ps
psselect 21,35 benchmarkdata/BG_Heuristic_Cascade_Gamma.ps benchmarkdata/BG_Heuristic_Cascade_Gamma.select.ps
psselect 21,35 benchmarkdata/BG_Heuristic_Cascade_Lambda.ps benchmarkdata/BG_Heuristic_Cascade_Lambda.select.ps
psselect 21,35 benchmarkdata/BG_Heuristic_Cascade_Rehearsing.ps benchmarkdata/BG_Heuristic_Cascade_Rehearsing.select.ps
psselect 21,35 benchmarkdata/BG_Heuristic_Cascade_Sigma.ps benchmarkdata/BG_Heuristic_Cascade_Sigma.select.ps
psselect 21,35 benchmarkdata/BG_Heuristic_Cascade_Tabu.ps benchmarkdata/BG_Heuristic_Cascade_Tabu.select.ps
psmerge -obenchmarkdata/BG_Heuristic_Cascade.select.ps benchmarkdata/BG_Heuristic_Cascade_*.select.ps
