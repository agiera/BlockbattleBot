#!/bin/sh

# change 2007-08-12 -cachesize from 1000 5000 to 2000 2000, -te from 20000 to 15000
# change 2007-08-14 -e from 0.2 to 0.01
# change 2007-08-15 -l from 0.5 to 0.3, -cachesize from 2000 2000 to 4000 4000
# change 2007-08-17 -cc from 30 to 20, -te from 15000 to 10000

#Default (for this test)
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.0  -name "Bg_Cascade_Default"
./BenchBgAgents.pl 1000 Data/Bg_Cascade_Default.txt Bg_Cascade_Default
./gnuplotParamBg.pl Data/Bg_Cascade_Default.txt "Default" 0 | gnuplot
mv allplots.ps Data/Bg_Cascade_Default.ps
./gnuplot.pl Bg_Cascade_Default | gnuplot
ps2pdf allplots.ps Data/Bg_Cascade_Default.pdf

./runbgcompetitive.sh -q -te 50000 -select 1 -timeout 1440 -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.0  -name "Bg_Cascade_Default24h"
./BenchBgAgents.pl 1000 Data/Bg_Cascade_Default24h.txt Bg_Cascade_Default24h
./gnuplotParamBg.pl Data/Bg_Cascade_Default24h.txt "Default 24h" 0 | gnuplot
mv allplots.ps Data/Bg_Cascade_Default24h.ps
./gnuplot.pl Bg_Cascade_Default24h | gnuplot
cp allplots.ps Data/Bg_Cascade_Default24h_Time.ps
ps2pdf allplots.ps Data/Bg_Cascade_Default24h.pdf

# #Alpha
# rm -f Bg_Cascade_Alpha.txt
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.0001  -name "Bg_Cascade_Alpha_0.0001" -a 0.0001
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.001  -name "Bg_Cascade_Alpha_0.001" -a 0.001
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.01  -name "Bg_Cascade_Alpha_0.01" -a 0.01
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.1  -name "Bg_Cascade_Alpha_0.1" -a 0.1
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.2  -name "Bg_Cascade_Alpha_0.2" -a 0.2
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.5  -name "Bg_Cascade_Alpha_0.5" -a 0.5
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.7  -name "Bg_Cascade_Alpha_0.7" -a 0.7
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.9  -name "Bg_Cascade_Alpha_0.9" -a 0.9

./BenchBgAgents.pl 1000 Data/Bg_Cascade_Alpha.txt Bg_Cascade_Alpha_0.0001 Bg_Cascade_Alpha_0.001 Bg_Cascade_Alpha_0.1 Bg_Cascade_Alpha_0.2 Bg_Cascade_Alpha_0.5 Bg_Cascade_Alpha_0.7  Bg_Cascade_Alpha_0.9
./gnuplotParamBg.pl Data/Bg_Cascade_Alpha.txt "{/Symbol a}" 1 | gnuplot
mv allplots.ps Data/Bg_Cascade_Alpha.ps
./gnuplot.pl  Bg_Cascade_Alpha_0.0001 Bg_Cascade_Alpha_0.001 Bg_Cascade_Alpha_0.1 Bg_Cascade_Alpha_0.2 Bg_Cascade_Alpha_0.5 Bg_Cascade_Alpha_0.7  Bg_Cascade_Alpha_0.9 | gnuplot
ps2pdf allplots.ps Data/Bg_Cascade_Alpha.pdf

# 
#Epsilon
# rm -f Bg_Cascade_Epsilon.txt
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -a 0.7 -fa cascade -fann-layers 2 196 1 -bv 0.0  -name "Bg_Cascade_Epsilon_0.0" -e 0.0
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -a 0.7 -fa cascade -fann-layers 2 196 1 -bv 0.001  -name "Bg_Cascade_Epsilon_0.001" -e 0.001
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -a 0.7 -fa cascade -fann-layers 2 196 1 -bv 0.01  -name "Bg_Cascade_Epsilon_0.01" -e 0.01
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -a 0.7 -fa cascade -fann-layers 2 196 1 -bv 0.1  -name "Bg_Cascade_Epsilon_0.1" -e 0.1
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -a 0.7 -fa cascade -fann-layers 2 196 1 -bv 0.2  -name "Bg_Cascade_Epsilon_0.2" -e 0.2
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -a 0.7 -fa cascade -fann-layers 2 196 1 -bv 0.5  -name "Bg_Cascade_Epsilon_0.5" -e 0.5
# # 
./BenchBgAgents.pl 1000 Data/Bg_Cascade_Epsilon.txt Bg_Cascade_Epsilon_0.0 Bg_Cascade_Epsilon_0.001 Bg_Cascade_Epsilon_0.01 Bg_Cascade_Epsilon_0.1 Bg_Cascade_Epsilon_0.2 Bg_Cascade_Epsilon_0.5
./gnuplotParamBg.pl Data/Bg_Cascade_Epsilon.txt "{/Symbol e}" 0 | gnuplot
mv allplots.ps Data/Bg_Cascade_Epsilon.ps
./gnuplot.pl Bg_Cascade_Epsilon_0.0 Bg_Cascade_Epsilon_0.001 Bg_Cascade_Epsilon_0.01 Bg_Cascade_Epsilon_0.1 Bg_Cascade_Epsilon_0.2 Bg_Cascade_Epsilon_0.5 | gnuplot
ps2pdf allplots.ps Data/Bg_Cascade_Epsilon.pdf


# #Lambda
# rm -f Bg_Cascade_Lambda.txt
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.0  -name "Bg_Cascade_Lambda_0.0" -l 0.0
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.1  -name "Bg_Cascade_Lambda_0.1" -l 0.1
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.2  -name "Bg_Cascade_Lambda_0.2" -l 0.2
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.3  -name "Bg_Cascade_Lambda_0.3" -l 0.3
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.4  -name "Bg_Cascade_Lambda_0.4" -l 0.4
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.5  -name "Bg_Cascade_Lambda_0.5" -l 0.5
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.6  -name "Bg_Cascade_Lambda_0.6" -l 0.6
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.7  -name "Bg_Cascade_Lambda_0.7" -l 0.7
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.8  -name "Bg_Cascade_Lambda_0.8" -l 0.8
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.9  -name "Bg_Cascade_Lambda_0.9" -l 0.9

./BenchBgAgents.pl 1000 Data/Bg_Cascade_Lambda.txt Bg_Cascade_Lambda_0.0 Bg_Cascade_Lambda_0.1 Bg_Cascade_Lambda_0.2 Bg_Cascade_Lambda_0.3 Bg_Cascade_Lambda_0.4 Bg_Cascade_Lambda_0.5 Bg_Cascade_Lambda_0.6 Bg_Cascade_Lambda_0.7 Bg_Cascade_Lambda_0.8 Bg_Cascade_Lambda_0.9
./gnuplotParamBg.pl Data/Bg_Cascade_Lambda.txt "{/Symbol l}" 0 | gnuplot
mv allplots.ps Data/Bg_Cascade_Lambda.ps
./gnuplot.pl  Bg_Cascade_Lambda_0.0 Bg_Cascade_Lambda_0.1 Bg_Cascade_Lambda_0.2 Bg_Cascade_Lambda_0.3 Bg_Cascade_Lambda_0.4 Bg_Cascade_Lambda_0.5 Bg_Cascade_Lambda_0.6 Bg_Cascade_Lambda_0.7 Bg_Cascade_Lambda_0.8 Bg_Cascade_Lambda_0.9 | gnuplot
ps2pdf allplots.ps Data/Bg_Cascade_Lambda.pdf

#Gamma
# rm -f Bg_Cascade_Gamma.txt
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.0  -name "Bg_Cascade_Gamma_0.0" -g 0.0
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.1  -name "Bg_Cascade_Gamma_0.1" -g 0.1
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.2  -name "Bg_Cascade_Gamma_0.2" -g 0.2
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.3  -name "Bg_Cascade_Gamma_0.3" -g 0.3
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.4  -name "Bg_Cascade_Gamma_0.4" -g 0.4
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.5  -name "Bg_Cascade_Gamma_0.5" -g 0.5
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.6  -name "Bg_Cascade_Gamma_0.6" -g 0.6
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.7  -name "Bg_Cascade_Gamma_0.7" -g 0.7
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.8  -name "Bg_Cascade_Gamma_0.8" -g 0.8
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.9  -name "Bg_Cascade_Gamma_0.9" -g 0.9
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 1.0  -name "Bg_Cascade_Gamma_1.0" -g 1.0

./BenchBgAgents.pl 1000 Data/Bg_Cascade_Gamma.txt Bg_Cascade_Gamma_0.0 Bg_Cascade_Gamma_0.1 Bg_Cascade_Gamma_0.2 Bg_Cascade_Gamma_0.3 Bg_Cascade_Gamma_0.4 Bg_Cascade_Gamma_0.5 Bg_Cascade_Gamma_0.6 Bg_Cascade_Gamma_0.7 Bg_Cascade_Gamma_0.8 Bg_Cascade_Gamma_0.9 Bg_Cascade_Gamma_1.0
./gnuplotParamBg.pl Data/Bg_Cascade_Gamma.txt "{/Symbol g}" 0 | gnuplot
mv allplots.ps Data/Bg_Cascade_Gamma.ps
./gnuplot.pl  Bg_Cascade_Gamma_0.0 Bg_Cascade_Gamma_0.1 Bg_Cascade_Gamma_0.2 Bg_Cascade_Gamma_0.3 Bg_Cascade_Gamma_0.4 Bg_Cascade_Gamma_0.5 Bg_Cascade_Gamma_0.6 Bg_Cascade_Gamma_0.7 Bg_Cascade_Gamma_0.8 Bg_Cascade_Gamma_0.9 Bg_Cascade_Gamma_1.0 | gnuplot
ps2pdf allplots.ps Data/Bg_Cascade_Gamma.pdf

#Sigma
# rm -f Bg_Cascade_Sigma.txt
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.0  -name "Bg_Cascade_Sigma_0.0" -s 0.0
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.1  -name "Bg_Cascade_Sigma_0.1" -s 0.1
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.2  -name "Bg_Cascade_Sigma_0.2" -s 0.2
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.3  -name "Bg_Cascade_Sigma_0.3" -s 0.3
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.4  -name "Bg_Cascade_Sigma_0.4" -s 0.4
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.5  -name "Bg_Cascade_Sigma_0.5" -s 0.5
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.6  -name "Bg_Cascade_Sigma_0.6" -s 0.6
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.7  -name "Bg_Cascade_Sigma_0.7" -s 0.7
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.8  -name "Bg_Cascade_Sigma_0.8" -s 0.8
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.9  -name "Bg_Cascade_Sigma_0.9" -s 0.9
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 1.0  -name "Bg_Cascade_Sigma_1.0" -s 1.0

./BenchBgAgents.pl 1000 Data/Bg_Cascade_Sigma.txt Bg_Cascade_Sigma_0.0 Bg_Cascade_Sigma_0.1 Bg_Cascade_Sigma_0.2 Bg_Cascade_Sigma_0.3 Bg_Cascade_Sigma_0.4 Bg_Cascade_Sigma_0.5 Bg_Cascade_Sigma_0.6 Bg_Cascade_Sigma_0.7 Bg_Cascade_Sigma_0.8 Bg_Cascade_Sigma_0.9 Bg_Cascade_Sigma_1.0
./gnuplotParamBg.pl Data/Bg_Cascade_Sigma.txt "{/Symbol s}" 0 | gnuplot
mv allplots.ps Data/Bg_Cascade_Sigma.ps
./gnuplot.pl  Bg_Cascade_Sigma_0.0 Bg_Cascade_Sigma_0.1 Bg_Cascade_Sigma_0.2 Bg_Cascade_Sigma_0.3 Bg_Cascade_Sigma_0.4 Bg_Cascade_Sigma_0.5 Bg_Cascade_Sigma_0.6 Bg_Cascade_Sigma_0.7 Bg_Cascade_Sigma_0.8 Bg_Cascade_Sigma_0.9 Bg_Cascade_Sigma_1.0 | gnuplot
ps2pdf allplots.ps Data/Bg_Cascade_Sigma.pdf

#cache Size
# rm -f Bg_Cascade_Cache_Size.txt
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 100  -name "Bg_Cascade_Cache_Size_100" -cachesize 100 100 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 400  -name "Bg_Cascade_Cache_Size_400" -cachesize 400 400 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 500  -name "Bg_Cascade_Cache_Size_500" -cachesize 500 500 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 750  -name "Bg_Cascade_Cache_Size_750" -cachesize 750 750 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 1000  -name "Bg_Cascade_Cache_Size_1000" -cachesize 1000 1000 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 2000  -name "Bg_Cascade_Cache_Size_2000" -cachesize 2000 2000 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 3000  -name "Bg_Cascade_Cache_Size_3000" -cachesize 3000 3000 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 4000  -name "Bg_Cascade_Cache_Size_4000" -cachesize 4000 4000 -cc 20
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 5000  -name "Bg_Cascade_Cache_Size_5000" -cachesize 5000 5000 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 6000  -name "Bg_Cascade_Cache_Size_6000" -cachesize 6000 6000 -cc 20
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 7000  -name "Bg_Cascade_Cache_Size_7000" -cachesize 7000 7000 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 8000  -name "Bg_Cascade_Cache_Size_8000" -cachesize 8000 8000 -cc 20
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 9000  -name "Bg_Cascade_Cache_Size_9000" -cachesize 9000 9000 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 10000  -name "Bg_Cascade_Cache_Size_10000" -cachesize 10000 10000 -cc 20

./BenchBgAgents.pl 1000 Data/Bg_Cascade_Cache_Size.txt Bg_Cascade_Cache_Size_100 Bg_Cascade_Cache_Size_400 Bg_Cascade_Cache_Size_500 Bg_Cascade_Cache_Size_750 Bg_Cascade_Cache_Size_1000 Bg_Cascade_Cache_Size_2000 Bg_Cascade_Cache_Size_3000 Bg_Cascade_Cache_Size_4000 Bg_Cascade_Cache_Size_6000 Bg_Cascade_Cache_Size_8000 Bg_Cascade_Cache_Size_10000
./gnuplotParamBg.pl Data/Bg_Cascade_Cache_Size.txt "Cache Size" 0 | gnuplot
mv allplots.ps Data/Bg_Cascade_Cache_Size.ps
./gnuplot.pl Bg_Cascade_Cache_Size_100 Bg_Cascade_Cache_Size_400 Bg_Cascade_Cache_Size_500 Bg_Cascade_Cache_Size_750 Bg_Cascade_Cache_Size_1000 Bg_Cascade_Cache_Size_2000 Bg_Cascade_Cache_Size_3000 Bg_Cascade_Cache_Size_4000 Bg_Cascade_Cache_Size_6000 Bg_Cascade_Cache_Size_8000 Bg_Cascade_Cache_Size_10000 | gnuplot
ps2pdf allplots.ps Data/Bg_Cascade_Cache_Size.pdf

#candidate cache Size
# # rm -f Bg_Cascade_Cache_Size.txt
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 500  -name "Bg_Cascade_Cache_Max_500" -cachesize 500 500 -cc 20
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 750  -name "Bg_Cascade_Cache_Max_750" -cachesize 750 750 -cc 20
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 1000  -name "Bg_Cascade_Cache_Max_1000" -cachesize 1000 1000 -cc 20
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 2000  -name "Bg_Cascade_Cache_Max_2000" -cachesize 2000 2000 -cc 20
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 4000  -name "Bg_Cascade_Cache_Max_4000" -cachesize 4000 4000 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 5000  -name "Bg_Cascade_Cache_Max_5000" -cachesize 4000 5000 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 7500  -name "Bg_Cascade_Cache_Max_7500" -cachesize 4000 7500 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 10000  -name "Bg_Cascade_Cache_Max_10000" -cachesize 4000 10000 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 20000  -name "Bg_Cascade_Cache_Max_20000" -cachesize 4000 20000 -cc 20

# 
./BenchBgAgents.pl 1000 Data/Bg_Cascade_Cache_Max.txt Bg_Cascade_Cache_Max_5000 Bg_Cascade_Cache_Max_7500 Bg_Cascade_Cache_Max_10000 
./gnuplotParamBg.pl Data/Bg_Cascade_Cache_Max.txt "Candidate Cache Size" 0 | gnuplot
mv allplots.ps Data/Bg_Cascade_Cache_Max.ps
./gnuplot.pl Bg_Cascade_Cache_Max_5000 Bg_Cascade_Cache_Max_7500 Bg_Cascade_Cache_Max_10000 | gnuplot
ps2pdf allplots.ps Data/Bg_Cascade_Cache_Max.pdf

#cache commit
#./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 1  -name "Bg_Cascade_Cache_Commit_1" -cachesize 4000 4000 -cc 1
#./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 5  -name "Bg_Cascade_Cache_Commit_5" -cachesize 4000 4000 -cc 5
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 10  -name "Bg_Cascade_Cache_Commit_10" -cachesize 4000 4000 -cc 10
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 20  -name "Bg_Cascade_Cache_Commit_20" -cachesize 4000 4000 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 30  -name "Bg_Cascade_Cache_Commit_30" -cachesize 4000 4000 -cc 30
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 40  -name "Bg_Cascade_Cache_Commit_40" -cachesize 4000 4000 -cc 40
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 50  -name "Bg_Cascade_Cache_Commit_50" -cachesize 4000 4000 -cc 50
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 60  -name "Bg_Cascade_Cache_Commit_60" -cachesize 4000 4000 -cc 60
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 70  -name "Bg_Cascade_Cache_Commit_70" -cachesize 4000 4000 -cc 70
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 80  -name "Bg_Cascade_Cache_Commit_80" -cachesize 4000 4000 -cc 80

./BenchBgAgents.pl 1000 Data/Bg_Cascade_Cache_Commit.txt Bg_Cascade_Cache_Commit_10 Bg_Cascade_Cache_Commit_20 Bg_Cascade_Cache_Commit_30 Bg_Cascade_Cache_Commit_40 Bg_Cascade_Cache_Commit_50 Bg_Cascade_Cache_Commit_60 Bg_Cascade_Cache_Commit_70 Bg_Cascade_Cache_Commit_80
./gnuplotParamBg.pl Data/Bg_Cascade_Cache_Commit.txt "Cache Commit" 0 | gnuplot
mv allplots.ps Data/Bg_Cascade_Cache_Commit.ps
./gnuplot.pl Bg_Cascade_Cache_Commit_10 Bg_Cascade_Cache_Commit_20 Bg_Cascade_Cache_Commit_30 Bg_Cascade_Cache_Commit_40 Bg_Cascade_Cache_Commit_50 Bg_Cascade_Cache_Commit_60 Bg_Cascade_Cache_Commit_70 Bg_Cascade_Cache_Commit_80 | gnuplot
ps2pdf allplots.ps Data/Bg_Cascade_Cache_Commit.pdf

#whole-ann
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.0 -name "Bg_Cascade_WholeANN_0"
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300 -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 1.0 -whole-ann -name "Bg_Cascade_WholeANN_1"

./BenchBgAgents.pl 1000 Data/Bg_Cascade_WholeANN.txt Bg_Cascade_WholeANN_0 Bg_Cascade_WholeANN_1
./gnuplotParamBg.pl Data/Bg_Cascade_WholeANN.txt "Whole ANN" 0 | gnuplot
mv allplots.ps Data/Bg_Cascade_WholeANN.ps
./gnuplot.pl Bg_Cascade_WholeANN_0 Bg_Cascade_WholeANN_1 | gnuplot
ps2pdf allplots.ps Data/Bg_Cascade_WholeANN.pdf

#tabu
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 10 -tabu 0 -name "Bg_Cascade_Tabu_0"
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 10 -tabu 10 -name "Bg_Cascade_Tabu_10"
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 100 -tabu 100 -name "Bg_Cascade_Tabu_100"
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 1000 -tabu 1000 -name "Bg_Cascade_Tabu_1000"

./BenchBgAgents.pl 1000 Data/Bg_Cascade_Tabu.txt Bg_Cascade_Tabu_0 Bg_Cascade_Tabu_10 Bg_Cascade_Tabu_100 Bg_Cascade_Tabu_1000
./gnuplotParamBg.pl Data/Bg_Cascade_Tabu.txt "Tabu" 0 | gnuplot
mv allplots.ps Data/Bg_Cascade_Tabu.ps
./gnuplot.pl Bg_Cascade_Default Bg_Cascade_Tabu_10 Bg_Cascade_Tabu_100 Bg_Cascade_Tabu_1000 | gnuplot
ps2pdf allplots.ps Data/Bg_Cascade_Tabu.pdf

#rehearsing
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 0.0  -name "Bg_Cascade_Default"
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300  -whole-ann -cachesize 4000 4000 -cc 20 -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 1.0 -rehearse -name "Bg_Cascade_Rehearsing_1"

./BenchBgAgents.pl 1000 Data/Bg_Cascade_Rehearsing.txt Bg_Cascade_Default Bg_Cascade_Rehearsing_1
./gnuplotParamBg.pl Data/Bg_Cascade_Rehearsing.txt "Rehearsing" 0 | gnuplot
mv allplots.ps Data/Bg_Cascade_Rehearsing.ps
./gnuplot.pl Bg_Cascade_Default Bg_Cascade_Rehearsing_1 | gnuplot
ps2pdf allplots.ps Data/Bg_Cascade_Rehearsing.pdf


#cache size with no whole-ann
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300   -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 100  -name "Bg_Cascade_Cache_Size_NoWhole_100" -cachesize 100 100 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300   -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 400  -name "Bg_Cascade_Cache_Size_NoWhole_400" -cachesize 400 400 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300   -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 500  -name "Bg_Cascade_Cache_Size_NoWhole_500" -cachesize 500 500 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300   -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 750  -name "Bg_Cascade_Cache_Size_NoWhole_750" -cachesize 750 750 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300   -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 1000  -name "Bg_Cascade_Cache_Size_NoWhole_1000" -cachesize 1000 1000 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300   -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 2000  -name "Bg_Cascade_Cache_Size_NoWhole_2000" -cachesize 2000 2000 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300   -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 3000  -name "Bg_Cascade_Cache_Size_NoWhole_3000" -cachesize 3000 3000 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300   -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 4000  -name "Bg_Cascade_Cache_Size_NoWhole_4000" -cachesize 4000 4000 -cc 20
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300   -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 5000  -name "Bg_Cascade_Cache_Size_NoWhole_5000" -cachesize 5000 5000 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300   -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 6000  -name "Bg_Cascade_Cache_Size_NoWhole_6000" -cachesize 6000 6000 -cc 20
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300   -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 7000  -name "Bg_Cascade_Cache_Size_NoWhole_7000" -cachesize 7000 7000 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300   -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 8000  -name "Bg_Cascade_Cache_Size_NoWhole_8000" -cachesize 8000 8000 -cc 20
# ./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300   -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 9000  -name "Bg_Cascade_Cache_Size_NoWhole_9000" -cachesize 9000 9000 -cc 20
./runbgcompetitive.sh -q -te 10000 -select 1 -timeout 300   -s 1.0 -g 1.0 -l 0.3 -a 0.7 -e 0.01 -fa cascade -fann-layers 2 196 1 -bv 10000  -name "Bg_Cascade_Cache_Size_NoWhole_10000" -cachesize 10000 10000 -cc 20

./BenchBgAgents.pl 1000 Data/Bg_Cascade_Cache_Size_NoWhole.txt Bg_Cascade_Cache_Size_NoWhole_100 Bg_Cascade_Cache_Size_NoWhole_400 Bg_Cascade_Cache_Size_NoWhole_500 Bg_Cascade_Cache_Size_NoWhole_750 Bg_Cascade_Cache_Size_NoWhole_1000 Bg_Cascade_Cache_Size_NoWhole_2000 Bg_Cascade_Cache_Size_NoWhole_3000 Bg_Cascade_Cache_Size_NoWhole_4000 Bg_Cascade_Cache_Size_NoWhole_6000 Bg_Cascade_Cache_Size_NoWhole_8000 Bg_Cascade_Cache_Size_NoWhole_10000
./gnuplotParamBg.pl Data/Bg_Cascade_Cache_Size_NoWhole.txt "Cache Size (No Whole ANN)" 0 | gnuplot
mv allplots.ps Data/Bg_Cascade_Cache_Size_NoWhole.ps
./gnuplot.pl Bg_Cascade_Cache_Size_NoWhole_100 Bg_Cascade_Cache_Size_NoWhole_400 Bg_Cascade_Cache_Size_NoWhole_500 Bg_Cascade_Cache_Size_NoWhole_750 Bg_Cascade_Cache_Size_NoWhole_1000 Bg_Cascade_Cache_Size_NoWhole_2000 Bg_Cascade_Cache_Size_NoWhole_3000 Bg_Cascade_Cache_Size_NoWhole_4000 Bg_Cascade_Cache_Size_NoWhole_6000 Bg_Cascade_Cache_Size_NoWhole_8000 Bg_Cascade_Cache_Size_NoWhole_10000 | gnuplot
cp allplots.ps Data/Bg_Cascade_Cache_Size_NoWhole_Candidates.ps
ps2pdf allplots.ps Data/Bg_Cascade_Cache_Size_NoWhole.pdf


