#!/bin/sh

#change 2007-09-27 -e from 0.001 to 0.0

#Default (for this test)
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.0 -name "Bg_Incremental_Default"
./BenchBgAgents.pl 1000 Data/Bg_Incremental_Default.txt Bg_Incremental_Default
./gnuplotParamBg.pl Data/Bg_Incremental_Default.txt "Default" 0 | gnuplot
mv allplots.ps Data/Bg_Incremental_Default.ps
./gnuplot.pl Bg_Incremental_Default | gnuplot
ps2pdf allplots.ps Data/Bg_Incremental_Default.pdf

# #Alpha
# rm -f Bg_Incremental_Alpha.txt
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.0001 -name "Bg_Incremental_Alpha_0.0001" -a 0.0001
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.001 -name "Bg_Incremental_Alpha_0.001" -a 0.001
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.01 -name "Bg_Incremental_Alpha_0.01" -a 0.01
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.1 -name "Bg_Incremental_Alpha_0.1" -a 0.1
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.2 -name "Bg_Incremental_Alpha_0.2" -a 0.2
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.5 -name "Bg_Incremental_Alpha_0.5" -a 0.5
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.7 -name "Bg_Incremental_Alpha_0.7" -a 0.7
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.9 -name "Bg_Incremental_Alpha_0.9" -a 0.9

./BenchBgAgents.pl 1000 Data/Bg_Incremental_Alpha.txt Bg_Incremental_Alpha_0.0001 Bg_Incremental_Alpha_0.001 Bg_Incremental_Alpha_0.1 Bg_Incremental_Alpha_0.2 Bg_Incremental_Alpha_0.5 Bg_Incremental_Alpha_0.7 Bg_Incremental_Alpha_0.9
./gnuplotParamBg.pl Data/Bg_Incremental_Alpha.txt "{/Symbol a}" 1 | gnuplot
mv allplots.ps Data/Bg_Incremental_Alpha.ps
./gnuplot.pl Bg_Incremental_Alpha_0.0001 Bg_Incremental_Alpha_0.001 Bg_Incremental_Alpha_0.1 Bg_Incremental_Alpha_0.2 Bg_Incremental_Alpha_0.5 Bg_Incremental_Alpha_0.7 Bg_Incremental_Alpha_0.9 | gnuplot
ps2pdf allplots.ps Data/Bg_Incremental_Alpha.pdf

# 
#Epsilon
# rm -f Bg_Incremental_Epsilon.txt
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -a 0.2 -fa fann -fann-layers 3 196 40 1 -bv 0.0 -name "Bg_Incremental_Epsilon_0.0" -e 0.0
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -a 0.2 -fa fann -fann-layers 3 196 40 1 -bv 0.001 -name "Bg_Incremental_Epsilon_0.001" -e 0.001
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -a 0.2 -fa fann -fann-layers 3 196 40 1 -bv 0.01 -name "Bg_Incremental_Epsilon_0.01" -e 0.01
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -a 0.2 -fa fann -fann-layers 3 196 40 1 -bv 0.1 -name "Bg_Incremental_Epsilon_0.1" -e 0.1
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -a 0.2 -fa fann -fann-layers 3 196 40 1 -bv 0.2 -name "Bg_Incremental_Epsilon_0.2" -e 0.2
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -a 0.2 -fa fann -fann-layers 3 196 40 1 -bv 0.5 -name "Bg_Incremental_Epsilon_0.5" -e 0.5
# # 
./BenchBgAgents.pl 1000 Data/Bg_Incremental_Epsilon.txt Bg_Incremental_Epsilon_0.0 Bg_Incremental_Epsilon_0.001 Bg_Incremental_Epsilon_0.01 Bg_Incremental_Epsilon_0.1 Bg_Incremental_Epsilon_0.2 Bg_Incremental_Epsilon_0.5
./gnuplotParamBg.pl Data/Bg_Incremental_Epsilon.txt "{/Symbol e}" 1 | gnuplot
mv allplots.ps Data/Bg_Incremental_Epsilon.ps
./gnuplot.pl Bg_Incremental_Epsilon_0.0 Bg_Incremental_Epsilon_0.001 Bg_Incremental_Epsilon_0.01 Bg_Incremental_Epsilon_0.1 Bg_Incremental_Epsilon_0.2 Bg_Incremental_Epsilon_0.5 | gnuplot
ps2pdf allplots.ps Data/Bg_Incremental_Epsilon.pdf


# #Lambda
# rm -f Bg_Incremental_Lambda.txt
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.0 -name "Bg_Incremental_Lambda_0.0" -l 0.0
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.1 -name "Bg_Incremental_Lambda_0.1" -l 0.1
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.2 -name "Bg_Incremental_Lambda_0.2" -l 0.2
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.3 -name "Bg_Incremental_Lambda_0.3" -l 0.3
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.4 -name "Bg_Incremental_Lambda_0.4" -l 0.4
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.5 -name "Bg_Incremental_Lambda_0.5" -l 0.5
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.6 -name "Bg_Incremental_Lambda_0.6" -l 0.6
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.7 -name "Bg_Incremental_Lambda_0.7" -l 0.7
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.8 -name "Bg_Incremental_Lambda_0.8" -l 0.8
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.9 -name "Bg_Incremental_Lambda_0.9" -l 0.9
# 
# ./BenchBgAgents.pl 1000 Data/Bg_Incremental_Lambda.txt Bg_Incremental_Lambda_0.0 Bg_Incremental_Lambda_0.1 Bg_Incremental_Lambda_0.2 Bg_Incremental_Lambda_0.3 Bg_Incremental_Lambda_0.4 Bg_Incremental_Lambda_0.5 Bg_Incremental_Lambda_0.6 Bg_Incremental_Lambda_0.7 Bg_Incremental_Lambda_0.8 Bg_Incremental_Lambda_0.9
# ./gnuplotParamBg.pl Data/Bg_Incremental_Lambda.txt "{/Symbol l}" 0 | gnuplot
# mv allplots.ps Data/Bg_Incremental_Lambda.ps
# ./gnuplot.pl Bg_Incremental_Lambda_0.0 Bg_Incremental_Lambda_0.1 Bg_Incremental_Lambda_0.2 Bg_Incremental_Lambda_0.3 Bg_Incremental_Lambda_0.4 Bg_Incremental_Lambda_0.5 Bg_Incremental_Lambda_0.6 Bg_Incremental_Lambda_0.7 Bg_Incremental_Lambda_0.8 Bg_Incremental_Lambda_0.9 | gnuplot
# ps2pdf allplots.ps Data/Bg_Incremental_Lambda.pdf

#Gamma
# rm -f Bg_Incremental_Gamma.txt
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.0 -name "Bg_Incremental_Gamma_0.0" -g 0.0
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.1 -name "Bg_Incremental_Gamma_0.1" -g 0.1
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.2 -name "Bg_Incremental_Gamma_0.2" -g 0.2
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.3 -name "Bg_Incremental_Gamma_0.3" -g 0.3
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.4 -name "Bg_Incremental_Gamma_0.4" -g 0.4
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.5 -name "Bg_Incremental_Gamma_0.5" -g 0.5
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.6 -name "Bg_Incremental_Gamma_0.6" -g 0.6
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.7 -name "Bg_Incremental_Gamma_0.7" -g 0.7
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.8 -name "Bg_Incremental_Gamma_0.8" -g 0.8
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.9 -name "Bg_Incremental_Gamma_0.9" -g 0.9
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 1.0 -name "Bg_Incremental_Gamma_1.0" -g 1.0

./BenchBgAgents.pl 1000 Data/Bg_Incremental_Gamma.txt Bg_Incremental_Gamma_0.0 Bg_Incremental_Gamma_0.1 Bg_Incremental_Gamma_0.2 Bg_Incremental_Gamma_0.3 Bg_Incremental_Gamma_0.4 Bg_Incremental_Gamma_0.5 Bg_Incremental_Gamma_0.6 Bg_Incremental_Gamma_0.7 Bg_Incremental_Gamma_0.8 Bg_Incremental_Gamma_0.9 Bg_Incremental_Gamma_1.0
./gnuplotParamBg.pl Data/Bg_Incremental_Gamma.txt "{/Symbol g}" 0 | gnuplot
mv allplots.ps Data/Bg_Incremental_Gamma.ps
./gnuplot.pl Bg_Incremental_Gamma_0.0 Bg_Incremental_Gamma_0.1 Bg_Incremental_Gamma_0.2 Bg_Incremental_Gamma_0.3 Bg_Incremental_Gamma_0.4 Bg_Incremental_Gamma_0.5 Bg_Incremental_Gamma_0.6 Bg_Incremental_Gamma_0.7 Bg_Incremental_Gamma_0.8 Bg_Incremental_Gamma_0.9 Bg_Incremental_Gamma_1.0 | gnuplot
ps2pdf allplots.ps Data/Bg_Incremental_Gamma.pdf

#Sigma
# rm -f Bg_Incremental_Sigma.txt
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -g 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.0 -name "Bg_Incremental_Sigma_0.0" -s 0.0
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -g 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.1 -name "Bg_Incremental_Sigma_0.1" -s 0.1
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -g 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.2 -name "Bg_Incremental_Sigma_0.2" -s 0.2
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -g 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.3 -name "Bg_Incremental_Sigma_0.3" -s 0.3
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -g 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.4 -name "Bg_Incremental_Sigma_0.4" -s 0.4
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -g 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.5 -name "Bg_Incremental_Sigma_0.5" -s 0.5
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -g 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.6 -name "Bg_Incremental_Sigma_0.6" -s 0.6
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -g 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.7 -name "Bg_Incremental_Sigma_0.7" -s 0.7
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -g 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.8 -name "Bg_Incremental_Sigma_0.8" -s 0.8
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -g 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.9 -name "Bg_Incremental_Sigma_0.9" -s 0.9
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -g 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 1.0 -name "Bg_Incremental_Sigma_1.0" -s 1.0

./BenchBgAgents.pl 1000 Data/Bg_Incremental_Sigma.txt Bg_Incremental_Sigma_0.0 Bg_Incremental_Sigma_0.1 Bg_Incremental_Sigma_0.2 Bg_Incremental_Sigma_0.3 Bg_Incremental_Sigma_0.4 Bg_Incremental_Sigma_0.5 Bg_Incremental_Sigma_0.6 Bg_Incremental_Sigma_0.7 Bg_Incremental_Sigma_0.8 Bg_Incremental_Sigma_0.9 Bg_Incremental_Sigma_1.0
./gnuplotParamBg.pl Data/Bg_Incremental_Sigma.txt "{/Symbol s}" 0 | gnuplot
mv allplots.ps Data/Bg_Incremental_Sigma.ps
./gnuplot.pl Bg_Incremental_Sigma_0.0 Bg_Incremental_Sigma_0.1 Bg_Incremental_Sigma_0.2 Bg_Incremental_Sigma_0.3 Bg_Incremental_Sigma_0.4 Bg_Incremental_Sigma_0.5 Bg_Incremental_Sigma_0.6 Bg_Incremental_Sigma_0.7 Bg_Incremental_Sigma_0.8 Bg_Incremental_Sigma_0.9 Bg_Incremental_Sigma_1.0 | gnuplot
ps2pdf allplots.ps Data/Bg_Incremental_Sigma.pdf

#tabu
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 10 -tabu 0 -name "Bg_Incremental_Tabu_0"
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 10 -tabu 10 -name "Bg_Incremental_Tabu_10"
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 100 -tabu 100 -name "Bg_Incremental_Tabu_100"
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 1000 -tabu 1000 -name "Bg_Incremental_Tabu_1000"
# 
# ./BenchBgAgents.pl 1000 Data/Bg_Incremental_Tabu.txt Bg_Incremental_Tabu_0 Bg_Incremental_Tabu_10 Bg_Incremental_Tabu_100 Bg_Incremental_Tabu_1000
# ./gnuplotParamBg.pl Data/Bg_Incremental_Tabu.txt "Tabu" 1 | gnuplot
# mv allplots.ps Data/Bg_Incremental_Tabu.ps
# ./gnuplot.pl Bg_Incremental_Default Bg_Incremental_Tabu_10 Bg_Incremental_Tabu_100 Bg_Incremental_Tabu_1000 | gnuplot
# ps2pdf allplots.ps Data/Bg_Incremental_Tabu.pdf
# 
# #rehearsing
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 0.0 -name "Bg_Incremental_Default"
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -s 1.0 -g 1.0 -l 0.0 -a 0.2 -e 0.0 -fa fann -fann-layers 3 196 40 1 -bv 1.0 -rehearse -name "Bg_Incremental_Rehearsing_1"
# 
# ./BenchBgAgents.pl 1000 Data/Bg_Incremental_Rehearsing.txt Bg_Incremental_Default Bg_Incremental_Rehearsing_1
# ./gnuplotParamBg.pl Data/Bg_Incremental_Rehearsing.txt "Rehearsing" 0 | gnuplot
# mv allplots.ps Data/Bg_Incremental_Rehearsing.ps
# ./gnuplot.pl Bg_Incremental_Default Bg_Incremental_Rehearsing_1 | gnuplot
# ps2pdf allplots.ps Data/Bg_Incremental_Rehearsing.pdf
