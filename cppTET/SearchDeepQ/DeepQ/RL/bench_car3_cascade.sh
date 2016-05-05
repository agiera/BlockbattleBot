#!/bin/sh

#Default (for this test)
#./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -l 0.6 -a 0.2 -e 0.01 -fa cascade -fann-layers 2 3 1 -bv 0.0 -bf "Data/test.txt" -name "Car3_Cascade_Default"

./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.0 -bf "Data/test.txt" -name "Car3_Cascade_Default"

# #Alpha
# rm -f Data/Car3_Cascade_Alpha.txt
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -l 0.6 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.0001 -bf "Data/Car3_Cascade_Alpha.txt" -name "Car3_Cascade_Alpha_0.0001" -a 0.0001
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -l 0.6 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.001 -bf "Data/Car3_Cascade_Alpha.txt" -name "Car3_Cascade_Alpha_0.001" -a 0.001
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -l 0.6 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.01 -bf "Data/Car3_Cascade_Alpha.txt" -name "Car3_Cascade_Alpha_0.01" -a 0.01
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -l 0.6 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.1 -bf "Data/Car3_Cascade_Alpha.txt" -name "Car3_Cascade_Alpha_0.1" -a 0.1
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -l 0.6 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.2 -bf "Data/Car3_Cascade_Alpha.txt" -name "Car3_Cascade_Alpha_0.2" -a 0.2
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -l 0.6 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.5 -bf "Data/Car3_Cascade_Alpha.txt" -name "Car3_Cascade_Alpha_0.5" -a 0.5
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -l 0.6 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.7 -bf "Data/Car3_Cascade_Alpha.txt" -name "Car3_Cascade_Alpha_0.7" -a 0.7
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -l 0.6 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.9 -bf "Data/Car3_Cascade_Alpha.txt" -name "Car3_Cascade_Alpha_0.9" -a 0.9
# 
./gnuplot.pl  Car3_Cascade_Alpha_0.0001 Car3_Cascade_Alpha_0.001 Car3_Cascade_Alpha_0.1 Car3_Cascade_Alpha_0.2 Car3_Cascade_Alpha_0.5 Car3_Cascade_Alpha_0.7  Car3_Cascade_Alpha_0.9 | gnuplot
ps2pdf allplots.ps Data/Car3_Cascade_Alpha.pdf
./gnuplotParam.pl Data/Car3_Cascade_Alpha.txt "Mountain Car (action as one input)" "{/Symbol a}" 1 | gnuplot
mv allplots.ps Data/Car3_Cascade_Alpha.ps
# 
#Epsilon
# rm -f Data/Car3_Cascade_Epsilon.txt
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -l 0.6 -a 0.5 -fa cascade -fann-layers 2 3 1 -bv 0.0 -bf "Data/Car3_Cascade_Epsilon.txt" -name "Car3_Cascade_Epsilon_0.0" -e 0.0
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -l 0.6 -a 0.5 -fa cascade -fann-layers 2 3 1 -bv 0.001 -bf "Data/Car3_Cascade_Epsilon.txt" -name "Car3_Cascade_Epsilon_0.001" -e 0.001
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -l 0.6 -a 0.5 -fa cascade -fann-layers 2 3 1 -bv 0.01 -bf "Data/Car3_Cascade_Epsilon.txt" -name "Car3_Cascade_Epsilon_0.01" -e 0.01
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -l 0.6 -a 0.5 -fa cascade -fann-layers 2 3 1 -bv 0.1 -bf "Data/Car3_Cascade_Epsilon.txt" -name "Car3_Cascade_Epsilon_0.1" -e 0.1
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -l 0.6 -a 0.5 -fa cascade -fann-layers 2 3 1 -bv 0.2 -bf "Data/Car3_Cascade_Epsilon.txt" -name "Car3_Cascade_Epsilon_0.2" -e 0.2
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -l 0.6 -a 0.5 -fa cascade -fann-layers 2 3 1 -bv 0.5 -bf "Data/Car3_Cascade_Epsilon.txt" -name "Car3_Cascade_Epsilon_0.5" -e 0.5
# # 
./gnuplot.pl Car3_Cascade_Epsilon_0.0 Car3_Cascade_Epsilon_0.001 Car3_Cascade_Epsilon_0.01 Car3_Cascade_Epsilon_0.1 Car3_Cascade_Epsilon_0.2 Car3_Cascade_Epsilon_0.5 | gnuplot
ps2pdf allplots.ps Data/Car3_Cascade_Epsilon.pdf
./gnuplotParam.pl Data/Car3_Cascade_Epsilon.txt "Mountain Car3" "{/Symbol e}" 1 | gnuplot
mv allplots.ps Data/Car3_Cascade_Epsilon.ps


# #Lambda
# rm -f Data/Car3_Cascade_Lambda.txt
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.0 -bf "Data/Car3_Cascade_Lambda.txt" -name "Car3_Cascade_Lambda_0.0" -l 0.0
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.1 -bf "Data/Car3_Cascade_Lambda.txt" -name "Car3_Cascade_Lambda_0.1" -l 0.1
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.2 -bf "Data/Car3_Cascade_Lambda.txt" -name "Car3_Cascade_Lambda_0.2" -l 0.2
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.3 -bf "Data/Car3_Cascade_Lambda.txt" -name "Car3_Cascade_Lambda_0.3" -l 0.3
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.4 -bf "Data/Car3_Cascade_Lambda.txt" -name "Car3_Cascade_Lambda_0.4" -l 0.4
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.5 -bf "Data/Car3_Cascade_Lambda.txt" -name "Car3_Cascade_Lambda_0.5" -l 0.5
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.6 -bf "Data/Car3_Cascade_Lambda.txt" -name "Car3_Cascade_Lambda_0.6" -l 0.6
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.7 -bf "Data/Car3_Cascade_Lambda.txt" -name "Car3_Cascade_Lambda_0.7" -l 0.7
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.8 -bf "Data/Car3_Cascade_Lambda.txt" -name "Car3_Cascade_Lambda_0.8" -l 0.8
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -g 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.9 -bf "Data/Car3_Cascade_Lambda.txt" -name "Car3_Cascade_Lambda_0.9" -l 0.9

./gnuplot.pl  Car3_Cascade_Lambda_0.0 Car3_Cascade_Lambda_0.1 Car3_Cascade_Lambda_0.2 Car3_Cascade_Lambda_0.3 Car3_Cascade_Lambda_0.4 Car3_Cascade_Lambda_0.5 Car3_Cascade_Lambda_0.6 Car3_Cascade_Lambda_0.7 Car3_Cascade_Lambda_0.8 Car3_Cascade_Lambda_0.9 | gnuplot
ps2pdf allplots.ps Data/Car3_Cascade_Lambda.pdf
./gnuplotParam.pl Data/Car3_Cascade_Lambda.txt "Mountain Car3" "{/Symbol l}" 0 | gnuplot
mv allplots.ps Data/Car3_Cascade_Lambda.ps

#Gamma
# rm -f Data/Car3_Cascade_Gamma.txt
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.0 -bf "Data/Car3_Cascade_Gamma.txt" -name "Car3_Cascade_Gamma_0.0" -g 0.0
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.1 -bf "Data/Car3_Cascade_Gamma.txt" -name "Car3_Cascade_Gamma_0.1" -g 0.1
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.2 -bf "Data/Car3_Cascade_Gamma.txt" -name "Car3_Cascade_Gamma_0.2" -g 0.2
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.3 -bf "Data/Car3_Cascade_Gamma.txt" -name "Car3_Cascade_Gamma_0.3" -g 0.3
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.4 -bf "Data/Car3_Cascade_Gamma.txt" -name "Car3_Cascade_Gamma_0.4" -g 0.4
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.5 -bf "Data/Car3_Cascade_Gamma.txt" -name "Car3_Cascade_Gamma_0.5" -g 0.5
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.6 -bf "Data/Car3_Cascade_Gamma.txt" -name "Car3_Cascade_Gamma_0.6" -g 0.6
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.7 -bf "Data/Car3_Cascade_Gamma.txt" -name "Car3_Cascade_Gamma_0.7" -g 0.7
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.8 -bf "Data/Car3_Cascade_Gamma.txt" -name "Car3_Cascade_Gamma_0.8" -g 0.8
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.9 -bf "Data/Car3_Cascade_Gamma.txt" -name "Car3_Cascade_Gamma_0.9" -g 0.9
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -s 0.4 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 1.0 -bf "Data/Car3_Cascade_Gamma.txt" -name "Car3_Cascade_Gamma_1.0" -g 1.0

./gnuplot.pl  Car3_Cascade_Gamma_0.0 Car3_Cascade_Gamma_0.1 Car3_Cascade_Gamma_0.2 Car3_Cascade_Gamma_0.3 Car3_Cascade_Gamma_0.4 Car3_Cascade_Gamma_0.5 Car3_Cascade_Gamma_0.6 Car3_Cascade_Gamma_0.7 Car3_Cascade_Gamma_0.8 Car3_Cascade_Gamma_0.9 Car3_Cascade_Gamma_1.0 | gnuplot
ps2pdf allplots.ps Data/Car3_Cascade_Gamma.pdf
./gnuplotParam.pl Data/Car3_Cascade_Gamma.txt "Mountain Car3" "{/Symbol g}" 0 | gnuplot
mv allplots.ps Data/Car3_Cascade_Gamma.ps

#Sigma
# rm -f Data/Car3_Cascade_Sigma.txt
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.0 -bf "Data/Car3_Cascade_Sigma.txt" -name "Car3_Cascade_Sigma_0.0" -s 0.0
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.1 -bf "Data/Car3_Cascade_Sigma.txt" -name "Car3_Cascade_Sigma_0.1" -s 0.1
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.2 -bf "Data/Car3_Cascade_Sigma.txt" -name "Car3_Cascade_Sigma_0.2" -s 0.2
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.3 -bf "Data/Car3_Cascade_Sigma.txt" -name "Car3_Cascade_Sigma_0.3" -s 0.3
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.4 -bf "Data/Car3_Cascade_Sigma.txt" -name "Car3_Cascade_Sigma_0.4" -s 0.4
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.5 -bf "Data/Car3_Cascade_Sigma.txt" -name "Car3_Cascade_Sigma_0.5" -s 0.5
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.6 -bf "Data/Car3_Cascade_Sigma.txt" -name "Car3_Cascade_Sigma_0.6" -s 0.6
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.7 -bf "Data/Car3_Cascade_Sigma.txt" -name "Car3_Cascade_Sigma_0.7" -s 0.7
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.8 -bf "Data/Car3_Cascade_Sigma.txt" -name "Car3_Cascade_Sigma_0.8" -s 0.8
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 0.9 -bf "Data/Car3_Cascade_Sigma.txt" -name "Car3_Cascade_Sigma_0.9" -s 0.9
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 20 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 1.0 -bf "Data/Car3_Cascade_Sigma.txt" -name "Car3_Cascade_Sigma_1.0" -s 1.0

./gnuplot.pl  Car3_Cascade_Sigma_0.0 Car3_Cascade_Sigma_0.1 Car3_Cascade_Sigma_0.2 Car3_Cascade_Sigma_0.3 Car3_Cascade_Sigma_0.4 Car3_Cascade_Sigma_0.5 Car3_Cascade_Sigma_0.6 Car3_Cascade_Sigma_0.7 Car3_Cascade_Sigma_0.8 Car3_Cascade_Sigma_0.9 Car3_Cascade_Sigma_1.0 | gnuplot
ps2pdf allplots.ps Data/Car3_Cascade_Sigma.pdf
./gnuplotParam.pl Data/Car3_Cascade_Sigma.txt "Mountain Car3" "{/Symbol s}" 0 | gnuplot
mv allplots.ps Data/Car3_Cascade_Sigma.ps

#cache
# rm -f Data/Car3_Cascade_Cache_Size.txt
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 100 -bf "Data/Car3_Cascade_Cache_Size.txt" -name "Car3_Cascade_Cache_Size_100" -cachesize 100 100 -cc 20
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 500 -bf "Data/Car3_Cascade_Cache_Size.txt" -name "Car3_Cascade_Cache_Size_500" -cachesize 500 500 -cc 20
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 750 -bf "Data/Car3_Cascade_Cache_Size.txt" -name "Car3_Cascade_Cache_Size_750" -cachesize 750 750 -cc 20
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 1000 -bf "Data/Car3_Cascade_Cache_Size.txt" -name "Car3_Cascade_Cache_Size_1000" -cachesize 1000 1000 -cc 20
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 2000 -bf "Data/Car3_Cascade_Cache_Size.txt" -name "Car3_Cascade_Cache_Size_2000" -cachesize 2000 2000 -cc 20

./gnuplot.pl Car3_Cascade_Cache_Size_100 Car3_Cascade_Cache_Size_500 Car3_Cascade_Cache_Size_750 Car3_Cascade_Cache_Size_1000 Car3_Cascade_Cache_Size_2000 | gnuplot
ps2pdf allplots.ps Data/Car3_Cascade_Cache_Size.pdf
./gnuplotParam.pl Data/Car3_Cascade_Cache_Size.txt "Mountain Car3" "Cache Size" 0 | gnuplot
mv allplots.ps Data/Car3_Cascade_Cache_Size.ps

#cache commit
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 1 -bf "Data/Car3_Cascade_Cache_Commit.txt" -name "Car3_Cascade_Cache_Commit_1" -cachesize 500 500 -cc 1
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 5 -bf "Data/Car3_Cascade_Cache_Commit.txt" -name "Car3_Cascade_Cache_Commit_5" -cachesize 500 500 -cc 5
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 10 -bf "Data/Car3_Cascade_Cache_Commit.txt" -name "Car3_Cascade_Cache_Commit_10" -cachesize 500 500 -cc 10
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 20 -bf "Data/Car3_Cascade_Cache_Commit.txt" -name "Car3_Cascade_Cache_Commit_20" -cachesize 500 500 -cc 20
./car3 -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.6 -l 0.6 -a 0.5 -e 0.2 -fa cascade -fann-layers 2 3 1 -bv 50 -bf "Data/Car3_Cascade_Cache_Commit.txt" -name "Car3_Cascade_Cache_Commit_50" -cachesize 500 500 -cc 50

./gnuplot.pl Car3_Cascade_Cache_Commit_1 Car3_Cascade_Cache_Commit_5 Car3_Cascade_Cache_Commit_10 Car3_Cascade_Cache_Commit_20 Car3_Cascade_Cache_Commit_50 | gnuplot
#./gnuplot.pl Car3_Cascade_Cache_Commit_10 Car3_Cascade_Cache_Commit_20 Car3_Cascade_Cache_Commit_50 | gnuplot
ps2pdf allplots.ps Data/Car3_Cascade_Cache_Commit.pdf
./gnuplotParam.pl Data/Car3_Cascade_Cache_Commit.txt "Mountain Car3" "Cache Commit" 0 | gnuplot
mv allplots.ps Data/Car3_Cascade_Cache_Commit.ps

