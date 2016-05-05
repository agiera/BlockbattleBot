#!/bin/sh

#Default (for this test)
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/test.txt" -name "Car_Batch_Default"

# #Alpha
# rm -f benchmarkdata/Car_Batch_Alpha.txt
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -l 0.9 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.0001 -bf "benchmarkdata/Car_Batch_Alpha.txt" -name "Car_Batch_Alpha_0.0001" -a 0.0001
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -l 0.9 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.001 -bf "benchmarkdata/Car_Batch_Alpha.txt" -name "Car_Batch_Alpha_0.001" -a 0.001
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -l 0.9 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.01 -bf "benchmarkdata/Car_Batch_Alpha.txt" -name "Car_Batch_Alpha_0.01" -a 0.01
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -l 0.9 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Car_Batch_Alpha.txt" -name "Car_Batch_Alpha_0.1" -a 0.1
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -l 0.9 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Car_Batch_Alpha.txt" -name "Car_Batch_Alpha_0.2" -a 0.2
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -l 0.9 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Car_Batch_Alpha.txt" -name "Car_Batch_Alpha_0.5" -a 0.5
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -l 0.9 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Car_Batch_Alpha.txt" -name "Car_Batch_Alpha_0.7" -a 0.7
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -l 0.9 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Car_Batch_Alpha.txt" -name "Car_Batch_Alpha_0.9" -a 0.9
# 
./gnuplot.pl  Car_Batch_Alpha_0.0001 Car_Batch_Alpha_0.001 Car_Batch_Alpha_0.1 Car_Batch_Alpha_0.2 Car_Batch_Alpha_0.5 Car_Batch_Alpha_0.7  Car_Batch_Alpha_0.9 | gnuplot
ps2pdf allplots.ps benchmarkdata/Car_Batch_Alpha.pdf
./gnuplotParam.pl benchmarkdata/Car_Batch_Alpha.txt "Mountain Car" "{/Symbol a}" 1 | gnuplot
mv allplots.ps benchmarkdata/Car_Batch_Alpha.ps
# 
# #Epsilon
# rm -f benchmarkdata/Car_Batch_Epsilon.txt
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -l 0.9 -a 0.1 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Car_Batch_Epsilon.txt" -name "Car_Batch_Epsilon_0.0" -e 0.0
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -l 0.9 -a 0.1 -fa batch -fann-layers 3 5 20 1 -bv 0.001 -bf "benchmarkdata/Car_Batch_Epsilon.txt" -name "Car_Batch_Epsilon_0.001" -e 0.001
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -l 0.9 -a 0.1 -fa batch -fann-layers 3 5 20 1 -bv 0.01 -bf "benchmarkdata/Car_Batch_Epsilon.txt" -name "Car_Batch_Epsilon_0.01" -e 0.01
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -l 0.9 -a 0.1 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Car_Batch_Epsilon.txt" -name "Car_Batch_Epsilon_0.1" -e 0.1
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -l 0.9 -a 0.1 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Car_Batch_Epsilon.txt" -name "Car_Batch_Epsilon_0.2" -e 0.2
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -l 0.9 -a 0.1 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Car_Batch_Epsilon.txt" -name "Car_Batch_Epsilon_0.5" -e 0.5
# 
./gnuplot.pl Car_Batch_Epsilon_0.0 Car_Batch_Epsilon_0.001 Car_Batch_Epsilon_0.01 Car_Batch_Epsilon_0.1 Car_Batch_Epsilon_0.2 Car_Batch_Epsilon_0.5 | gnuplot
ps2pdf allplots.ps benchmarkdata/Car_Batch_Epsilon.pdf
./gnuplotParam.pl benchmarkdata/Car_Batch_Epsilon.txt "Mountain Car" "{/Symbol e}" 1 | gnuplot
mv allplots.ps benchmarkdata/Car_Batch_Epsilon.ps

# #Lambda
# rm -f benchmarkdata/Car_Batch_Lambda.txt
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Car_Batch_Lambda.txt" -name "Car_Batch_Lambda_0.0" -l 0.0
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Car_Batch_Lambda.txt" -name "Car_Batch_Lambda_0.1" -l 0.1
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Car_Batch_Lambda.txt" -name "Car_Batch_Lambda_0.2" -l 0.2
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Car_Batch_Lambda.txt" -name "Car_Batch_Lambda_0.3" -l 0.3
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Car_Batch_Lambda.txt" -name "Car_Batch_Lambda_0.4" -l 0.4
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Car_Batch_Lambda.txt" -name "Car_Batch_Lambda_0.5" -l 0.5
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Car_Batch_Lambda.txt" -name "Car_Batch_Lambda_0.6" -l 0.6
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Car_Batch_Lambda.txt" -name "Car_Batch_Lambda_0.7" -l 0.7
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Car_Batch_Lambda.txt" -name "Car_Batch_Lambda_0.8" -l 0.8
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -g 0.5 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Car_Batch_Lambda.txt" -name "Car_Batch_Lambda_0.9" -l 0.9

./gnuplot.pl  Car_Batch_Lambda_0.0 Car_Batch_Lambda_0.1 Car_Batch_Lambda_0.2 Car_Batch_Lambda_0.3 Car_Batch_Lambda_0.4 Car_Batch_Lambda_0.5 Car_Batch_Lambda_0.6 Car_Batch_Lambda_0.7 Car_Batch_Lambda_0.8 Car_Batch_Lambda_0.9 | gnuplot
ps2pdf allplots.ps benchmarkdata/Car_Batch_Lambda.pdf
./gnuplotParam.pl benchmarkdata/Car_Batch_Lambda.txt "Mountain Car" "{/Symbol l}" 0 | gnuplot
mv allplots.ps benchmarkdata/Car_Batch_Lambda.ps

#Gamma
# rm -f benchmarkdata/Car_Batch_Gamma.txt
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Car_Batch_Gamma.txt" -name "Car_Batch_Gamma_0.0" -g 0.0
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Car_Batch_Gamma.txt" -name "Car_Batch_Gamma_0.1" -g 0.1
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Car_Batch_Gamma.txt" -name "Car_Batch_Gamma_0.2" -g 0.2
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Car_Batch_Gamma.txt" -name "Car_Batch_Gamma_0.3" -g 0.3
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Car_Batch_Gamma.txt" -name "Car_Batch_Gamma_0.4" -g 0.4
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Car_Batch_Gamma.txt" -name "Car_Batch_Gamma_0.5" -g 0.5
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Car_Batch_Gamma.txt" -name "Car_Batch_Gamma_0.6" -g 0.6
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Car_Batch_Gamma.txt" -name "Car_Batch_Gamma_0.7" -g 0.7
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Car_Batch_Gamma.txt" -name "Car_Batch_Gamma_0.8" -g 0.8
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Car_Batch_Gamma.txt" -name "Car_Batch_Gamma_0.9" -g 0.9
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 0.3 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 1.0 -bf "benchmarkdata/Car_Batch_Gamma.txt" -name "Car_Batch_Gamma_1.0" -g 1.0

./gnuplot.pl  Car_Batch_Gamma_0.0 Car_Batch_Gamma_0.1 Car_Batch_Gamma_0.2 Car_Batch_Gamma_0.3 Car_Batch_Gamma_0.4 Car_Batch_Gamma_0.5 Car_Batch_Gamma_0.6 Car_Batch_Gamma_0.7 Car_Batch_Gamma_0.8 Car_Batch_Gamma_0.9 Car_Batch_Gamma_1.0 | gnuplot
ps2pdf allplots.ps benchmarkdata/Car_Batch_Gamma.pdf
./gnuplotParam.pl benchmarkdata/Car_Batch_Gamma.txt "Mountain Car" "{/Symbol g}" 0 | gnuplot
mv allplots.ps benchmarkdata/Car_Batch_Gamma.ps

#Sigma
# rm -f benchmarkdata/Car_Batch_Sigma.txt
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Car_Batch_Sigma.txt" -name "Car_Batch_Sigma_0.0" -s 0.0
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Car_Batch_Sigma.txt" -name "Car_Batch_Sigma_0.1" -s 0.1
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Car_Batch_Sigma.txt" -name "Car_Batch_Sigma_0.2" -s 0.2
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Car_Batch_Sigma.txt" -name "Car_Batch_Sigma_0.3" -s 0.3
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Car_Batch_Sigma.txt" -name "Car_Batch_Sigma_0.4" -s 0.4
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Car_Batch_Sigma.txt" -name "Car_Batch_Sigma_0.5" -s 0.5
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Car_Batch_Sigma.txt" -name "Car_Batch_Sigma_0.6" -s 0.6
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Car_Batch_Sigma.txt" -name "Car_Batch_Sigma_0.7" -s 0.7
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Car_Batch_Sigma.txt" -name "Car_Batch_Sigma_0.8" -s 0.8
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Car_Batch_Sigma.txt" -name "Car_Batch_Sigma_0.9" -s 0.9
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 1.0 -bf "benchmarkdata/Car_Batch_Sigma.txt" -name "Car_Batch_Sigma_1.0" -s 1.0

./gnuplot.pl  Car_Batch_Sigma_0.0 Car_Batch_Sigma_0.1 Car_Batch_Sigma_0.2 Car_Batch_Sigma_0.3 Car_Batch_Sigma_0.4 Car_Batch_Sigma_0.5 Car_Batch_Sigma_0.6 Car_Batch_Sigma_0.7 Car_Batch_Sigma_0.8 Car_Batch_Sigma_0.9 Car_Batch_Sigma_1.0 | gnuplot
ps2pdf allplots.ps benchmarkdata/Car_Batch_Sigma.pdf
./gnuplotParam.pl benchmarkdata/Car_Batch_Sigma.txt "Mountain Car" "{/Symbol s}" 0 | gnuplot
mv allplots.ps benchmarkdata/Car_Batch_Sigma.ps

#cache & cache commit
# rm -f benchmarkdata/Car_Batch_Cache.txt
./car -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.3 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0 -bf "benchmarkdata/Car_Batch_Cache.txt" -name "Car_Batch_Cache_500_CC_5" -cachesize 500 500 -cc 5
./car -bv 1 -bf "benchmarkdata/Car_Batch_Cache.txt" -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.3 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -name "Car_Batch_Cache_1000_CC_5" -cachesize 1000 1000 -cc 5
./car -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.3 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 2 -bf "benchmarkdata/Car_Batch_Cache.txt" -name "Car_Batch_Cache_2000_CC_5" -cachesize 2000 2000 -cc 5

./car -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.3 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 3 -bf "benchmarkdata/Car_Batch_Cache.txt" -name "Car_Batch_Cache_500_CC_10" -cachesize 500 500 -cc 10
./car -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.3 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 4 -bf "benchmarkdata/Car_Batch_Cache.txt" -name "Car_Batch_Cache_1000_CC_10" -cachesize 1000 1000 -cc 10
./car -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.3 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 5 -bf "benchmarkdata/Car_Batch_Cache.txt" -name "Car_Batch_Cache_2000_CC_10" -cachesize 2000 2000 -cc 10

./car -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.3 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 6 -bf "benchmarkdata/Car_Batch_Cache.txt" -name "Car_Batch_Cache_500_CC_100" -cachesize 500 500 -cc 100
./car -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.3 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 7 -bf "benchmarkdata/Car_Batch_Cache.txt" -name "Car_Batch_Cache_1000_CC_100" -cachesize 1000 1000 -cc 100
./car -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.3 -g 0.5 -l 0.9 -a 0.1 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 8 -bf "benchmarkdata/Car_Batch_Cache.txt" -name "Car_Batch_Cache_2000_CC_100" -cachesize 2000 2000 -cc 100

./gnuplot.pl Car_Batch_Cache_500_CC_5 Car_Batch_Cache_1000_CC_5 Car_Batch_Cache_2000_CC_5 Car_Batch_Cache_500_CC_10 Car_Batch_Cache_1000_CC_10 Car_Batch_Cache_2000_CC_10 Car_Batch_Cache_500_CC_100 Car_Batch_Cache_1000_CC_100 Car_Batch_Cache_2000_CC_100 | gnuplot
ps2pdf allplots.ps benchmarkdata/Car_Batch_Cache.pdf
./gnuplotParam.pl benchmarkdata/Car_Batch_Cache.txt "Mountain Car" "Cache" 0 | gnuplot
mv allplots.ps benchmarkdata/Car_Batch_Cache.ps

