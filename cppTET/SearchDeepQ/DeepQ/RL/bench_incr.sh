#!/bin/sh

#Default (for this test)
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Default"

#Alpha
./runbg.sh -q -te 6000 -ge 101 -select 1 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Alpha_0.0001" -a 0.0001
./runbg.sh -q -te 6000 -ge 101 -select 1 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Alpha_0.001" -a 0.001
#./runbg.sh -q -te 6000 -ge 101 -select 1 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Alpha_0.01" -a 0.01
./runbg.sh -q -te 6000 -ge 101 -select 1 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Alpha_0.1" -a 0.1
./runbg.sh -q -te 6000 -ge 101 -select 1 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Alpha_0.2" -a 0.2
./runbg.sh -q -te 6000 -ge 101 -select 1 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Alpha_0.5" -a 0.5

./gnuplot.pl BG_Random_Incremental_Alpha_0.0001 BG_Random_Incremental_Alpha_0.001 BG_Random_Incremental_Default BG_Random_Incremental_Alpha_0.1 BG_Random_Incremental_Alpha_0.2 BG_Random_Incremental_Alpha_0.5 | gnuplot
mv allplots.ps AlphaIncremental.ps

#Epsilon
./runbg.sh -q -te 6000 -ge 101 -select 1 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Epsilon_0.0" -e 0.0
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Epsilon_0.001" -e 0.001
#./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Epsilon_0.01" -e 0.01
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Epsilon_0.1" -e 0.1
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Epsilon_0.2" -e 0.2

./gnuplot.pl BG_Random_Incremental_Epsilon_0.0 BG_Random_Incremental_Epsilon_0.001 BG_Random_Incremental_Default BG_Random_Incremental_Epsilon_0.1 BG_Random_Incremental_Epsilon_0.2 | gnuplot
mv allplots.ps EpsilonIncremental.ps

#Lambda
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Lambda_0.0" -l 0.0
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Lambda_0.2" -l 0.2
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Lambda_0.4" -l 0.4
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Lambda_0.6" -l 0.6
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Lambda_0.8" -l 0.8
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Lambda_1.0" -l 1.0

./gnuplot.pl BG_Random_Incremental_Default BG_Random_Incremental_Lambda_0.0 BG_Random_Incremental_Lambda_0.2 BG_Random_Incremental_Lambda_0.4 BG_Random_Incremental_Lambda_0.6 BG_Random_Incremental_Lambda_0.8 BG_Random_Incremental_Lambda_1.0 | gnuplot
mv allplots.ps LambdaIncremental.ps

#Gamma
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Gamma_0.0" -g 0.0
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Gamma_0.2" -g 0.2
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Gamma_0.4" -g 0.4
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Gamma_0.6" -g 0.6
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Gamma_0.8" -g 0.8
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Gamma_1.0" -g 1.0

./gnuplot.pl BG_Random_Incremental_Default BG_Random_Incremental_Gamma_0.0 BG_Random_Incremental_Gamma_0.2 BG_Random_Incremental_Gamma_0.4 BG_Random_Incremental_Gamma_0.6 BG_Random_Incremental_Gamma_0.8 BG_Random_Incremental_Gamma_1.0 | gnuplot
mv allplots.ps GammaIncremental.ps

#Lambda & Gamma
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Gamma_0.0_Lambda_0.0" -g 0.0 -l 0.0
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Gamma_0.6_Lambda_0.0" -g 0.6 -l 0.0
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Gamma_1.0_Lambda_0.0" -g 1.0 -l 0.0
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Gamma_0.0_Lambda_0.6" -g 0.0 -l 0.6
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Gamma_0.6_Lambda_0.6" -g 0.6 -l 0.6
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Gamma_1.0_Lambda_0.6" -g 1.0 -l 0.6
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Gamma_0.0_Lambda_1.0" -g 0.0 -l 1.0
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Gamma_0.6_Lambda_1.0" -g 0.6 -l 1.0
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Gamma_1.0_Lambda_1.0" -g 1.0 -l 1.0

./gnuplot.pl BG_Random_Incremental_Default BG_Random_Incremental_Gamma_0.0_Lambda_0.0 BG_Random_Incremental_Gamma_0.6_Lambda_0.0 BG_Random_Incremental_Gamma_1.0_Lambda_0.0 BG_Random_Incremental_Gamma_0.0_Lambda_0.6 BG_Random_Incremental_Gamma_0.6_Lambda_0.6 BG_Random_Incremental_Gamma_1.0_Lambda_0.6 BG_Random_Incremental_Gamma_0.0_Lambda_1.0 BG_Random_Incremental_Gamma_0.6_Lambda_1.0 BG_Random_Incremental_Gamma_1.0_Lambda_1.0 | gnuplot
mv allplots.ps LambdaGammaIncremental.ps

#Sigma
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Sigma_0.0" -s 0.0
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Sigma_0.2" -s 0.2
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Sigma_0.4" -s 0.4
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Sigma_0.6" -s 0.6
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Sigma_0.8" -s 0.8
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Sigma_1.0" -s 1.0

./gnuplot.pl BG_Random_Incremental_Default BG_Random_Incremental_Sigma_0.0 BG_Random_Incremental_Sigma_0.2 BG_Random_Incremental_Sigma_0.4 BG_Random_Incremental_Sigma_0.6 BG_Random_Incremental_Sigma_0.8 BG_Random_Incremental_Sigma_1.0 | gnuplot
mv allplots.ps SigmaIncremental.ps

#rehearsing
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Rehearsing" -rehearse

./gnuplot.pl BG_Random_Incremental_Default BG_Random_Incremental_Rehearsing | gnuplot
mv allplots.ps RehearsingIncremental.ps

#tabu
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Tabu_100" -tabu 100
./runbg.sh -q -te 6000 -ge 101 -select 1 -a 0.2 -e 0.01 -fa fann -nocache -fann-layers 3 196 40 1 -name "BG_Random_Incremental_Tabu_1000" -tabu 1000

./gnuplot.pl BG_Random_Incremental_Default BG_Random_Incremental_Tabu_100 BG_Random_Incremental_Tabu_1000 | gnuplot
mv allplots.ps TabuIncremental.ps

psselect 21,35 benchmarkdata/BG_Random_Incremental_Alpha.ps benchmarkdata/BG_Random_Incremental_Alpha.select.ps
psselect 21,35 benchmarkdata/BG_Random_Incremental_Epsilon.ps benchmarkdata/BG_Random_Incremental_Epsilon.select.ps
psselect 21,35 benchmarkdata/BG_Random_Incremental_Gamma_Lambda.ps benchmarkdata/BG_Random_Incremental_Gamma_Lambda.select.ps
psselect 21,35 benchmarkdata/BG_Random_Incremental_Gamma.ps benchmarkdata/BG_Random_Incremental_Gamma.select.ps
psselect 21,35 benchmarkdata/BG_Random_Incremental_Lambda.ps benchmarkdata/BG_Random_Incremental_Lambda.select.ps
psselect 21,35 benchmarkdata/BG_Random_Incremental_Rehearsing.ps benchmarkdata/BG_Random_Incremental_Rehearsing.select.ps
psselect 21,35 benchmarkdata/BG_Random_Incremental_Sigma.ps benchmarkdata/BG_Random_Incremental_Sigma.select.ps
psselect 21,35 benchmarkdata/BG_Random_Incremental_Tabu.ps benchmarkdata/BG_Random_Incremental_Tabu.select.ps
psmerge -obenchmarkdata/BG_Random_Incremental.select.ps benchmarkdata/BG_Random_Incremental_*.select.ps
