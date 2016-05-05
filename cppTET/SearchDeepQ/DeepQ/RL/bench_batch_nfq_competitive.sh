#!/bin/sh

#Lambda
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Lambda_0.0" -l 0.0
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Lambda_0.2" -l 0.2
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Lambda_0.4" -l 0.4
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Lambda_0.6" -l 0.6
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Lambda_0.8" -l 0.8
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Lambda_1.0" -l 1.0

./BenchAgents.pl 100 BG_Competitive_NFQ_Batch_Lambda_0.0 BG_Competitive_NFQ_Batch_Lambda_0.2 BG_Competitive_NFQ_Batch_Lambda_0.4 BG_Competitive_NFQ_Batch_Lambda_0.6 BG_Competitive_NFQ_Batch_Lambda_0.8 BG_Competitive_NFQ_Batch_Lambda_1.0
mv allplots.ps benchmarkdata/BG_Competitive_NFQ_Batch_Lambda.ps


exit;





























#Default (for this test)
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Default"
# ./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Lambda_0.0" -l 0.0
./BenchAgents.pl 100 BG_Competitive_NFQ_Batch_Default

#Lambda
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Lambda_0.0" -l 0.0
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Lambda_0.2" -l 0.2
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Lambda_0.4" -l 0.4
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Lambda_0.6" -l 0.6
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Lambda_0.8" -l 0.8
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Lambda_1.0" -l 1.0

./BenchAgents.pl 100 BG_Competitive_NFQ_Batch_Lambda_0.0 BG_Competitive_NFQ_Batch_Lambda_0.2 BG_Competitive_NFQ_Batch_Lambda_0.4 BG_Competitive_NFQ_Batch_Lambda_0.6 BG_Competitive_NFQ_Batch_Lambda_0.8 BG_Competitive_NFQ_Batch_Lambda_1.0
mv allplots.ps benchmarkdata/BG_Competitive_NFQ_Batch_Lambda.ps

#Alpha
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Alpha_0.0001" -a 0.0001
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Alpha_0.001" -a 0.001
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Alpha_0.01" -a 0.01
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Alpha_0.1" -a 0.1
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Alpha_0.2" -a 0.2
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Alpha_0.5" -a 0.5

./BenchAgents.pl 100 BG_Competitive_NFQ_Batch_Alpha_0.0001 BG_Competitive_NFQ_Batch_Alpha_0.001 BG_Competitive_NFQ_Batch_Alpha_0.01 BG_Competitive_NFQ_Batch_Alpha_0.1 BG_Competitive_NFQ_Batch_Alpha_0.2 BG_Competitive_NFQ_Batch_Alpha_0.5
mv allplots.ps benchmarkdata/BG_Competitive_NFQ_Batch_Alpha.ps

#Epsilon
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Epsilon_0.0" -e 0.0
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Epsilon_0.001" -e 0.001
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Epsilon_0.01" -e 0.01
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Epsilon_0.1" -e 0.1
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Epsilon_0.2" -e 0.2

./BenchAgents.pl 100 BG_Competitive_NFQ_Batch_Epsilon_0.0 BG_Competitive_NFQ_Batch_Epsilon_0.001 BG_Competitive_NFQ_Batch_Epsilon_0.01 BG_Competitive_NFQ_Batch_Epsilon_0.1 BG_Competitive_NFQ_Batch_Epsilon_0.2
mv allplots.ps benchmarkdata/BG_Competitive_NFQ_Batch_Epsilon.ps

#cache & cache commit
./runbgcompetitive.sh -q -te 3000 -select 1 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Cache_500_CC_1_Whole" -cachesize 500 500 -cc 1
./runbgcompetitive.sh -q -te 3000 -select 1 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Cache_1000_CC_1_Whole" -cachesize 1000 1000 -cc 1
./runbgcompetitive.sh -q -te 3000 -select 1 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Cache_2000_CC_5_Whole" -cachesize 2000 2000 -cc 5

./runbgcompetitive.sh -q -te 3000 -select 1 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Cache_500_CC_10_Whole" -cachesize 500 500 -cc 10
./runbgcompetitive.sh -q -te 3000 -select 1 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Cache_1000_CC_10_Whole" -cachesize 1000 1000 -cc 10
./runbgcompetitive.sh -q -te 3000 -select 1 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Cache_2000_CC_10_Whole" -cachesize 2000 2000 -cc 10

./runbgcompetitive.sh -q -te 3000 -select 1 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Cache_500_CC_100_Whole" -cachesize 500 500 -cc 100
./runbgcompetitive.sh -q -te 3000 -select 1 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Cache_1000_CC_100_Whole" -cachesize 1000 1000 -cc 100
./runbgcompetitive.sh -q -te 3000 -select 1 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Cache_2000_CC_100_Whole" -cachesize 2000 2000 -cc 100

./BenchAgents.pl 100 BG_Competitive_NFQ_Batch_Cache_500_CC_1_Whole BG_Competitive_NFQ_Batch_Cache_1000_CC_1_Whole BG_Competitive_NFQ_Batch_Cache_2000_CC_5_Whole BG_Competitive_NFQ_Batch_Cache_500_CC_10_Whole BG_Competitive_NFQ_Batch_Cache_1000_CC_10_Whole BG_Competitive_NFQ_Batch_Cache_2000_CC_10_Whole BG_Competitive_NFQ_Batch_Cache_500_CC_100_Whole BG_Competitive_NFQ_Batch_Cache_1000_CC_100_Whole BG_Competitive_NFQ_Batch_Cache_2000_CC_100_Whole
mv allplots.ps benchmarkdata/BG_Competitive_NFQ_Batch_Cache_Whole.ps

#Gamma
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Gamma_0.0" -g 0.0
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Gamma_0.2" -g 0.2
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Gamma_0.4" -g 0.4
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Gamma_0.6" -g 0.6
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Gamma_0.8" -g 0.8
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Gamma_1.0" -g 1.0

./BenchAgents.pl 100 BG_Competitive_NFQ_Batch_Gamma_0.0 BG_Competitive_NFQ_Batch_Gamma_0.2 BG_Competitive_NFQ_Batch_Gamma_0.4 BG_Competitive_NFQ_Batch_Gamma_0.6 BG_Competitive_NFQ_Batch_Gamma_0.8 BG_Competitive_NFQ_Batch_Gamma_1.0
mv allplots.ps benchmarkdata/BG_Competitive_NFQ_Batch_Gamma.ps

#Sigma
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Sigma_0.0" -s 0.0
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Sigma_0.2" -s 0.2
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Sigma_0.4" -s 0.4
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Sigma_0.6" -s 0.6
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Sigma_0.8" -s 0.8
./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Sigma_1.0" -s 1.0

./BenchAgents.pl 100 BG_Competitive_NFQ_Batch_Sigma_0.0 BG_Competitive_NFQ_Batch_Sigma_0.2 BG_Competitive_NFQ_Batch_Sigma_0.4 BG_Competitive_NFQ_Batch_Sigma_0.6 BG_Competitive_NFQ_Batch_Sigma_0.8 BG_Competitive_NFQ_Batch_Sigma_1.0
mv allplots.ps benchmarkdata/BG_Competitive_NFQ_Batch_Sigma.ps

#tabu
# ./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Tabu_100" -tabu 100
# ./runbgcompetitive.sh -q -te 3000 -select 1  -cachesize 1000 1000 -cc 10 -s 1 -a 0.2 -e 0.001 -fa batch -nfq -fann-layers 3 196 40 1 -name "BG_Competitive_NFQ_Batch_Tabu_1000" -tabu 1000

# ./BenchAgents.pl 100 BG_Competitive_NFQ_Batch_Tabu_100 BG_Competitive_NFQ_Batch_Tabu_1000
# mv allplots.ps benchmarkdata/BG_Competitive_NFQ_Batch_Tabu.ps

psselect 17,28 benchmarkdata/BG_Competitive_NFQ_Batch_Alpha.ps benchmarkdata/BG_Competitive_NFQ_Batch_Alpha.select.ps
psselect 17,28 benchmarkdata/BG_Competitive_NFQ_Batch_Cache_Whole.ps benchmarkdata/BG_Competitive_NFQ_Batch_Cache_Whole.select.ps
psselect 17,28 benchmarkdata/BG_Competitive_NFQ_Batch_Epsilon.ps benchmarkdata/BG_Competitive_NFQ_Batch_Epsilon.select.ps
psselect 17,28 benchmarkdata/BG_Competitive_NFQ_Batch_Lambda.ps benchmarkdata/BG_Competitive_NFQ_Batch_Lambda.select.ps
psselect 17,28 benchmarkdata/BG_Competitive_NFQ_Batch_Gamma.ps benchmarkdata/BG_Competitive_NFQ_Batch_Lambda.select.ps
psselect 17,28 benchmarkdata/BG_Competitive_NFQ_Batch_Sigma.ps benchmarkdata/BG_Competitive_NFQ_Batch_Sigma.select.ps
# psselect 17,28 benchmarkdata/BG_Competitive_NFQ_Batch_Tabu.ps benchmarkdata/BG_Competitive_NFQ_Batch_Tabu.select.ps
psmerge -obenchmarkdata/BG_Competitive_NFQ_Batch.select.ps benchmarkdata/BG_Competitive_NFQ_Batch_*.select.ps
