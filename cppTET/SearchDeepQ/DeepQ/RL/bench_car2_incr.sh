#!/bin/sh

#Default (for this test)
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.0 -bf "benchmarkdata/test.txt" -name "Car2_Incr_Default"

# #Alpha
rm -f benchmarkdata/Car2_Incr_Alpha.txt
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -l 0 -nocache -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.0001 -bf "benchmarkdata/Car2_Incr_Alpha.txt" -name "Car2_Incr_Alpha_0.0001" -a 0.0001
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -l 0 -nocache -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.001 -bf "benchmarkdata/Car2_Incr_Alpha.txt" -name "Car2_Incr_Alpha_0.001" -a 0.001
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -l 0 -nocache -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.01 -bf "benchmarkdata/Car2_Incr_Alpha.txt" -name "Car2_Incr_Alpha_0.01" -a 0.01
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -l 0 -nocache -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.1 -bf "benchmarkdata/Car2_Incr_Alpha.txt" -name "Car2_Incr_Alpha_0.1" -a 0.1
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -l 0 -nocache -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.2 -bf "benchmarkdata/Car2_Incr_Alpha.txt" -name "Car2_Incr_Alpha_0.2" -a 0.2
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -l 0 -nocache -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.5 -bf "benchmarkdata/Car2_Incr_Alpha.txt" -name "Car2_Incr_Alpha_0.5" -a 0.5
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -l 0 -nocache -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.7 -bf "benchmarkdata/Car2_Incr_Alpha.txt" -name "Car2_Incr_Alpha_0.7" -a 0.7
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -l 0 -nocache -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.9 -bf "benchmarkdata/Car2_Incr_Alpha.txt" -name "Car2_Incr_Alpha_0.9" -a 0.9
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -l 0 -nocache -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 1.0 -bf "benchmarkdata/Car2_Incr_Alpha.txt" -name "Car2_Incr_Alpha_1.0" -a 1.0
# 
# ./gnuplot.pl  Car2_Incr_Alpha_0.0001 Car2_Incr_Alpha_0.001 Car2_Incr_Alpha_0.1 Car2_Incr_Alpha_0.2 Car2_Incr_Alpha_0.5 Car2_Incr_Alpha_0.7  Car2_Incr_Alpha_0.9 | gnuplot
# ps2pdf allplots.ps benchmarkdata/Car2_Incr_Alpha.pdf
./gnuplotParam.pl benchmarkdata/Car2_Incr_Alpha.txt "Mountain Car2" "{/Symbol a}" 1 | gnuplot
mv allplots.ps benchmarkdata/Car2_Incr_Alpha.ps
 
#Epsilon
rm -f benchmarkdata/Car2_Incr_Epsilon.txt
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -l 0 -nocache -a 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.0 -bf "benchmarkdata/Car2_Incr_Epsilon.txt" -name "Car2_Incr_Epsilon_0.0" -e 0.0
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -l 0 -nocache -a 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.001 -bf "benchmarkdata/Car2_Incr_Epsilon.txt" -name "Car2_Incr_Epsilon_0.001" -e 0.001
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -l 0 -nocache -a 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.01 -bf "benchmarkdata/Car2_Incr_Epsilon.txt" -name "Car2_Incr_Epsilon_0.01" -e 0.01
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -l 0 -nocache -a 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.1 -bf "benchmarkdata/Car2_Incr_Epsilon.txt" -name "Car2_Incr_Epsilon_0.1" -e 0.1
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -l 0 -nocache -a 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.2 -bf "benchmarkdata/Car2_Incr_Epsilon.txt" -name "Car2_Incr_Epsilon_0.2" -e 0.2
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -l 0 -nocache -a 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.5 -bf "benchmarkdata/Car2_Incr_Epsilon.txt" -name "Car2_Incr_Epsilon_0.5" -e 0.5
# 
# ./gnuplot.pl Car2_Incr_Epsilon_0.0 Car2_Incr_Epsilon_0.001 Car2_Incr_Epsilon_0.01 Car2_Incr_Epsilon_0.1 Car2_Incr_Epsilon_0.2 Car2_Incr_Epsilon_0.5 | gnuplot
# ps2pdf allplots.ps benchmarkdata/Car2_Incr_Epsilon.pdf
./gnuplotParam.pl benchmarkdata/Car2_Incr_Epsilon.txt "Mountain Car2" "{/Symbol e}" 1 | gnuplot
mv allplots.ps benchmarkdata/Car2_Incr_Epsilon.ps

# #Lambda
# rm -f benchmarkdata/Car2_Incr_Lambda.txt
# ./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.0 -bf "benchmarkdata/Car2_Incr_Lambda.txt" -name "Car2_Incr_Lambda_0.0" -l 0.0
# ./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.1 -bf "benchmarkdata/Car2_Incr_Lambda.txt" -name "Car2_Incr_Lambda_0.1" -l 0.1
# ./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.2 -bf "benchmarkdata/Car2_Incr_Lambda.txt" -name "Car2_Incr_Lambda_0.2" -l 0.2
# ./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.3 -bf "benchmarkdata/Car2_Incr_Lambda.txt" -name "Car2_Incr_Lambda_0.3" -l 0.3
# ./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.4 -bf "benchmarkdata/Car2_Incr_Lambda.txt" -name "Car2_Incr_Lambda_0.4" -l 0.4
# ./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.5 -bf "benchmarkdata/Car2_Incr_Lambda.txt" -name "Car2_Incr_Lambda_0.5" -l 0.5
# ./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.6 -bf "benchmarkdata/Car2_Incr_Lambda.txt" -name "Car2_Incr_Lambda_0.6" -l 0.6
# ./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.7 -bf "benchmarkdata/Car2_Incr_Lambda.txt" -name "Car2_Incr_Lambda_0.7" -l 0.7
# ./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.8 -bf "benchmarkdata/Car2_Incr_Lambda.txt" -name "Car2_Incr_Lambda_0.8" -l 0.8
# ./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -g 1 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.9 -bf "benchmarkdata/Car2_Incr_Lambda.txt" -name "Car2_Incr_Lambda_0.9" -l 0.9

# ./gnuplot.pl  Car2_Incr_Lambda_0.0 Car2_Incr_Lambda_0.1 Car2_Incr_Lambda_0.2 Car2_Incr_Lambda_0.3 Car2_Incr_Lambda_0.4 Car2_Incr_Lambda_0.5 Car2_Incr_Lambda_0.6 Car2_Incr_Lambda_0.7 Car2_Incr_Lambda_0.8 Car2_Incr_Lambda_0.9 | gnuplot
# ps2pdf allplots.ps benchmarkdata/Car2_Incr_Lambda.pdf
# ./gnuplotParam.pl benchmarkdata/Car2_Incr_Lambda.txt "Mountain Car2" "{/Symbol l}" 0 | gnuplot
# mv allplots.ps benchmarkdata/Car2_Incr_Lambda.ps

#Gamma
rm -f benchmarkdata/Car2_Incr_Gamma.txt
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.0 -bf "benchmarkdata/Car2_Incr_Gamma.txt" -name "Car2_Incr_Gamma_0.0" -g 0.0
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.1 -bf "benchmarkdata/Car2_Incr_Gamma.txt" -name "Car2_Incr_Gamma_0.1" -g 0.1
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.2 -bf "benchmarkdata/Car2_Incr_Gamma.txt" -name "Car2_Incr_Gamma_0.2" -g 0.2
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.3 -bf "benchmarkdata/Car2_Incr_Gamma.txt" -name "Car2_Incr_Gamma_0.3" -g 0.3
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.4 -bf "benchmarkdata/Car2_Incr_Gamma.txt" -name "Car2_Incr_Gamma_0.4" -g 0.4
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.5 -bf "benchmarkdata/Car2_Incr_Gamma.txt" -name "Car2_Incr_Gamma_0.5" -g 0.5
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.6 -bf "benchmarkdata/Car2_Incr_Gamma.txt" -name "Car2_Incr_Gamma_0.6" -g 0.6
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.7 -bf "benchmarkdata/Car2_Incr_Gamma.txt" -name "Car2_Incr_Gamma_0.7" -g 0.7
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.8 -bf "benchmarkdata/Car2_Incr_Gamma.txt" -name "Car2_Incr_Gamma_0.8" -g 0.8
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.9 -bf "benchmarkdata/Car2_Incr_Gamma.txt" -name "Car2_Incr_Gamma_0.9" -g 0.9
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 1.0 -bf "benchmarkdata/Car2_Incr_Gamma.txt" -name "Car2_Incr_Gamma_1.0" -g 1.0

# ./gnuplot.pl  Car2_Incr_Gamma_0.0 Car2_Incr_Gamma_0.1 Car2_Incr_Gamma_0.2 Car2_Incr_Gamma_0.3 Car2_Incr_Gamma_0.4 Car2_Incr_Gamma_0.5 Car2_Incr_Gamma_0.6 Car2_Incr_Gamma_0.7 Car2_Incr_Gamma_0.8 Car2_Incr_Gamma_0.9 Car2_Incr_Gamma_1.0 | gnuplot
# ps2pdf allplots.ps benchmarkdata/Car2_Incr_Gamma.pdf
./gnuplotParam.pl benchmarkdata/Car2_Incr_Gamma.txt "Mountain Car2" "{/Symbol g}" 0 | gnuplot
mv allplots.ps benchmarkdata/Car2_Incr_Gamma.ps

#Sigma
rm -f benchmarkdata/Car2_Incr_Sigma.txt
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -g 1 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.0 -bf "benchmarkdata/Car2_Incr_Sigma.txt" -name "Car2_Incr_Sigma_0.0" -s 0.0
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -g 1 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.1 -bf "benchmarkdata/Car2_Incr_Sigma.txt" -name "Car2_Incr_Sigma_0.1" -s 0.1
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -g 1 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.2 -bf "benchmarkdata/Car2_Incr_Sigma.txt" -name "Car2_Incr_Sigma_0.2" -s 0.2
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -g 1 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.3 -bf "benchmarkdata/Car2_Incr_Sigma.txt" -name "Car2_Incr_Sigma_0.3" -s 0.3
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -g 1 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.4 -bf "benchmarkdata/Car2_Incr_Sigma.txt" -name "Car2_Incr_Sigma_0.4" -s 0.4
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -g 1 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.5 -bf "benchmarkdata/Car2_Incr_Sigma.txt" -name "Car2_Incr_Sigma_0.5" -s 0.5
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -g 1 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.6 -bf "benchmarkdata/Car2_Incr_Sigma.txt" -name "Car2_Incr_Sigma_0.6" -s 0.6
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -g 1 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.7 -bf "benchmarkdata/Car2_Incr_Sigma.txt" -name "Car2_Incr_Sigma_0.7" -s 0.7
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -g 1 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.8 -bf "benchmarkdata/Car2_Incr_Sigma.txt" -name "Car2_Incr_Sigma_0.8" -s 0.8
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -g 1 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 0.9 -bf "benchmarkdata/Car2_Incr_Sigma.txt" -name "Car2_Incr_Sigma_0.9" -s 0.9
./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -g 1 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -bv 1.0 -bf "benchmarkdata/Car2_Incr_Sigma.txt" -name "Car2_Incr_Sigma_1.0" -s 1.0

# ./gnuplot.pl  Car2_Incr_Sigma_0.0 Car2_Incr_Sigma_0.1 Car2_Incr_Sigma_0.2 Car2_Incr_Sigma_0.3 Car2_Incr_Sigma_0.4 Car2_Incr_Sigma_0.5 Car2_Incr_Sigma_0.6 Car2_Incr_Sigma_0.7 Car2_Incr_Sigma_0.8 Car2_Incr_Sigma_0.9 Car2_Incr_Sigma_1.0 | gnuplot
# ps2pdf allplots.ps benchmarkdata/Car2_Incr_Sigma.pdf
./gnuplotParam.pl benchmarkdata/Car2_Incr_Sigma.txt "Mountain Car2" "{/Symbol s}" 0 | gnuplot
mv allplots.ps benchmarkdata/Car2_Incr_Sigma.ps

#tabu
# ./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -g 1 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -name "Car2_Incr_Tabu_100" -tabu 100
# ./car2 -q -te 11000 -on 10000 -off 10000 -select 1 -g 1 -l 0 -nocache -a 0.2 -e 0.2 -fa fann -fann-layers 3 4 20 1 -name "Car2_Incr_Tabu_1000" -tabu 1000
