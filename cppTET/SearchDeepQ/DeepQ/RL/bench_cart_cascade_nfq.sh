#!/bin/sh

#Default (for this test)
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.0 -bf "test.txt" -name "Cart_Cascade_NFQ_Default"

# #Alpha
# rm -f Cart_Cascade_NFQ_Alpha.txt
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -l 0.9 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.0001 -bf "Data/Cart_Cascade_NFQ_Alpha.txt" -name "Cart_Cascade_NFQ_Alpha_0.0001" -a 0.0001
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -l 0.9 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.001 -bf "Data/Cart_Cascade_NFQ_Alpha.txt" -name "Cart_Cascade_NFQ_Alpha_0.001" -a 0.001
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -l 0.9 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.01 -bf "Data/Cart_Cascade_NFQ_Alpha.txt" -name "Cart_Cascade_NFQ_Alpha_0.01" -a 0.01
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -l 0.9 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.1 -bf "Data/Cart_Cascade_NFQ_Alpha.txt" -name "Cart_Cascade_NFQ_Alpha_0.1" -a 0.1
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -l 0.9 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.2 -bf "Data/Cart_Cascade_NFQ_Alpha.txt" -name "Cart_Cascade_NFQ_Alpha_0.2" -a 0.2
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -l 0.9 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.5 -bf "Data/Cart_Cascade_NFQ_Alpha.txt" -name "Cart_Cascade_NFQ_Alpha_0.5" -a 0.5
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -l 0.9 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.7 -bf "Data/Cart_Cascade_NFQ_Alpha.txt" -name "Cart_Cascade_NFQ_Alpha_0.7" -a 0.7
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -l 0.9 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.9 -bf "Data/Cart_Cascade_NFQ_Alpha.txt" -name "Cart_Cascade_NFQ_Alpha_0.9" -a 0.9
# 
./gnuplot.pl  Cart_Cascade_NFQ_Alpha_0.0001 Cart_Cascade_NFQ_Alpha_0.001 Cart_Cascade_NFQ_Alpha_0.1 Cart_Cascade_NFQ_Alpha_0.2 Cart_Cascade_NFQ_Alpha_0.5 Cart_Cascade_NFQ_Alpha_0.7  Cart_Cascade_NFQ_Alpha_0.9 | gnuplot
ps2pdf allplots.ps Data/Cart_Cascade_NFQ_Alpha.pdf
./gnuplotParam.pl Data/Cart_Cascade_NFQ_Alpha.txt "Cart Pole" "{/Symbol a}" 1 | gnuplot
mv allplots.ps Data/Cart_Cascade_NFQ_Alpha.ps
# 
# #Epsilon
# rm -f Cart_Cascade_NFQ_Epsilon.txt
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -l 0.9 -a 0.7 -fa cascade -fann-layers 2 5 1 -bv 0.0 -bf "Data/Cart_Cascade_NFQ_Epsilon.txt" -name "Cart_Cascade_NFQ_Epsilon_0.0" -e 0.0
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -l 0.9 -a 0.7 -fa cascade -fann-layers 2 5 1 -bv 0.001 -bf "Data/Cart_Cascade_NFQ_Epsilon.txt" -name "Cart_Cascade_NFQ_Epsilon_0.001" -e 0.001
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -l 0.9 -a 0.7 -fa cascade -fann-layers 2 5 1 -bv 0.01 -bf "Data/Cart_Cascade_NFQ_Epsilon.txt" -name "Cart_Cascade_NFQ_Epsilon_0.01" -e 0.01
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -l 0.9 -a 0.7 -fa cascade -fann-layers 2 5 1 -bv 0.1 -bf "Data/Cart_Cascade_NFQ_Epsilon.txt" -name "Cart_Cascade_NFQ_Epsilon_0.1" -e 0.1
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -l 0.9 -a 0.7 -fa cascade -fann-layers 2 5 1 -bv 0.2 -bf "Data/Cart_Cascade_NFQ_Epsilon.txt" -name "Cart_Cascade_NFQ_Epsilon_0.2" -e 0.2
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -l 0.9 -a 0.7 -fa cascade -fann-layers 2 5 1 -bv 0.5 -bf "Data/Cart_Cascade_NFQ_Epsilon.txt" -name "Cart_Cascade_NFQ_Epsilon_0.5" -e 0.5
 
./gnuplot.pl Cart_Cascade_NFQ_Epsilon_0.0 Cart_Cascade_NFQ_Epsilon_0.001 Cart_Cascade_NFQ_Epsilon_0.01 Cart_Cascade_NFQ_Epsilon_0.1 Cart_Cascade_NFQ_Epsilon_0.2 Cart_Cascade_NFQ_Epsilon_0.5 | gnuplot
ps2pdf allplots.ps Data/Cart_Cascade_NFQ_Epsilon.pdf
./gnuplotParam.pl Data/Cart_Cascade_NFQ_Epsilon.txt "Cart Pole" "{/Symbol e}" 1 | gnuplot
mv allplots.ps Data/Cart_Cascade_NFQ_Epsilon.ps

# #Lambda
# rm -f Cart_Cascade_NFQ_Lambda.txt
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.0 -bf "Data/Cart_Cascade_NFQ_Lambda.txt" -name "Cart_Cascade_NFQ_Lambda_0.0" -l 0.0
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.1 -bf "Data/Cart_Cascade_NFQ_Lambda.txt" -name "Cart_Cascade_NFQ_Lambda_0.1" -l 0.1
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.2 -bf "Data/Cart_Cascade_NFQ_Lambda.txt" -name "Cart_Cascade_NFQ_Lambda_0.2" -l 0.2
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.3 -bf "Data/Cart_Cascade_NFQ_Lambda.txt" -name "Cart_Cascade_NFQ_Lambda_0.3" -l 0.3
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.4 -bf "Data/Cart_Cascade_NFQ_Lambda.txt" -name "Cart_Cascade_NFQ_Lambda_0.4" -l 0.4
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.5 -bf "Data/Cart_Cascade_NFQ_Lambda.txt" -name "Cart_Cascade_NFQ_Lambda_0.5" -l 0.5
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.6 -bf "Data/Cart_Cascade_NFQ_Lambda.txt" -name "Cart_Cascade_NFQ_Lambda_0.6" -l 0.6
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.7 -bf "Data/Cart_Cascade_NFQ_Lambda.txt" -name "Cart_Cascade_NFQ_Lambda_0.7" -l 0.7
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.8 -bf "Data/Cart_Cascade_NFQ_Lambda.txt" -name "Cart_Cascade_NFQ_Lambda_0.8" -l 0.8
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -g 1.0 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.9 -bf "Data/Cart_Cascade_NFQ_Lambda.txt" -name "Cart_Cascade_NFQ_Lambda_0.9" -l 0.9

./gnuplot.pl  Cart_Cascade_NFQ_Lambda_0.0 Cart_Cascade_NFQ_Lambda_0.1 Cart_Cascade_NFQ_Lambda_0.2 Cart_Cascade_NFQ_Lambda_0.3 Cart_Cascade_NFQ_Lambda_0.4 Cart_Cascade_NFQ_Lambda_0.5 Cart_Cascade_NFQ_Lambda_0.6 Cart_Cascade_NFQ_Lambda_0.7 Cart_Cascade_NFQ_Lambda_0.8 Cart_Cascade_NFQ_Lambda_0.9 | gnuplot
ps2pdf allplots.ps Data/Cart_Cascade_NFQ_Lambda.pdf
./gnuplotParam.pl Data/Cart_Cascade_NFQ_Lambda.txt "Cart Pole" "{/Symbol l}" 0 | gnuplot
mv allplots.ps Data/Cart_Cascade_NFQ_Lambda.ps

#Gamma
# rm -f Cart_Cascade_NFQ_Gamma.txt
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.0 -bf "Data/Cart_Cascade_NFQ_Gamma.txt" -name "Cart_Cascade_NFQ_Gamma_0.0" -g 0.0
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.1 -bf "Data/Cart_Cascade_NFQ_Gamma.txt" -name "Cart_Cascade_NFQ_Gamma_0.1" -g 0.1
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.2 -bf "Data/Cart_Cascade_NFQ_Gamma.txt" -name "Cart_Cascade_NFQ_Gamma_0.2" -g 0.2
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.3 -bf "Data/Cart_Cascade_NFQ_Gamma.txt" -name "Cart_Cascade_NFQ_Gamma_0.3" -g 0.3
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.4 -bf "Data/Cart_Cascade_NFQ_Gamma.txt" -name "Cart_Cascade_NFQ_Gamma_0.4" -g 0.4
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.5 -bf "Data/Cart_Cascade_NFQ_Gamma.txt" -name "Cart_Cascade_NFQ_Gamma_0.5" -g 0.5
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.6 -bf "Data/Cart_Cascade_NFQ_Gamma.txt" -name "Cart_Cascade_NFQ_Gamma_0.6" -g 0.6
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.7 -bf "Data/Cart_Cascade_NFQ_Gamma.txt" -name "Cart_Cascade_NFQ_Gamma_0.7" -g 0.7
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.8 -bf "Data/Cart_Cascade_NFQ_Gamma.txt" -name "Cart_Cascade_NFQ_Gamma_0.8" -g 0.8
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.9 -bf "Data/Cart_Cascade_NFQ_Gamma.txt" -name "Cart_Cascade_NFQ_Gamma_0.9" -g 0.9
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -s 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 1.0 -bf "Data/Cart_Cascade_NFQ_Gamma.txt" -name "Cart_Cascade_NFQ_Gamma_1.0" -g 1.0

./gnuplot.pl  Cart_Cascade_NFQ_Gamma_0.0 Cart_Cascade_NFQ_Gamma_0.1 Cart_Cascade_NFQ_Gamma_0.2 Cart_Cascade_NFQ_Gamma_0.3 Cart_Cascade_NFQ_Gamma_0.4 Cart_Cascade_NFQ_Gamma_0.5 Cart_Cascade_NFQ_Gamma_0.6 Cart_Cascade_NFQ_Gamma_0.7 Cart_Cascade_NFQ_Gamma_0.8 Cart_Cascade_NFQ_Gamma_0.9 Cart_Cascade_NFQ_Gamma_1.0 | gnuplot
ps2pdf allplots.ps Data/Cart_Cascade_NFQ_Gamma.pdf
./gnuplotParam.pl Data/Cart_Cascade_NFQ_Gamma.txt "Cart Pole" "{/Symbol g}" 0 | gnuplot
mv allplots.ps Data/Cart_Cascade_NFQ_Gamma.ps

#Sigma
# rm -f Cart_Cascade_NFQ_Sigma.txt
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.0 -bf "Data/Cart_Cascade_NFQ_Sigma.txt" -name "Cart_Cascade_NFQ_Sigma_0.0" -s 0.0
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.1 -bf "Data/Cart_Cascade_NFQ_Sigma.txt" -name "Cart_Cascade_NFQ_Sigma_0.1" -s 0.1
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.2 -bf "Data/Cart_Cascade_NFQ_Sigma.txt" -name "Cart_Cascade_NFQ_Sigma_0.2" -s 0.2
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.3 -bf "Data/Cart_Cascade_NFQ_Sigma.txt" -name "Cart_Cascade_NFQ_Sigma_0.3" -s 0.3
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.4 -bf "Data/Cart_Cascade_NFQ_Sigma.txt" -name "Cart_Cascade_NFQ_Sigma_0.4" -s 0.4
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.5 -bf "Data/Cart_Cascade_NFQ_Sigma.txt" -name "Cart_Cascade_NFQ_Sigma_0.5" -s 0.5
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.6 -bf "Data/Cart_Cascade_NFQ_Sigma.txt" -name "Cart_Cascade_NFQ_Sigma_0.6" -s 0.6
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.7 -bf "Data/Cart_Cascade_NFQ_Sigma.txt" -name "Cart_Cascade_NFQ_Sigma_0.7" -s 0.7
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.8 -bf "Data/Cart_Cascade_NFQ_Sigma.txt" -name "Cart_Cascade_NFQ_Sigma_0.8" -s 0.8
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 0.9 -bf "Data/Cart_Cascade_NFQ_Sigma.txt" -name "Cart_Cascade_NFQ_Sigma_0.9" -s 0.9
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -cachesize 750 750 -cc 5 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 1.0 -bf "Data/Cart_Cascade_NFQ_Sigma.txt" -name "Cart_Cascade_NFQ_Sigma_1.0" -s 1.0

./gnuplot.pl  Cart_Cascade_NFQ_Sigma_0.0 Cart_Cascade_NFQ_Sigma_0.1 Cart_Cascade_NFQ_Sigma_0.2 Cart_Cascade_NFQ_Sigma_0.3 Cart_Cascade_NFQ_Sigma_0.4 Cart_Cascade_NFQ_Sigma_0.5 Cart_Cascade_NFQ_Sigma_0.6 Cart_Cascade_NFQ_Sigma_0.7 Cart_Cascade_NFQ_Sigma_0.8 Cart_Cascade_NFQ_Sigma_0.9 Cart_Cascade_NFQ_Sigma_1.0 | gnuplot
ps2pdf allplots.ps Data/Cart_Cascade_NFQ_Sigma.pdf
./gnuplotParam.pl Data/Cart_Cascade_NFQ_Sigma.txt "Cart Pole" "{/Symbol s}" 0 | gnuplot
mv allplots.ps Data/Cart_Cascade_NFQ_Sigma.ps

#cache size
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -s 1.0 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 100 -bf "Data/Cart_Cascade_NFQ_Cache_Size.txt" -name "Cart_Cascade_NFQ_Cache_Size_100" -cachesize 100 100 -cc 5
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -s 1.0 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 500 -bf "Data/Cart_Cascade_NFQ_Cache_Size.txt" -name "Cart_Cascade_NFQ_Cache_Size_500" -cachesize 500 500 -cc 5
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -s 1.0 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 750 -bf "Data/Cart_Cascade_NFQ_Cache_Size.txt" -name "Cart_Cascade_NFQ_Cache_Size_750" -cachesize 750 750 -cc 5
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -s 1.0 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 1000 -bf "Data/Cart_Cascade_NFQ_Cache_Size.txt" -name "Cart_Cascade_NFQ_Cache_Size_1000" -cachesize 1000 1000 -cc 5
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -s 1.0 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 2000 -bf "Data/Cart_Cascade_NFQ_Cache_Size.txt" -name "Cart_Cascade_NFQ_Cache_Size_2000" -cachesize 2000 2000 -cc 5

./gnuplot.pl Cart_Cascade_NFQ_Cache_Size_100 Cart_Cascade_NFQ_Cache_Size_500 Cart_Cascade_NFQ_Cache_Size_750 Cart_Cascade_NFQ_Cache_Size_1000 Cart_Cascade_NFQ_Cache_Size_2000 | gnuplot
ps2pdf allplots.ps Data/Cart_Cascade_NFQ_Cache_Size.pdf
mv allplots.ps Data/Cart_Cascade_NFQ_Cache_Size_Candidates.ps
./gnuplotParam.pl Data/Cart_Cascade_NFQ_Cache_Size.txt "Cart Pole" "Cache Size" 0 | gnuplot
mv allplots.ps Data/Cart_Cascade_NFQ_Cache_Size.ps

#cache commit
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -s 1.0 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 1 -bf "Data/Cart_Cascade_NFQ_Cache_Commit.txt" -name "Cart_Cascade_NFQ_Cache_Commit_1" -cachesize 750 750 -cc 1
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -s 1.0 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 5 -bf "Data/Cart_Cascade_NFQ_Cache_Commit.txt" -name "Cart_Cascade_NFQ_Cache_Commit_5" -cachesize 750 750 -cc 5
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -s 1.0 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 10 -bf "Data/Cart_Cascade_NFQ_Cache_Commit.txt" -name "Cart_Cascade_NFQ_Cache_Commit_10" -cachesize 750 750 -cc 10
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -s 1.0 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 20 -bf "Data/Cart_Cascade_NFQ_Cache_Commit.txt" -name "Cart_Cascade_NFQ_Cache_Commit_20" -cachesize 750 750 -cc 20
./cart -q -te 2000 -on 1000 -off 1000 -select 1 -nfq -s 1.0 -g 1.0 -l 0.9 -a 0.7 -e 0.1 -fa cascade -fann-layers 2 5 1 -bv 50 -bf "Data/Cart_Cascade_NFQ_Cache_Commit.txt" -name "Cart_Cascade_NFQ_Cache_Commit_50" -cachesize 750 750 -cc 50

./gnuplot.pl Cart_Cascade_NFQ_Cache_Commit_1 Cart_Cascade_NFQ_Cache_Commit_5 Cart_Cascade_NFQ_Cache_Commit_10 Cart_Cascade_NFQ_Cache_Commit_20 Cart_Cascade_NFQ_Cache_Commit_50 | gnuplot
ps2pdf allplots.ps Data/Cart_Cascade_NFQ_Cache_Commit.pdf
./gnuplotParam.pl Data/Cart_Cascade_NFQ_Cache_Commit.txt "Cart Pole" "Cache Commit" 0 | gnuplot
mv allplots.ps Data/Cart_Cascade_NFQ_Cache_Commit.ps

