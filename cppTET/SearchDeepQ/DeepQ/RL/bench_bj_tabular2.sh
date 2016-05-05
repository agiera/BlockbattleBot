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
