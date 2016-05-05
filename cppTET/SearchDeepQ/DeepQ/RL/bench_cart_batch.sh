#!/bin/sh

#Default (for this test)
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/test.txt" -name "Cart_Batch_Default"

# #Alpha
# rm -f benchmarkdata/Cart_Batch_Alpha.txt
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -l 0.9 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.0001 -bf "benchmarkdata/Cart_Batch_Alpha.txt" -name "Cart_Batch_Alpha_0.0001" -a 0.0001
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -l 0.9 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.001 -bf "benchmarkdata/Cart_Batch_Alpha.txt" -name "Cart_Batch_Alpha_0.001" -a 0.001
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -l 0.9 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.01 -bf "benchmarkdata/Cart_Batch_Alpha.txt" -name "Cart_Batch_Alpha_0.01" -a 0.01
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -l 0.9 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Cart_Batch_Alpha.txt" -name "Cart_Batch_Alpha_0.1" -a 0.1
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -l 0.9 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Cart_Batch_Alpha.txt" -name "Cart_Batch_Alpha_0.2" -a 0.2
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -l 0.9 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Cart_Batch_Alpha.txt" -name "Cart_Batch_Alpha_0.5" -a 0.5
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -l 0.9 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Cart_Batch_Alpha.txt" -name "Cart_Batch_Alpha_0.7" -a 0.7
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -l 0.9 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Cart_Batch_Alpha.txt" -name "Cart_Batch_Alpha_0.9" -a 0.9
# 
./gnuplot.pl  Cart_Batch_Alpha_0.0001 Cart_Batch_Alpha_0.001 Cart_Batch_Alpha_0.1 Cart_Batch_Alpha_0.2 Cart_Batch_Alpha_0.5 Cart_Batch_Alpha_0.7  Cart_Batch_Alpha_0.9 | gnuplot
ps2pdf allplots.ps benchmarkdata/Cart_Batch_Alpha.pdf
./gnuplotParam.pl benchmarkdata/Cart_Batch_Alpha.txt "Cart Pole" "{/Symbol a}" 1 | gnuplot
mv allplots.ps benchmarkdata/Cart_Batch_Alpha.ps
# 
# #Epsilon
# rm -f benchmarkdata/Cart_Batch_Epsilon.txt
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -l 0.9 -a 0.01 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Cart_Batch_Epsilon.txt" -name "Cart_Batch_Epsilon_0.0" -e 0.0
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -l 0.9 -a 0.01 -fa batch -fann-layers 3 5 20 1 -bv 0.001 -bf "benchmarkdata/Cart_Batch_Epsilon.txt" -name "Cart_Batch_Epsilon_0.001" -e 0.001
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -l 0.9 -a 0.01 -fa batch -fann-layers 3 5 20 1 -bv 0.01 -bf "benchmarkdata/Cart_Batch_Epsilon.txt" -name "Cart_Batch_Epsilon_0.01" -e 0.01
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -l 0.9 -a 0.01 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Cart_Batch_Epsilon.txt" -name "Cart_Batch_Epsilon_0.1" -e 0.1
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -l 0.9 -a 0.01 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Cart_Batch_Epsilon.txt" -name "Cart_Batch_Epsilon_0.2" -e 0.2
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -l 0.9 -a 0.01 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Cart_Batch_Epsilon.txt" -name "Cart_Batch_Epsilon_0.5" -e 0.5
# 
./gnuplot.pl Cart_Batch_Epsilon_0.0 Cart_Batch_Epsilon_0.001 Cart_Batch_Epsilon_0.01 Cart_Batch_Epsilon_0.1 Cart_Batch_Epsilon_0.2 Cart_Batch_Epsilon_0.5 | gnuplot
ps2pdf allplots.ps benchmarkdata/Cart_Batch_Epsilon.pdf
./gnuplotParam.pl benchmarkdata/Cart_Batch_Epsilon.txt "Cart Pole" "{/Symbol e}" 1 | gnuplot
mv allplots.ps benchmarkdata/Cart_Batch_Epsilon.ps

# #Lambda
# rm -f benchmarkdata/Cart_Batch_Lambda.txt
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Cart_Batch_Lambda.txt" -name "Cart_Batch_Lambda_0.0" -l 0.0
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Cart_Batch_Lambda.txt" -name "Cart_Batch_Lambda_0.1" -l 0.1
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Cart_Batch_Lambda.txt" -name "Cart_Batch_Lambda_0.2" -l 0.2
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Cart_Batch_Lambda.txt" -name "Cart_Batch_Lambda_0.3" -l 0.3
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Cart_Batch_Lambda.txt" -name "Cart_Batch_Lambda_0.4" -l 0.4
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Cart_Batch_Lambda.txt" -name "Cart_Batch_Lambda_0.5" -l 0.5
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Cart_Batch_Lambda.txt" -name "Cart_Batch_Lambda_0.6" -l 0.6
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Cart_Batch_Lambda.txt" -name "Cart_Batch_Lambda_0.7" -l 0.7
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Cart_Batch_Lambda.txt" -name "Cart_Batch_Lambda_0.8" -l 0.8
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -g 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Cart_Batch_Lambda.txt" -name "Cart_Batch_Lambda_0.9" -l 0.9

./gnuplot.pl  Cart_Batch_Lambda_0.0 Cart_Batch_Lambda_0.1 Cart_Batch_Lambda_0.2 Cart_Batch_Lambda_0.3 Cart_Batch_Lambda_0.4 Cart_Batch_Lambda_0.5 Cart_Batch_Lambda_0.6 Cart_Batch_Lambda_0.7 Cart_Batch_Lambda_0.8 Cart_Batch_Lambda_0.9 | gnuplot
ps2pdf allplots.ps benchmarkdata/Cart_Batch_Lambda.pdf
./gnuplotParam.pl benchmarkdata/Cart_Batch_Lambda.txt "Cart Pole" "{/Symbol l}" 0 | gnuplot
mv allplots.ps benchmarkdata/Cart_Batch_Lambda.ps

#Gamma
# rm -f benchmarkdata/Cart_Batch_Gamma.txt
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Cart_Batch_Gamma.txt" -name "Cart_Batch_Gamma_0.0" -g 0.0
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Cart_Batch_Gamma.txt" -name "Cart_Batch_Gamma_0.1" -g 0.1
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Cart_Batch_Gamma.txt" -name "Cart_Batch_Gamma_0.2" -g 0.2
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Cart_Batch_Gamma.txt" -name "Cart_Batch_Gamma_0.3" -g 0.3
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Cart_Batch_Gamma.txt" -name "Cart_Batch_Gamma_0.4" -g 0.4
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Cart_Batch_Gamma.txt" -name "Cart_Batch_Gamma_0.5" -g 0.5
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Cart_Batch_Gamma.txt" -name "Cart_Batch_Gamma_0.6" -g 0.6
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Cart_Batch_Gamma.txt" -name "Cart_Batch_Gamma_0.7" -g 0.7
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Cart_Batch_Gamma.txt" -name "Cart_Batch_Gamma_0.8" -g 0.8
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Cart_Batch_Gamma.txt" -name "Cart_Batch_Gamma_0.9" -g 0.9
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -s 0.4 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 1.0 -bf "benchmarkdata/Cart_Batch_Gamma.txt" -name "Cart_Batch_Gamma_1.0" -g 1.0

./gnuplot.pl  Cart_Batch_Gamma_0.0 Cart_Batch_Gamma_0.1 Cart_Batch_Gamma_0.2 Cart_Batch_Gamma_0.3 Cart_Batch_Gamma_0.4 Cart_Batch_Gamma_0.5 Cart_Batch_Gamma_0.6 Cart_Batch_Gamma_0.7 Cart_Batch_Gamma_0.8 Cart_Batch_Gamma_0.9 Cart_Batch_Gamma_1.0 | gnuplot
ps2pdf allplots.ps benchmarkdata/Cart_Batch_Gamma.pdf
./gnuplotParam.pl benchmarkdata/Cart_Batch_Gamma.txt "Cart Pole" "{/Symbol g}" 0 | gnuplot
mv allplots.ps benchmarkdata/Cart_Batch_Gamma.ps

#Sigma
# rm -f benchmarkdata/Cart_Batch_Sigma.txt
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Cart_Batch_Sigma.txt" -name "Cart_Batch_Sigma_0.0" -s 0.0
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Cart_Batch_Sigma.txt" -name "Cart_Batch_Sigma_0.1" -s 0.1
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Cart_Batch_Sigma.txt" -name "Cart_Batch_Sigma_0.2" -s 0.2
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Cart_Batch_Sigma.txt" -name "Cart_Batch_Sigma_0.3" -s 0.3
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Cart_Batch_Sigma.txt" -name "Cart_Batch_Sigma_0.4" -s 0.4
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Cart_Batch_Sigma.txt" -name "Cart_Batch_Sigma_0.5" -s 0.5
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Cart_Batch_Sigma.txt" -name "Cart_Batch_Sigma_0.6" -s 0.6
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Cart_Batch_Sigma.txt" -name "Cart_Batch_Sigma_0.7" -s 0.7
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Cart_Batch_Sigma.txt" -name "Cart_Batch_Sigma_0.8" -s 0.8
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Cart_Batch_Sigma.txt" -name "Cart_Batch_Sigma_0.9" -s 0.9
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 2000 2000 -cc 5 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 1.0 -bf "benchmarkdata/Cart_Batch_Sigma.txt" -name "Cart_Batch_Sigma_1.0" -s 1.0

./gnuplot.pl  Cart_Batch_Sigma_0.0 Cart_Batch_Sigma_0.1 Cart_Batch_Sigma_0.2 Cart_Batch_Sigma_0.3 Cart_Batch_Sigma_0.4 Cart_Batch_Sigma_0.5 Cart_Batch_Sigma_0.6 Cart_Batch_Sigma_0.7 Cart_Batch_Sigma_0.8 Cart_Batch_Sigma_0.9 Cart_Batch_Sigma_1.0 | gnuplot
ps2pdf allplots.ps benchmarkdata/Cart_Batch_Sigma.pdf
./gnuplotParam.pl benchmarkdata/Cart_Batch_Sigma.txt "Cart Pole" "{/Symbol s}" 0 | gnuplot
mv allplots.ps benchmarkdata/Cart_Batch_Sigma.ps

#cache size
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 100 -bf "benchmarkdata/Cart_Batch_Cache_Size.txt" -name "Cart_Batch_Cache_Size_100" -cachesize 100 100 -cc 5
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 500 -bf "benchmarkdata/Cart_Batch_Cache_Size.txt" -name "Cart_Batch_Cache_Size_500" -cachesize 500 500 -cc 5
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 750 -bf "benchmarkdata/Cart_Batch_Cache_Size.txt" -name "Cart_Batch_Cache_Size_750" -cachesize 750 750 -cc 5
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 1000 -bf "benchmarkdata/Cart_Batch_Cache_Size.txt" -name "Cart_Batch_Cache_Size_1000" -cachesize 1000 1000 -cc 5
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 2000 -bf "benchmarkdata/Cart_Batch_Cache_Size.txt" -name "Cart_Batch_Cache_Size_2000" -cachesize 2000 2000 -cc 5

./gnuplot.pl Cart_Batch_Cache_Size_100 Cart_Batch_Cache_Size_500 Cart_Batch_Cache_Size_750 Cart_Batch_Cache_Size_1000 Cart_Batch_Cache_Size_2000 | gnuplot
ps2pdf allplots.ps benchmarkdata/Cart_Batch_Cache_Size.pdf
./gnuplotParam.pl benchmarkdata/Cart_Batch_Cache_Size.txt "Cart Pole" "Cache Size" 0 | gnuplot
mv allplots.ps benchmarkdata/Cart_Batch_Cache_Size.ps

#cache commit
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 1 -bf "benchmarkdata/Cart_Batch_Cache_Commit.txt" -name "Cart_Batch_Cache_Commit_1" -cachesize 2000 2000 -cc 1
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 5 -bf "benchmarkdata/Cart_Batch_Cache_Commit.txt" -name "Cart_Batch_Cache_Commit_5" -cachesize 2000 2000 -cc 5
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 10 -bf "benchmarkdata/Cart_Batch_Cache_Commit.txt" -name "Cart_Batch_Cache_Commit_10" -cachesize 2000 2000 -cc 10
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 20 -bf "benchmarkdata/Cart_Batch_Cache_Commit.txt" -name "Cart_Batch_Cache_Commit_20" -cachesize 2000 2000 -cc 20
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 0.4 -g 0.9 -l 0.9 -a 0.01 -e 0.001 -fa batch -fann-layers 3 5 20 1 -bv 50 -bf "benchmarkdata/Cart_Batch_Cache_Commit.txt" -name "Cart_Batch_Cache_Commit_50" -cachesize 2000 2000 -cc 50

./gnuplot.pl Cart_Batch_Cache_Commit_1 Cart_Batch_Cache_Commit_5 Cart_Batch_Cache_Commit_10 Cart_Batch_Cache_Commit_20 Cart_Batch_Cache_Commit_50 | gnuplot
ps2pdf allplots.ps benchmarkdata/Cart_Batch_Cache_Commit.pdf
./gnuplotParam.pl benchmarkdata/Cart_Batch_Cache_Commit.txt "Cart Pole" "Cache Commit" 0 | gnuplot
mv allplots.ps benchmarkdata/Cart_Batch_Cache_Commit.ps

