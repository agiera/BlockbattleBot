#!/bin/sh

#Default (for this test)
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/test.txt" -name "Cart_Incr_Default"

# #Alpha
rm -f benchmarkdata/Cart_Incr_Alpha.txt
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -l 0 -nocache -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.0001 -bf "benchmarkdata/Cart_Incr_Alpha.txt" -name "Cart_Incr_Alpha_0.0001" -a 0.0001
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -l 0 -nocache -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.001 -bf "benchmarkdata/Cart_Incr_Alpha.txt" -name "Cart_Incr_Alpha_0.001" -a 0.001
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -l 0 -nocache -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.01 -bf "benchmarkdata/Cart_Incr_Alpha.txt" -name "Cart_Incr_Alpha_0.01" -a 0.01
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -l 0 -nocache -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Cart_Incr_Alpha.txt" -name "Cart_Incr_Alpha_0.1" -a 0.1
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -l 0 -nocache -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Cart_Incr_Alpha.txt" -name "Cart_Incr_Alpha_0.2" -a 0.2
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -l 0 -nocache -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Cart_Incr_Alpha.txt" -name "Cart_Incr_Alpha_0.5" -a 0.5
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -l 0 -nocache -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Cart_Incr_Alpha.txt" -name "Cart_Incr_Alpha_0.7" -a 0.7
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -l 0 -nocache -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Cart_Incr_Alpha.txt" -name "Cart_Incr_Alpha_0.9" -a 0.9
# 
./gnuplot.pl  Cart_Incr_Alpha_0.0001 Cart_Incr_Alpha_0.001 Cart_Incr_Alpha_0.1 Cart_Incr_Alpha_0.2 Cart_Incr_Alpha_0.5 Cart_Incr_Alpha_0.7  Cart_Incr_Alpha_0.9 | gnuplot
ps2pdf allplots.ps benchmarkdata/Cart_Incr_Alpha.pdf
./gnuplotParam.pl benchmarkdata/Cart_Incr_Alpha.txt "Cart Pole" "{/Symbol a}" 1 | gnuplot
mv allplots.ps benchmarkdata/Cart_Incr_Alpha.ps
# 
# #Epsilon
rm -f benchmarkdata/Cart_Incr_Epsilon.txt
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -l 0 -nocache -a 0.01 -fa fann -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Cart_Incr_Epsilon.txt" -name "Cart_Incr_Epsilon_0.0" -e 0.0
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -l 0 -nocache -a 0.01 -fa fann -fann-layers 3 5 20 1 -bv 0.001 -bf "benchmarkdata/Cart_Incr_Epsilon.txt" -name "Cart_Incr_Epsilon_0.001" -e 0.001
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -l 0 -nocache -a 0.01 -fa fann -fann-layers 3 5 20 1 -bv 0.01 -bf "benchmarkdata/Cart_Incr_Epsilon.txt" -name "Cart_Incr_Epsilon_0.01" -e 0.01
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -l 0 -nocache -a 0.01 -fa fann -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Cart_Incr_Epsilon.txt" -name "Cart_Incr_Epsilon_0.1" -e 0.1
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -l 0 -nocache -a 0.01 -fa fann -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Cart_Incr_Epsilon.txt" -name "Cart_Incr_Epsilon_0.2" -e 0.2
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -l 0 -nocache -a 0.01 -fa fann -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Cart_Incr_Epsilon.txt" -name "Cart_Incr_Epsilon_0.5" -e 0.5
# 
./gnuplot.pl Cart_Incr_Epsilon_0.0 Cart_Incr_Epsilon_0.001 Cart_Incr_Epsilon_0.01 Cart_Incr_Epsilon_0.1 Cart_Incr_Epsilon_0.2 Cart_Incr_Epsilon_0.5 | gnuplot
ps2pdf allplots.ps benchmarkdata/Cart_Incr_Epsilon.pdf
./gnuplotParam.pl benchmarkdata/Cart_Incr_Epsilon.txt "Cart Pole" "{/Symbol e}" 1 | gnuplot
mv allplots.ps benchmarkdata/Cart_Incr_Epsilon.ps

# #Lambda
rm -f benchmarkdata/Cart_Incr_Lambda.txt
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Cart_Incr_Lambda.txt" -name "Cart_Incr_Lambda_0.0" -l 0.0
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Cart_Incr_Lambda.txt" -name "Cart_Incr_Lambda_0.1" -l 0.1
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Cart_Incr_Lambda.txt" -name "Cart_Incr_Lambda_0.2" -l 0.2
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Cart_Incr_Lambda.txt" -name "Cart_Incr_Lambda_0.3" -l 0.3
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Cart_Incr_Lambda.txt" -name "Cart_Incr_Lambda_0.4" -l 0.4
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Cart_Incr_Lambda.txt" -name "Cart_Incr_Lambda_0.5" -l 0.5
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Cart_Incr_Lambda.txt" -name "Cart_Incr_Lambda_0.6" -l 0.6
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Cart_Incr_Lambda.txt" -name "Cart_Incr_Lambda_0.7" -l 0.7
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Cart_Incr_Lambda.txt" -name "Cart_Incr_Lambda_0.8" -l 0.8
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -g 0.5 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Cart_Incr_Lambda.txt" -name "Cart_Incr_Lambda_0.9" -l 0.9

./gnuplot.pl  Cart_Incr_Lambda_0.0 Cart_Incr_Lambda_0.1 Cart_Incr_Lambda_0.2 Cart_Incr_Lambda_0.3 Cart_Incr_Lambda_0.4 Cart_Incr_Lambda_0.5 Cart_Incr_Lambda_0.6 Cart_Incr_Lambda_0.7 Cart_Incr_Lambda_0.8 Cart_Incr_Lambda_0.9 | gnuplot
ps2pdf allplots.ps benchmarkdata/Cart_Incr_Lambda.pdf
./gnuplotParam.pl benchmarkdata/Cart_Incr_Lambda.txt "Cart Pole" "{/Symbol l}" 0 | gnuplot
mv allplots.ps benchmarkdata/Cart_Incr_Lambda.ps

#Gamma
rm -f benchmarkdata/Cart_Incr_Gamma.txt
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Cart_Incr_Gamma.txt" -name "Cart_Incr_Gamma_0.0" -g 0.0
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Cart_Incr_Gamma.txt" -name "Cart_Incr_Gamma_0.1" -g 0.1
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Cart_Incr_Gamma.txt" -name "Cart_Incr_Gamma_0.2" -g 0.2
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Cart_Incr_Gamma.txt" -name "Cart_Incr_Gamma_0.3" -g 0.3
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Cart_Incr_Gamma.txt" -name "Cart_Incr_Gamma_0.4" -g 0.4
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Cart_Incr_Gamma.txt" -name "Cart_Incr_Gamma_0.5" -g 0.5
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Cart_Incr_Gamma.txt" -name "Cart_Incr_Gamma_0.6" -g 0.6
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Cart_Incr_Gamma.txt" -name "Cart_Incr_Gamma_0.7" -g 0.7
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Cart_Incr_Gamma.txt" -name "Cart_Incr_Gamma_0.8" -g 0.8
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Cart_Incr_Gamma.txt" -name "Cart_Incr_Gamma_0.9" -g 0.9
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -s 1 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 1.0 -bf "benchmarkdata/Cart_Incr_Gamma.txt" -name "Cart_Incr_Gamma_1.0" -g 1.0

./gnuplot.pl  Cart_Incr_Gamma_0.0 Cart_Incr_Gamma_0.1 Cart_Incr_Gamma_0.2 Cart_Incr_Gamma_0.3 Cart_Incr_Gamma_0.4 Cart_Incr_Gamma_0.5 Cart_Incr_Gamma_0.6 Cart_Incr_Gamma_0.7 Cart_Incr_Gamma_0.8 Cart_Incr_Gamma_0.9 Cart_Incr_Gamma_1.0 | gnuplot
ps2pdf allplots.ps benchmarkdata/Cart_Incr_Gamma.pdf
./gnuplotParam.pl benchmarkdata/Cart_Incr_Gamma.txt "Cart Pole" "{/Symbol g}" 0 | gnuplot
mv allplots.ps benchmarkdata/Cart_Incr_Gamma.ps

#Sigma
rm -f benchmarkdata/Cart_Incr_Sigma.txt
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -g 0.5 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Cart_Incr_Sigma.txt" -name "Cart_Incr_Sigma_0.0" -s 0.0
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -g 0.5 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Cart_Incr_Sigma.txt" -name "Cart_Incr_Sigma_0.1" -s 0.1
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -g 0.5 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Cart_Incr_Sigma.txt" -name "Cart_Incr_Sigma_0.2" -s 0.2
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -g 0.5 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Cart_Incr_Sigma.txt" -name "Cart_Incr_Sigma_0.3" -s 0.3
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -g 0.5 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Cart_Incr_Sigma.txt" -name "Cart_Incr_Sigma_0.4" -s 0.4
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -g 0.5 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Cart_Incr_Sigma.txt" -name "Cart_Incr_Sigma_0.5" -s 0.5
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -g 0.5 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Cart_Incr_Sigma.txt" -name "Cart_Incr_Sigma_0.6" -s 0.6
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -g 0.5 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Cart_Incr_Sigma.txt" -name "Cart_Incr_Sigma_0.7" -s 0.7
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -g 0.5 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Cart_Incr_Sigma.txt" -name "Cart_Incr_Sigma_0.8" -s 0.8
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -g 0.5 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Cart_Incr_Sigma.txt" -name "Cart_Incr_Sigma_0.9" -s 0.9
./cart -q -te 11000 -on 10000 -off 10000 -select 1 -g 0.5 -l 0 -nocache -a 0.01 -e 0.1 -fa fann -fann-layers 3 5 20 1 -bv 1.0 -bf "benchmarkdata/Cart_Incr_Sigma.txt" -name "Cart_Incr_Sigma_1.0" -s 1.0

./gnuplot.pl  Cart_Incr_Sigma_0.0 Cart_Incr_Sigma_0.1 Cart_Incr_Sigma_0.2 Cart_Incr_Sigma_0.3 Cart_Incr_Sigma_0.4 Cart_Incr_Sigma_0.5 Cart_Incr_Sigma_0.6 Cart_Incr_Sigma_0.7 Cart_Incr_Sigma_0.8 Cart_Incr_Sigma_0.9 Cart_Incr_Sigma_1.0 | gnuplot
ps2pdf allplots.ps benchmarkdata/Cart_Incr_Sigma.pdf
./gnuplotParam.pl benchmarkdata/Cart_Incr_Sigma.txt "Cart Pole" "{/Symbol s}" 0 | gnuplot
mv allplots.ps benchmarkdata/Cart_Incr_Sigma.ps
