#!/bin/sh

#Default (for this test)
# ./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular_Default.txt" -select 1 -s 0.5 -g 0.8 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Default"

#For comparison with Adam White
#./rl -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular_Adam.txt" -select 1 -s 1 -g 1 -l 0 -a 0.001 -e 0.2 -fa tabular -initial 1 -name "BJ_Tabular_Adam"
# ./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular_Adam0.5.txt" -select 1 -s 0.5 -g 1 -l 0 -a 0.001 -e 0.2 -fa tabular -initial 1 -name "BJ_Tabular0.5_Adam"
# ./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular_Adam0.0.txt" -select 1 -s 0 -g 1 -l 0 -a 0.001 -e 0.2 -fa tabular -initial 1 -name "BJ_Tabular0.0_Adam"

#Test for different Sigma values over the first 100,000 episodes
./bj -q -te 100000 -on 0 -bv 0.0 -bf "Data/BJ_Tabular_Sigma_Short.txt" -select 1  -g 0.8 -l 0.6 -a 0.1 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_Short_0.0" -s 0.0
./bj -q -te 100000 -on 0 -bv 0.1 -bf "Data/BJ_Tabular_Sigma_Short.txt" -select 1  -g 0.8 -l 0.6 -a 0.1 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_Short_0.1" -s 0.1
./bj -q -te 100000 -on 0 -bv 0.2 -bf "Data/BJ_Tabular_Sigma_Short.txt" -select 1  -g 0.8 -l 0.6 -a 0.1 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_Short_0.2" -s 0.2
./bj -q -te 100000 -on 0 -bv 0.3 -bf "Data/BJ_Tabular_Sigma_Short.txt" -select 1  -g 0.8 -l 0.6 -a 0.1 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_Short_0.3" -s 0.3
./bj -q -te 100000 -on 0 -bv 0.4 -bf "Data/BJ_Tabular_Sigma_Short.txt" -select 1  -g 0.8 -l 0.6 -a 0.1 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_Short_0.4" -s 0.4
./bj -q -te 100000 -on 0 -bv 0.5 -bf "Data/BJ_Tabular_Sigma_Short.txt" -select 1  -g 0.8 -l 0.6 -a 0.1 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_Short_0.5" -s 0.5
./bj -q -te 100000 -on 0 -bv 0.6 -bf "Data/BJ_Tabular_Sigma_Short.txt" -select 1  -g 0.8 -l 0.6 -a 0.1 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_Short_0.6" -s 0.6
./bj -q -te 100000 -on 0 -bv 0.7 -bf "Data/BJ_Tabular_Sigma_Short.txt" -select 1  -g 0.8 -l 0.6 -a 0.1 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_Short_0.7" -s 0.7
./bj -q -te 100000 -on 0 -bv 0.8 -bf "Data/BJ_Tabular_Sigma_Short.txt" -select 1  -g 0.8 -l 0.6 -a 0.1 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_Short_0.8" -s 0.8
./bj -q -te 100000 -on 0 -bv 0.9 -bf "Data/BJ_Tabular_Sigma_Short.txt" -select 1  -g 0.8 -l 0.6 -a 0.1 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_Short_0.9" -s 0.9
./bj -q -te 100000 -on 0 -bv 1.0 -bf "Data/BJ_Tabular_Sigma_Short.txt" -select 1  -g 0.8 -l 0.6 -a 0.1 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_Short_1.0" -s 1.0
  
./BenchMainAgents.pl 10000 BJ_Tabular_Sigma_Short_0.0 BJ_Tabular_Sigma_Short_0.1 BJ_Tabular_Sigma_Short_0.2  BJ_Tabular_Sigma_Short_0.3 BJ_Tabular_Sigma_Short_0.4 BJ_Tabular_Sigma_Short_0.5 BJ_Tabular_Sigma_Short_0.6 BJ_Tabular_Sigma_Short_0.7 BJ_Tabular_Sigma_Short_0.8 BJ_Tabular_Sigma_Short_0.9 BJ_Tabular_Sigma_Short_1.0
mv allplots.ps Data/BJ_Tabular_Sigma_Short_Offline.ps

#   
# #Alpha
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0001 -bf "Data/BJ_Tabular_Alpha.txt" -select 1 -s 0.5 -g 0.8 -l 0.6 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Alpha_0.0001" -a 0.0001
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.001 -bf "Data/BJ_Tabular_Alpha.txt" -select 1 -s 0.5 -g 0.8 -l 0.6 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Alpha_0.001" -a 0.001
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.01 -bf "Data/BJ_Tabular_Alpha.txt" -select 1 -s 0.5 -g 0.8 -l 0.6 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Alpha_0.01" -a 0.01
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.1 -bf "Data/BJ_Tabular_Alpha.txt" -select 1 -s 0.5 -g 0.8 -l 0.6 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Alpha_0.1" -a 0.1
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.2 -bf "Data/BJ_Tabular_Alpha.txt" -select 1 -s 0.5 -g 0.8 -l 0.6 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Alpha_0.2" -a 0.2
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.5 -bf "Data/BJ_Tabular_Alpha.txt" -select 1 -s 0.5 -g 0.8 -l 0.6 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Alpha_0.5" -a 0.5
#   
./gnuplot.pl BJ_Tabular_Default BJ_Tabular_Alpha_0.0001 BJ_Tabular_Alpha_0.001 BJ_Tabular_Alpha_0.1 BJ_Tabular_Alpha_0.2 BJ_Tabular_Alpha_0.5 | gnuplot
ps2pdf allplots.ps Data/BJ_Tabular_Alpha.pdf
./gnuplotParam.pl Data/BJ_Tabular_Alpha.txt "Blackjack ({/Symbol s}=0.5)" "{/Symbol a}" 1 | gnuplot
mv allplots.ps Data/BJ_Tabular_Alpha.ps
#   
# #Epsilon
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular_Epsilon.txt" -select 1 -s 0.5  -g 0.8 -l 0.6 -a 0.01 -fa tabular -initial 1 -name "BJ_Tabular_Epsilon_0.0" -e 0.0
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.001 -bf "Data/BJ_Tabular_Epsilon.txt" -select 1 -s 0.5  -g 0.8 -l 0.6 -a 0.01 -fa tabular -initial 1 -name "BJ_Tabular_Epsilon_0.001" -e 0.001
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.01 -bf "Data/BJ_Tabular_Epsilon.txt" -select 1 -s 0.5  -g 0.8 -l 0.6 -a 0.01 -fa tabular -initial 1 -name "BJ_Tabular_Epsilon_0.01" -e 0.01
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.1 -bf "Data/BJ_Tabular_Epsilon.txt" -select 1 -s 0.5  -g 0.8 -l 0.6 -a 0.01 -fa tabular -initial 1 -name "BJ_Tabular_Epsilon_0.1" -e 0.1
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.2 -bf "Data/BJ_Tabular_Epsilon.txt" -select 1 -s 0.5  -g 0.8 -l 0.6 -a 0.01 -fa tabular -initial 1 -name "BJ_Tabular_Epsilon_0.2" -e 0.2
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.3 -bf "Data/BJ_Tabular_Epsilon.txt" -select 1 -s 0.5  -g 0.8 -l 0.6 -a 0.01 -fa tabular -initial 1 -name "BJ_Tabular_Epsilon_0.3" -e 0.3
#   
./gnuplot.pl BJ_Tabular_Default BJ_Tabular_Epsilon_0.0 BJ_Tabular_Epsilon_0.001 BJ_Tabular_Epsilon_0.01 BJ_Tabular_Epsilon_0.1 BJ_Tabular_Epsilon_0.2 BJ_Tabular_Epsilon_0.3 | gnuplot
ps2pdf allplots.ps Data/BJ_Tabular_Epsilon.pdf
./gnuplotParam.pl Data/BJ_Tabular_Epsilon.txt "Blackjack ({/Symbol s}=0.5)" "{/Symbol e}" 1 | gnuplot
mv allplots.ps Data/BJ_Tabular_Epsilon.ps
#  
# #Lambda
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular_Lambda.txt" -select 1 -s 0.5 -g 0.8 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Lambda_0.0" -l 0.0
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.1 -bf "Data/BJ_Tabular_Lambda.txt" -select 1 -s 0.5 -g 0.8 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Lambda_0.1" -l 0.1
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.2 -bf "Data/BJ_Tabular_Lambda.txt" -select 1 -s 0.5 -g 0.8 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Lambda_0.2" -l 0.2
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.3 -bf "Data/BJ_Tabular_Lambda.txt" -select 1 -s 0.5 -g 0.8 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Lambda_0.3" -l 0.3
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.4 -bf "Data/BJ_Tabular_Lambda.txt" -select 1 -s 0.5 -g 0.8 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Lambda_0.4" -l 0.4
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.5 -bf "Data/BJ_Tabular_Lambda.txt" -select 1 -s 0.5 -g 0.8 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Lambda_0.5" -l 0.5
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.6 -bf "Data/BJ_Tabular_Lambda.txt" -select 1 -s 0.5 -g 0.8 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Lambda_0.6" -l 0.6
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.7 -bf "Data/BJ_Tabular_Lambda.txt" -select 1 -s 0.5 -g 0.8 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Lambda_0.7" -l 0.7
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.8 -bf "Data/BJ_Tabular_Lambda.txt" -select 1 -s 0.5 -g 0.8 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Lambda_0.8" -l 0.8
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.9 -bf "Data/BJ_Tabular_Lambda.txt" -select 1 -s 0.5 -g 0.8 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Lambda_0.9" -l 0.9
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 1.0 -bf "Data/BJ_Tabular_Lambda.txt" -select 1 -s 0.5 -g 0.8 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Lambda_1.0" -l 1.0
#   
./gnuplot.pl BJ_Tabular_Default BJ_Tabular_Lambda_0.0 BJ_Tabular_Lambda_0.1 BJ_Tabular_Lambda_0.2 BJ_Tabular_Lambda_0.3 BJ_Tabular_Lambda_0.4 BJ_Tabular_Lambda_0.5 BJ_Tabular_Lambda_0.6 BJ_Tabular_Lambda_0.7 BJ_Tabular_Lambda_0.8 BJ_Tabular_Lambda_0.9 BJ_Tabular_Lambda_1.0 | gnuplot
ps2pdf allplots.ps Data/BJ_Tabular_Lambda.pdf
./gnuplotParam.pl Data/BJ_Tabular_Lambda.txt "Blackjack ({/Symbol s}=0.5)" "{/Symbol l}" 0 | gnuplot
mv allplots.ps Data/BJ_Tabular_Lambda.ps
#  
# #Gamma
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular_Gamma.txt" -select 1 -s 0.5 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_0.0" -g 0.0
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.1 -bf "Data/BJ_Tabular_Gamma.txt" -select 1 -s 0.5 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_0.1" -g 0.1
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.2 -bf "Data/BJ_Tabular_Gamma.txt" -select 1 -s 0.5 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_0.2" -g 0.2
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.3 -bf "Data/BJ_Tabular_Gamma.txt" -select 1 -s 0.5 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_0.3" -g 0.3
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.4 -bf "Data/BJ_Tabular_Gamma.txt" -select 1 -s 0.5 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_0.4" -g 0.4
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.5 -bf "Data/BJ_Tabular_Gamma.txt" -select 1 -s 0.5 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_0.5" -g 0.5
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.6 -bf "Data/BJ_Tabular_Gamma.txt" -select 1 -s 0.5 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_0.6" -g 0.6
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.7 -bf "Data/BJ_Tabular_Gamma.txt" -select 1 -s 0.5 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_0.7" -g 0.7
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.8 -bf "Data/BJ_Tabular_Gamma.txt" -select 1 -s 0.5 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_0.8" -g 0.8
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.9 -bf "Data/BJ_Tabular_Gamma.txt" -select 1 -s 0.5 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_0.9" -g 0.9
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 1.0 -bf "Data/BJ_Tabular_Gamma.txt" -select 1 -s 0.5 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_1.0" -g 1.0
#   
./gnuplot.pl BJ_Tabular_Default BJ_Tabular_Gamma_0.0 BJ_Tabular_Gamma_0.1 BJ_Tabular_Gamma_0.2 BJ_Tabular_Gamma_0.3 BJ_Tabular_Gamma_0.4 BJ_Tabular_Gamma_0.5 BJ_Tabular_Gamma_0.6 BJ_Tabular_Gamma_0.7 BJ_Tabular_Gamma_0.8 BJ_Tabular_Gamma_0.9 BJ_Tabular_Gamma_1.0 | gnuplot
ps2pdf allplots.ps Data/BJ_Tabular_Gamma.pdf
./gnuplotParam.pl Data/BJ_Tabular_Gamma.txt "Blackjack ({/Symbol s}=0.5)" "{/Symbol g}" 0 | gnuplot
mv allplots.ps Data/BJ_Tabular_Gamma.ps

 
# #Lambda & Gamma
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular_Gamma_Lambda.txt" -select 1 -s 0.5 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_0.0_Lambda_0.0" -g 0.0 -l 0.0
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular_Gamma_Lambda.txt" -select 1 -s 0.5 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_0.6_Lambda_0.0" -g 0.6 -l 0.0
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular_Gamma_Lambda.txt" -select 1 -s 0.5 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_1.0_Lambda_0.0" -g 1.0 -l 0.0
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular_Gamma_Lambda.txt" -select 1 -s 0.5 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_0.0_Lambda_0.6" -g 0.0 -l 0.6
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular_Gamma_Lambda.txt" -select 1 -s 0.5 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_0.6_Lambda_0.6" -g 0.6 -l 0.6
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular_Gamma_Lambda.txt" -select 1 -s 0.5 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_1.0_Lambda_0.6" -g 1.0 -l 0.6
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular_Gamma_Lambda.txt" -select 1 -s 0.5 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_0.0_Lambda_1.0" -g 0.0 -l 1.0
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular_Gamma_Lambda.txt" -select 1 -s 0.5 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_0.6_Lambda_1.0" -g 0.6 -l 1.0
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular_Gamma_Lambda.txt" -select 1 -s 0.5 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Gamma_1.0_Lambda_1.0" -g 1.0 -l 1.0
# 
./gnuplot.pl BJ_Tabular_Default BJ_Tabular_Gamma_0.0_Lambda_0.0 BJ_Tabular_Gamma_0.6_Lambda_0.0 BJ_Tabular_Gamma_1.0_Lambda_0.0 BJ_Tabular_Gamma_0.0_Lambda_0.6 BJ_Tabular_Gamma_0.6_Lambda_0.6 BJ_Tabular_Gamma_1.0_Lambda_0.6 BJ_Tabular_Gamma_0.0_Lambda_1.0 BJ_Tabular_Gamma_0.6_Lambda_1.0 BJ_Tabular_Gamma_1.0_Lambda_1.0 | gnuplot
ps2pdf allplots.ps Data/BJ_Tabular_Gamma_lambda.pdf
./gnuplotParam.pl Data/BJ_Tabular_Gamma_Lambda.txt "Blackjack ({/Symbol s}=0.5)" "{/Symbol g}" 0 | gnuplot
mv allplots.ps Data/BJ_Tabular_Gamma_Lambda.ps

#Alpha
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0001 -bf "Data/BJ_Tabular0_Alpha.txt" -select 1 -s 0.0 -g 0.5 -l 0.2 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Alpha_0.0001" -a 0.0001
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.001 -bf "Data/BJ_Tabular0_Alpha.txt" -select 1 -s 0.0 -g 0.5 -l 0.2 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Alpha_0.001" -a 0.001
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.01 -bf "Data/BJ_Tabular0_Alpha.txt" -select 1 -s 0.0 -g 0.5 -l 0.2 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Alpha_0.01" -a 0.01
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.1 -bf "Data/BJ_Tabular0_Alpha.txt" -select 1 -s 0.0 -g 0.5 -l 0.2 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Alpha_0.1" -a 0.1
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.2 -bf "Data/BJ_Tabular0_Alpha.txt" -select 1 -s 0.0 -g 0.5 -l 0.2 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Alpha_0.2" -a 0.2
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.5 -bf "Data/BJ_Tabular0_Alpha.txt" -select 1 -s 0.0 -g 0.5 -l 0.2 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Alpha_0.5" -a 0.5
# 
./gnuplot.pl BJ_Tabular0_Default BJ_Tabular0_Alpha_0.0001 BJ_Tabular0_Alpha_0.001 BJ_Tabular0_Alpha_0.1 BJ_Tabular0_Alpha_0.2 BJ_Tabular0_Alpha_0.5 | gnuplot
ps2pdf allplots.ps Data/BJ_Tabular0_Alpha.pdf
./gnuplotParam.pl Data/BJ_Tabular0_Alpha.txt "Blackjack ({/Symbol s}=0.0)" "{/Symbol a}" 1 | gnuplot
mv allplots.ps Data/BJ_Tabular0_Alpha.ps
# 
# #Epsilon
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular0_Epsilon.txt" -select 1 -s 0.0  -g 0.5 -l 0.2 -a 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Epsilon_0.0" -e 0.0
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.001 -bf "Data/BJ_Tabular0_Epsilon.txt" -select 1 -s 0.0  -g 0.5 -l 0.2 -a 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Epsilon_0.001" -e 0.001
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.01 -bf "Data/BJ_Tabular0_Epsilon.txt" -select 1 -s 0.0  -g 0.5 -l 0.2 -a 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Epsilon_0.01" -e 0.01
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.1 -bf "Data/BJ_Tabular0_Epsilon.txt" -select 1 -s 0.0  -g 0.5 -l 0.2 -a 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Epsilon_0.1" -e 0.1
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.2 -bf "Data/BJ_Tabular0_Epsilon.txt" -select 1 -s 0.0  -g 0.5 -l 0.2 -a 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Epsilon_0.2" -e 0.2
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.3 -bf "Data/BJ_Tabular0_Epsilon.txt" -select 1 -s 0.0  -g 0.5 -l 0.2 -a 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Epsilon_0.3" -e 0.3
# 
./gnuplot.pl BJ_Tabular0_Default BJ_Tabular0_Epsilon_0.0 BJ_Tabular0_Epsilon_0.001 BJ_Tabular0_Epsilon_0.01 BJ_Tabular0_Epsilon_0.1 BJ_Tabular0_Epsilon_0.2 BJ_Tabular0_Epsilon_0.3 | gnuplot
ps2pdf allplots.ps Data/BJ_Tabular0_Epsilon.pdf
./gnuplotParam.pl Data/BJ_Tabular0_Epsilon.txt "Blackjack ({/Symbol s}=0.0)" "{/Symbol e}" 1 | gnuplot
mv allplots.ps Data/BJ_Tabular0_Epsilon.ps
# 
# #Lambda
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular0_Lambda.txt" -select 1 -s 0.0 -g 0.5 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Lambda_0.0" -l 0.0
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.1 -bf "Data/BJ_Tabular0_Lambda.txt" -select 1 -s 0.0 -g 0.5 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Lambda_0.1" -l 0.1
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.2 -bf "Data/BJ_Tabular0_Lambda.txt" -select 1 -s 0.0 -g 0.5 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Lambda_0.2" -l 0.2
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.3 -bf "Data/BJ_Tabular0_Lambda.txt" -select 1 -s 0.0 -g 0.5 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Lambda_0.3" -l 0.3
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.4 -bf "Data/BJ_Tabular0_Lambda.txt" -select 1 -s 0.0 -g 0.5 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Lambda_0.4" -l 0.4
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.5 -bf "Data/BJ_Tabular0_Lambda.txt" -select 1 -s 0.0 -g 0.5 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Lambda_0.5" -l 0.5
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.6 -bf "Data/BJ_Tabular0_Lambda.txt" -select 1 -s 0.0 -g 0.5 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Lambda_0.6" -l 0.6
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.7 -bf "Data/BJ_Tabular0_Lambda.txt" -select 1 -s 0.0 -g 0.5 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Lambda_0.7" -l 0.7
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.8 -bf "Data/BJ_Tabular0_Lambda.txt" -select 1 -s 0.0 -g 0.5 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Lambda_0.8" -l 0.8
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.9 -bf "Data/BJ_Tabular0_Lambda.txt" -select 1 -s 0.0 -g 0.5 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Lambda_0.9" -l 0.9
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 1.0 -bf "Data/BJ_Tabular0_Lambda.txt" -select 1 -s 0.0 -g 0.5 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Lambda_1.0" -l 1.0
# 
./gnuplot.pl BJ_Tabular0_Default BJ_Tabular0_Lambda_0.0 BJ_Tabular0_Lambda_0.1 BJ_Tabular0_Lambda_0.2 BJ_Tabular0_Lambda_0.3 BJ_Tabular0_Lambda_0.4 BJ_Tabular0_Lambda_0.5 BJ_Tabular0_Lambda_0.6 BJ_Tabular0_Lambda_0.7 BJ_Tabular0_Lambda_0.8 BJ_Tabular0_Lambda_0.9 BJ_Tabular0_Lambda_1.0 | gnuplot
ps2pdf allplots.ps Data/BJ_Tabular0_Lambda.pdf
./gnuplotParam.pl Data/BJ_Tabular0_Lambda.txt "Blackjack ({/Symbol s}=0.0)" "{/Symbol l}" 0 | gnuplot
mv allplots.ps Data/BJ_Tabular0_Lambda.ps

# 
# #Gamma
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular0_Gamma.txt" -select 1 -s 0.0 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Gamma_0.0" -g 0.0
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.1 -bf "Data/BJ_Tabular0_Gamma.txt" -select 1 -s 0.0 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Gamma_0.1" -g 0.1
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.2 -bf "Data/BJ_Tabular0_Gamma.txt" -select 1 -s 0.0 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Gamma_0.2" -g 0.2
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.3 -bf "Data/BJ_Tabular0_Gamma.txt" -select 1 -s 0.0 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Gamma_0.3" -g 0.3
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.4 -bf "Data/BJ_Tabular0_Gamma.txt" -select 1 -s 0.0 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Gamma_0.4" -g 0.4
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.5 -bf "Data/BJ_Tabular0_Gamma.txt" -select 1 -s 0.0 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Gamma_0.5" -g 0.5
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.6 -bf "Data/BJ_Tabular0_Gamma.txt" -select 1 -s 0.0 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Gamma_0.6" -g 0.6
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.7 -bf "Data/BJ_Tabular0_Gamma.txt" -select 1 -s 0.0 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Gamma_0.7" -g 0.7
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.8 -bf "Data/BJ_Tabular0_Gamma.txt" -select 1 -s 0.0 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Gamma_0.8" -g 0.8
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.9 -bf "Data/BJ_Tabular0_Gamma.txt" -select 1 -s 0.0 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Gamma_0.9" -g 0.9
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 1.0 -bf "Data/BJ_Tabular0_Gamma.txt" -select 1 -s 0.0 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Gamma_1.0" -g 1.0
# 
./gnuplot.pl BJ_Tabular0_Default BJ_Tabular0_Gamma_0.0 BJ_Tabular0_Gamma_0.1 BJ_Tabular0_Gamma_0.2 BJ_Tabular0_Gamma_0.3 BJ_Tabular0_Gamma_0.4 BJ_Tabular0_Gamma_0.5 BJ_Tabular0_Gamma_0.6 BJ_Tabular0_Gamma_0.7 BJ_Tabular0_Gamma_0.8 BJ_Tabular0_Gamma_0.9 BJ_Tabular0_Gamma_1.0 | gnuplot
ps2pdf allplots.ps Data/BJ_Tabular0_Gamma.pdf
./gnuplotParam.pl Data/BJ_Tabular0_Gamma.txt "Blackjack ({/Symbol s}=0.0)" "{/Symbol g}" 0 | gnuplot
mv allplots.ps Data/BJ_Tabular0_Gamma.ps

# #Alpha
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0001 -bf "Data/BJ_Tabular1_Alpha.txt" -select 1 -s 1.0 -g 0.6 -l 0.3 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Alpha_0.0001" -a 0.0001
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.001 -bf "Data/BJ_Tabular1_Alpha.txt" -select 1 -s 1.0 -g 0.6 -l 0.3 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Alpha_0.001" -a 0.001
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.01 -bf "Data/BJ_Tabular1_Alpha.txt" -select 1 -s 1.0 -g 0.6 -l 0.3 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Alpha_0.01" -a 0.01
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.1 -bf "Data/BJ_Tabular1_Alpha.txt" -select 1 -s 1.0 -g 0.6 -l 0.3 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Alpha_0.1" -a 0.1
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.2 -bf "Data/BJ_Tabular1_Alpha.txt" -select 1 -s 1.0 -g 0.6 -l 0.3 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Alpha_0.2" -a 0.2
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.5 -bf "Data/BJ_Tabular1_Alpha.txt" -select 1 -s 1.0 -g 0.6 -l 0.3 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Alpha_0.5" -a 0.5
# 
./gnuplot.pl BJ_Tabular1_Default BJ_Tabular1_Alpha_0.0001 BJ_Tabular1_Alpha_0.001 BJ_Tabular1_Alpha_0.1 BJ_Tabular1_Alpha_0.2 BJ_Tabular1_Alpha_0.5 | gnuplot
ps2pdf allplots.ps Data/BJ_Tabular1_Alpha.pdf
./gnuplotParam.pl Data/BJ_Tabular1_Alpha.txt "Blackjack ({/Symbol s}=1.0)" "{/Symbol a}" 1 | gnuplot
mv allplots.ps Data/BJ_Tabular1_Alpha.ps
# 
# #Epsilon
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular1_Epsilon.txt" -select 1 -s 1.0  -g 0.6 -l 0.3 -a 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Epsilon_0.0" -e 0.0
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.001 -bf "Data/BJ_Tabular1_Epsilon.txt" -select 1 -s 1.0  -g 0.6 -l 0.3 -a 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Epsilon_0.001" -e 0.001
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.01 -bf "Data/BJ_Tabular1_Epsilon.txt" -select 1 -s 1.0  -g 0.6 -l 0.3 -a 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Epsilon_0.01" -e 0.01
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.1 -bf "Data/BJ_Tabular1_Epsilon.txt" -select 1 -s 1.0  -g 0.6 -l 0.3 -a 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Epsilon_0.1" -e 0.1
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.2 -bf "Data/BJ_Tabular1_Epsilon.txt" -select 1 -s 1.0  -g 0.6 -l 0.3 -a 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Epsilon_0.2" -e 0.2
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.3 -bf "Data/BJ_Tabular1_Epsilon.txt" -select 1 -s 1.0  -g 0.6 -l 0.3 -a 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Epsilon_0.3" -e 0.3
# 
./gnuplot.pl BJ_Tabular1_Default BJ_Tabular1_Epsilon_0.0 BJ_Tabular1_Epsilon_0.001 BJ_Tabular1_Epsilon_0.01 BJ_Tabular1_Epsilon_0.1 BJ_Tabular1_Epsilon_0.2 BJ_Tabular1_Epsilon_0.3 | gnuplot
ps2pdf allplots.ps Data/BJ_Tabular1_Epsilon.pdf
./gnuplotParam.pl Data/BJ_Tabular1_Epsilon.txt "Blackjack ({/Symbol s}=1.0)" "{/Symbol e}" 1 | gnuplot
mv allplots.ps Data/BJ_Tabular1_Epsilon.ps
# 
# #Lambda
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular1_Lambda.txt" -select 1 -s 1.0 -g 0.6 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Lambda_0.0" -l 0.0
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.1 -bf "Data/BJ_Tabular1_Lambda.txt" -select 1 -s 1.0 -g 0.6 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Lambda_0.1" -l 0.1
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.2 -bf "Data/BJ_Tabular1_Lambda.txt" -select 1 -s 1.0 -g 0.6 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Lambda_0.2" -l 0.2
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.3 -bf "Data/BJ_Tabular1_Lambda.txt" -select 1 -s 1.0 -g 0.6 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Lambda_0.3" -l 0.3
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.4 -bf "Data/BJ_Tabular1_Lambda.txt" -select 1 -s 1.0 -g 0.6 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Lambda_0.4" -l 0.4
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.5 -bf "Data/BJ_Tabular1_Lambda.txt" -select 1 -s 1.0 -g 0.6 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Lambda_0.5" -l 0.5
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.6 -bf "Data/BJ_Tabular1_Lambda.txt" -select 1 -s 1.0 -g 0.6 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Lambda_0.6" -l 0.6
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.7 -bf "Data/BJ_Tabular1_Lambda.txt" -select 1 -s 1.0 -g 0.6 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Lambda_0.7" -l 0.7
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.8 -bf "Data/BJ_Tabular1_Lambda.txt" -select 1 -s 1.0 -g 0.6 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Lambda_0.8" -l 0.8
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.9 -bf "Data/BJ_Tabular1_Lambda.txt" -select 1 -s 1.0 -g 0.6 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Lambda_0.9" -l 0.9
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 1.0 -bf "Data/BJ_Tabular1_Lambda.txt" -select 1 -s 1.0 -g 0.6 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Lambda_1.0" -l 1.0
# 
./gnuplot.pl BJ_Tabular1_Default BJ_Tabular1_Lambda_0.0 BJ_Tabular1_Lambda_0.1 BJ_Tabular1_Lambda_0.2 BJ_Tabular1_Lambda_0.3 BJ_Tabular1_Lambda_0.4 BJ_Tabular1_Lambda_0.5 BJ_Tabular1_Lambda_0.6 BJ_Tabular1_Lambda_0.7 BJ_Tabular1_Lambda_0.8 BJ_Tabular1_Lambda_0.9 BJ_Tabular1_Lambda_1.0 | gnuplot
ps2pdf allplots.ps Data/BJ_Tabular1_Lambda.pdf
./gnuplotParam.pl Data/BJ_Tabular1_Lambda.txt "Blackjack ({/Symbol s}=1.0)" "{/Symbol l}" 0 | gnuplot
mv allplots.ps Data/BJ_Tabular1_Lambda.ps
# 
# #Gamma
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular1_Gamma.txt" -select 1 -s 1.0 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Gamma_0.0" -g 0.0
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.1 -bf "Data/BJ_Tabular1_Gamma.txt" -select 1 -s 1.0 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Gamma_0.1" -g 0.1
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.2 -bf "Data/BJ_Tabular1_Gamma.txt" -select 1 -s 1.0 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Gamma_0.2" -g 0.2
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.3 -bf "Data/BJ_Tabular1_Gamma.txt" -select 1 -s 1.0 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Gamma_0.3" -g 0.3
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.4 -bf "Data/BJ_Tabular1_Gamma.txt" -select 1 -s 1.0 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Gamma_0.4" -g 0.4
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.5 -bf "Data/BJ_Tabular1_Gamma.txt" -select 1 -s 1.0 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Gamma_0.5" -g 0.5
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.6 -bf "Data/BJ_Tabular1_Gamma.txt" -select 1 -s 1.0 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Gamma_0.6" -g 0.6
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.7 -bf "Data/BJ_Tabular1_Gamma.txt" -select 1 -s 1.0 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Gamma_0.7" -g 0.7
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.8 -bf "Data/BJ_Tabular1_Gamma.txt" -select 1 -s 1.0 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Gamma_0.8" -g 0.8
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.9 -bf "Data/BJ_Tabular1_Gamma.txt" -select 1 -s 1.0 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Gamma_0.9" -g 0.9
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 1.0 -bf "Data/BJ_Tabular1_Gamma.txt" -select 1 -s 1.0 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Gamma_1.0" -g 1.0
# 
./gnuplot.pl BJ_Tabular1_Default BJ_Tabular1_Gamma_0.0 BJ_Tabular1_Gamma_0.1 BJ_Tabular1_Gamma_0.2 BJ_Tabular1_Gamma_0.3 BJ_Tabular1_Gamma_0.4 BJ_Tabular1_Gamma_0.5 BJ_Tabular1_Gamma_0.6 BJ_Tabular1_Gamma_0.7 BJ_Tabular1_Gamma_0.8 BJ_Tabular1_Gamma_0.9 BJ_Tabular1_Gamma_1.0 | gnuplot
ps2pdf allplots.ps Data/BJ_Tabular1_Gamma.pdf
./gnuplotParam.pl Data/BJ_Tabular1_Gamma.txt "Blackjack ({/Symbol s}=1.0)" "{/Symbol g}" 0 | gnuplot
mv allplots.ps Data/BJ_Tabular1_Gamma.ps

#Sigma
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular_Sigma.txt" -select 1  -g 0.8 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_0.0" -s 0.0
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.1 -bf "Data/BJ_Tabular_Sigma.txt" -select 1  -g 0.8 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_0.1" -s 0.1
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.2 -bf "Data/BJ_Tabular_Sigma.txt" -select 1  -g 0.8 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_0.2" -s 0.2
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.3 -bf "Data/BJ_Tabular_Sigma.txt" -select 1  -g 0.8 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_0.3" -s 0.3
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.4 -bf "Data/BJ_Tabular_Sigma.txt" -select 1  -g 0.8 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_0.4" -s 0.4
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.5 -bf "Data/BJ_Tabular_Sigma.txt" -select 1  -g 0.8 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_0.5" -s 0.5
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.6 -bf "Data/BJ_Tabular_Sigma.txt" -select 1  -g 0.8 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_0.6" -s 0.6
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.7 -bf "Data/BJ_Tabular_Sigma.txt" -select 1  -g 0.8 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_0.7" -s 0.7
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.8 -bf "Data/BJ_Tabular_Sigma.txt" -select 1  -g 0.8 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_0.8" -s 0.8
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.9 -bf "Data/BJ_Tabular_Sigma.txt" -select 1  -g 0.8 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_0.9" -s 0.9
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 1.0 -bf "Data/BJ_Tabular_Sigma.txt" -select 1  -g 0.8 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Sigma_1.0" -s 1.0
  
./gnuplot.pl BJ_Tabular_Sigma_0.0 BJ_Tabular_Sigma_0.1 BJ_Tabular_Sigma_0.2  BJ_Tabular_Sigma_0.3 BJ_Tabular_Sigma_0.4 BJ_Tabular_Sigma_0.5 BJ_Tabular_Sigma_0.6 BJ_Tabular_Sigma_0.7 BJ_Tabular_Sigma_0.8 BJ_Tabular_Sigma_0.9 BJ_Tabular_Sigma_1.0 | gnuplot
ps2pdf allplots.ps Data/BJ_Tabular_Sigma.pdf
./gnuplotParam.pl Data/BJ_Tabular_Sigma.txt "Blackjack" "{/Symbol s}" 0 | gnuplot
mv allplots.ps Data/BJ_Tabular_Sigma.ps
#./BenchMainAgents.pl 100000 BJ_Tabular_Sigma_0.0 BJ_Tabular_Sigma_0.1 BJ_Tabular_Sigma_0.2  BJ_Tabular_Sigma_0.3 BJ_Tabular_Sigma_0.4 BJ_Tabular_Sigma_0.5 BJ_Tabular_Sigma_0.6 BJ_Tabular_Sigma_0.7 BJ_Tabular_Sigma_0.8 BJ_Tabular_Sigma_0.9 BJ_Tabular_Sigma_1.0
#mv allplots.ps Data/BJ_Tabular_Sigma_Offline.ps

#Sigma0
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular0_Sigma.txt" -select 1  -g 0.5 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Sigma_0.0" -s 0.0
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.1 -bf "Data/BJ_Tabular0_Sigma.txt" -select 1  -g 0.5 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Sigma_0.1" -s 0.1
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.2 -bf "Data/BJ_Tabular0_Sigma.txt" -select 1  -g 0.5 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Sigma_0.2" -s 0.2
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.3 -bf "Data/BJ_Tabular0_Sigma.txt" -select 1  -g 0.5 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Sigma_0.3" -s 0.3
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.4 -bf "Data/BJ_Tabular0_Sigma.txt" -select 1  -g 0.5 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Sigma_0.4" -s 0.4
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.5 -bf "Data/BJ_Tabular0_Sigma.txt" -select 1  -g 0.5 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Sigma_0.5" -s 0.5
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.6 -bf "Data/BJ_Tabular0_Sigma.txt" -select 1  -g 0.5 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Sigma_0.6" -s 0.6
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.7 -bf "Data/BJ_Tabular0_Sigma.txt" -select 1  -g 0.5 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Sigma_0.7" -s 0.7
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.8 -bf "Data/BJ_Tabular0_Sigma.txt" -select 1  -g 0.5 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Sigma_0.8" -s 0.8
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.9 -bf "Data/BJ_Tabular0_Sigma.txt" -select 1  -g 0.5 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Sigma_0.9" -s 0.9
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 1.0 -bf "Data/BJ_Tabular0_Sigma.txt" -select 1  -g 0.5 -l 0.2 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular0_Sigma_1.0" -s 1.0
  
./gnuplot.pl BJ_Tabular0_Sigma_0.0 BJ_Tabular0_Sigma_0.1 BJ_Tabular0_Sigma_0.2  BJ_Tabular0_Sigma_0.3 BJ_Tabular0_Sigma_0.4 BJ_Tabular0_Sigma_0.5 BJ_Tabular0_Sigma_0.6 BJ_Tabular0_Sigma_0.7 BJ_Tabular0_Sigma_0.8 BJ_Tabular0_Sigma_0.9 BJ_Tabular0_Sigma_1.0 | gnuplot
ps2pdf allplots.ps Data/BJ_Tabular0_Sigma.pdf
./gnuplotParam.pl Data/BJ_Tabular0_Sigma.txt "Blackjack" "{/Symbol s}" 0 | gnuplot
mv allplots.ps Data/BJ_Tabular0_Sigma.ps
#./BenchMainAgents.pl 100000 BJ_Tabular0_Sigma_0.0 BJ_Tabular0_Sigma_0.1 BJ_Tabular0_Sigma_0.2  BJ_Tabular0_Sigma_0.3 BJ_Tabular0_Sigma_0.4 BJ_Tabular0_Sigma_0.5 BJ_Tabular0_Sigma_0.6 BJ_Tabular0_Sigma_0.7 BJ_Tabular0_Sigma_0.8 BJ_Tabular0_Sigma_0.9 BJ_Tabular0_Sigma_1.0
#mv allplots.ps Data/BJ_Tabular0_Sigma_Offline.ps

#Sigma1
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular1_Sigma.txt" -select 1  -g 0.6 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Sigma_0.0" -s 0.0
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.1 -bf "Data/BJ_Tabular1_Sigma.txt" -select 1  -g 0.6 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Sigma_0.1" -s 0.1
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.2 -bf "Data/BJ_Tabular1_Sigma.txt" -select 1  -g 0.6 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Sigma_0.2" -s 0.2
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.3 -bf "Data/BJ_Tabular1_Sigma.txt" -select 1  -g 0.6 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Sigma_0.3" -s 0.3
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.4 -bf "Data/BJ_Tabular1_Sigma.txt" -select 1  -g 0.6 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Sigma_0.4" -s 0.4
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.5 -bf "Data/BJ_Tabular1_Sigma.txt" -select 1  -g 0.6 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Sigma_0.5" -s 0.5
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.6 -bf "Data/BJ_Tabular1_Sigma.txt" -select 1  -g 0.6 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Sigma_0.6" -s 0.6
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.7 -bf "Data/BJ_Tabular1_Sigma.txt" -select 1  -g 0.6 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Sigma_0.7" -s 0.7
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.8 -bf "Data/BJ_Tabular1_Sigma.txt" -select 1  -g 0.6 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Sigma_0.8" -s 0.8
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.9 -bf "Data/BJ_Tabular1_Sigma.txt" -select 1  -g 0.6 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Sigma_0.9" -s 0.9
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 1.0 -bf "Data/BJ_Tabular1_Sigma.txt" -select 1  -g 0.6 -l 0.3 -a 0.001 -e 0.001 -fa tabular -initial 1 -name "BJ_Tabular1_Sigma_1.0" -s 1.0
  
./gnuplot.pl BJ_Tabular1_Sigma_0.0 BJ_Tabular1_Sigma_0.1 BJ_Tabular1_Sigma_0.2  BJ_Tabular1_Sigma_0.3 BJ_Tabular1_Sigma_0.4 BJ_Tabular1_Sigma_0.5 BJ_Tabular1_Sigma_0.6 BJ_Tabular1_Sigma_0.7 BJ_Tabular1_Sigma_0.8 BJ_Tabular1_Sigma_0.9 BJ_Tabular1_Sigma_1.0 | gnuplot
ps2pdf allplots.ps Data/BJ_Tabular1_Sigma.pdf
./gnuplotParam.pl Data/BJ_Tabular1_Sigma.txt "Blackjack" "{/Symbol s}" 0 | gnuplot
mv allplots.ps Data/BJ_Tabular1_Sigma.ps
#./BenchMainAgents.pl 100000 BJ_Tabular1_Sigma_0.0 BJ_Tabular1_Sigma_0.1 BJ_Tabular1_Sigma_0.2  BJ_Tabular1_Sigma_0.3 BJ_Tabular1_Sigma_0.4 BJ_Tabular1_Sigma_0.5 BJ_Tabular1_Sigma_0.6 BJ_Tabular1_Sigma_0.7 BJ_Tabular1_Sigma_0.8 BJ_Tabular1_Sigma_0.9 BJ_Tabular1_Sigma_1.0
#mv allplots.ps Data/BJ_Tabular1_Sigma_Offline.ps

# #rehearsing
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 0.0 -bf "Data/BJ_Tabular_Rehearsing.txt" -select 1 -s 1 -g 0.6 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Rehearsing" -rehearse
# 
# ./gnuplot.pl BJ_Tabular_Default BJ_Tabular_Rehearsing | gnuplot
# ps2pdf allplots.ps Data/BJ_Tabular_Rehearsing.pdf
# 
# #tabu
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 100 -bf "Data/BJ_Tabular_Tabu.txt" -select 1 -s 1 -g 0.6 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Tabu_100" -tabu 100
./bj -q -te 10100000 -on 100000 -off 10000000 -bv 1000 -bf "Data/BJ_Tabular_Tabu.txt" -select 1 -s 1 -g 0.6 -l 0.6 -a 0.01 -e 0.1 -fa tabular -initial 1 -name "BJ_Tabular_Tabu_1000" -tabu 1000
# ./gnuplot.pl BJ_Tabular_Default BJ_Tabular_Tabu_100 BJ_Tabular_Tabu_1000 | gnuplot
# ps2pdf allplots.ps Data/BJ_Tabular_Tabu.pdf




# 
# ./gnuplotParam.pl Data/BJ_Tabular_Sigma.txt "Blackjack ({/Symbol s}=1.0)" "{/Symbol s}" 0 | gnuplot
# mv allplots.ps Data/BJ_Tabular_Sigma.ps
# ./gnuplotParam.pl Data/BJ_Tabular1_Gamma.txt "Blackjack ({/Symbol s}=1.0)" "{/Symbol g}" 0 | gnuplot
# mv allplots.ps Data/BJ_Tabular1_Gamma.ps
# ./gnuplotParam.pl Data/BJ_Tabular1_Lambda.txt "Blackjack ({/Symbol s}=1.0)" "{/Symbol l}" 0 | gnuplot
# mv allplots.ps Data/BJ_Tabular1_Lambda.ps
# ./gnuplotParam.pl Data/BJ_Tabular1_Epsilon.txt "Blackjack ({/Symbol s}=1.0)" "{/Symbol e}" 1 | gnuplot
# mv allplots.ps Data/BJ_Tabular1_Epsilon.ps
# ./gnuplotParam.pl Data/BJ_Tabular1_Alpha.txt "Blackjack ({/Symbol s}=1.0)" "{/Symbol a}" 1 | gnuplot
# mv allplots.ps Data/BJ_Tabular1_Alpha.ps
# ./gnuplotParam.pl Data/BJ_Tabular0_Gamma.txt "Blackjack ({/Symbol s}=0.0)" "{/Symbol g}" 0 | gnuplot
# mv allplots.ps Data/BJ_Tabular0_Gamma.ps
# ./gnuplotParam.pl Data/BJ_Tabular0_Lambda.txt "Blackjack ({/Symbol s}=0.0)" "{/Symbol l}" 0 | gnuplot
# mv allplots.ps Data/BJ_Tabular0_Lambda.ps
# ./gnuplotParam.pl Data/BJ_Tabular0_Epsilon.txt "Blackjack ({/Symbol s}=0.0)" "{/Symbol e}" 1 | gnuplot
# mv allplots.ps Data/BJ_Tabular0_Epsilon.ps
# ./gnuplotParam.pl Data/BJ_Tabular0_Alpha.txt "Blackjack ({/Symbol s}=0.0)" "{/Symbol a}" 1 | gnuplot
# mv allplots.ps Data/BJ_Tabular0_Alpha.ps
# ./gnuplotParam.pl Data/BJ_Tabular_Gamma.txt "Blackjack ({/Symbol s}=0.5)" "{/Symbol g}" 0 | gnuplot
# mv allplots.ps Data/BJ_Tabular_Gamma.ps
# ./gnuplotParam.pl Data/BJ_Tabular_Lambda.txt "Blackjack ({/Symbol s}=0.5)" "{/Symbol l}" 0 | gnuplot
# mv allplots.ps Data/BJ_Tabular_Lambda.ps
# ./gnuplotParam.pl Data/BJ_Tabular_Epsilon.txt "Blackjack ({/Symbol s}=0.5)" "{/Symbol e}" 1 | gnuplot
# mv allplots.ps Data/BJ_Tabular_Epsilon.ps
# ./gnuplotParam.pl Data/BJ_Tabular_Alpha.txt "Blackjack ({/Symbol s}=0.5)" "{/Symbol a}" 1 | gnuplot
# mv allplots.ps Data/BJ_Tabular_Alpha.ps
# 

# gv Data/BJ_Tabular_Sigma_Offline.ps &
# gv Data/BJ_Tabular0_Sigma_Offline.ps &
# gv Data/BJ_Tabular1_Sigma_Offline.ps &

#acroread Data/BJ_Tabular_*pdf&
