#!/bin/sh

echo "" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt
echo "Lambda 0.0" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt

./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.0" -g 0.0
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.1" -g 0.1
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.2" -g 0.2
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.3" -g 0.3
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.4" -g 0.4
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.5" -g 0.5
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.6" -g 0.6
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.7" -g 0.7
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.8" -g 0.8
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.9" -g 0.9
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 1.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_1.0" -g 1.0

echo "" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt
echo "Lambda 0.1" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt

./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.1 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.0" -g 0.0
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.1 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.1" -g 0.1
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.1 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.2" -g 0.2
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.1 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.3" -g 0.3
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.1 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.4" -g 0.4
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.1 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.5" -g 0.5
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.1 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.6" -g 0.6
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.1 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.7" -g 0.7
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.1 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.8" -g 0.8
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.1 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.9" -g 0.9
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.1 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 1.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_1.0" -g 1.0

echo "" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt
echo "Lambda 0.2" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt

./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.2 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.0" -g 0.0
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.2 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.1" -g 0.1
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.2 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.2" -g 0.2
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.2 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.3" -g 0.3
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.2 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.4" -g 0.4
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.2 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.5" -g 0.5
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.2 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.6" -g 0.6
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.2 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.7" -g 0.7
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.2 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.8" -g 0.8
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.2 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.9" -g 0.9
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.2 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 1.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_1.0" -g 1.0

echo "" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt
echo "Lambda 0.3" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt

./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.3 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.0" -g 0.0
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.3 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.1" -g 0.1
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.3 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.2" -g 0.2
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.3 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.3" -g 0.3
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.3 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.4" -g 0.4
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.3 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.5" -g 0.5
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.3 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.6" -g 0.6
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.3 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.7" -g 0.7
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.3 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.8" -g 0.8
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.3 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.9" -g 0.9
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.3 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 1.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_1.0" -g 1.0

echo "" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt
echo "Lambda 0.4" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt

./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.4 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.0" -g 0.0
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.4 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.1" -g 0.1
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.4 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.2" -g 0.2
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.4 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.3" -g 0.3
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.4 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.4" -g 0.4
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.4 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.5" -g 0.5
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.4 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.6" -g 0.6
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.4 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.7" -g 0.7
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.4 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.8" -g 0.8
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.4 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.9" -g 0.9
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.4 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 1.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_1.0" -g 1.0

echo "" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt
echo "Lambda 0.5" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt

./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.5 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.0" -g 0.0
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.5 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.1" -g 0.1
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.5 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.2" -g 0.2
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.5 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.3" -g 0.3
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.5 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.4" -g 0.4
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.5 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.5" -g 0.5
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.5 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.6" -g 0.6
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.5 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.7" -g 0.7
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.5 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.8" -g 0.8
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.5 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.9" -g 0.9
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.5 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 1.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_1.0" -g 1.0

echo "" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt
echo "Lambda 0.6" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt

./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.6 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.0" -g 0.0
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.6 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.1" -g 0.1
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.6 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.2" -g 0.2
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.6 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.3" -g 0.3
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.6 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.4" -g 0.4
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.6 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.5" -g 0.5
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.6 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.6" -g 0.6
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.6 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.7" -g 0.7
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.6 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.8" -g 0.8
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.6 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.9" -g 0.9
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.6 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 1.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_1.0" -g 1.0

echo "" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt
echo "Lambda 0.7" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt

./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.7 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.0" -g 0.0
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.7 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.1" -g 0.1
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.7 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.2" -g 0.2
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.7 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.3" -g 0.3
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.7 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.4" -g 0.4
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.7 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.5" -g 0.5
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.7 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.6" -g 0.6
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.7 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.7" -g 0.7
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.7 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.8" -g 0.8
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.7 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.9" -g 0.9
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.7 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 1.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_1.0" -g 1.0

echo "" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt
echo "Lambda 0.8" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt

./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.8 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.0" -g 0.0
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.8 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.1" -g 0.1
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.8 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.2" -g 0.2
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.8 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.3" -g 0.3
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.8 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.4" -g 0.4
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.8 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.5" -g 0.5
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.8 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.6" -g 0.6
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.8 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.7" -g 0.7
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.8 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.8" -g 0.8
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.8 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.9" -g 0.9
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.8 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 1.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_1.0" -g 1.0

echo "" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt
echo "Lambda 0.9" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt

./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.9 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.0" -g 0.0
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.9 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.1" -g 0.1
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.9 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.2" -g 0.2
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.9 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.3" -g 0.3
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.9 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.4" -g 0.4
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.9 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.5" -g 0.5
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.9 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.6" -g 0.6
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.9 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.7" -g 0.7
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.9 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.8" -g 0.8
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.9 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.9" -g 0.9
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 0.9 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 1.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_1.0" -g 1.0

echo "" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt
echo "Lambda 1.0" >> benchmarkdata/Car_Batch_Gamma_Lambda.txt

./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 1.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.0" -g 0.0
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 1.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.1 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.1" -g 0.1
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 1.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.2 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.2" -g 0.2
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 1.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.3 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.3" -g 0.3
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 1.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.4 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.4" -g 0.4
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 1.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.5 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.5" -g 0.5
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 1.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.6 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.6" -g 0.6
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 1.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.7 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.7" -g 0.7
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 1.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.8 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.8" -g 0.8
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 1.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 0.9 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_0.9" -g 0.9
./car -q -te 11000 -on 10000 -off 10000 -select 1 -cachesize 500 500 -cc 10 -s 1.0 -l 1.0 -a 0.1 -e 0.2 -fa batch -fann-layers 3 5 20 1 -bv 1.0 -bf "benchmarkdata/Car_Batch_Gamma_Lambda.txt" -name "Car_Batch_Gamma_Lambda_1.0" -g 1.0

#./gnuplot.pl Car_Batch_Gamma_Lambda_0.0 Car_Batch_Gamma_Lambda_0.1 Car_Batch_Gamma_Lambda_0.2 Car_Batch_Gamma_Lambda_0.3 Car_Batch_Gamma_Lambda_0.4 Car_Batch_Gamma_Lambda_0.5 Car_Batch_Gamma_Lambda_0.6 Car_Batch_Gamma_Lambda_0.7 Car_Batch_Gamma_Lambda_0.8 Car_Batch_Gamma_Lambda_0.9 Car_Batch_Gamma_Lambda_1.0 | gnuplot
#ps2pdf allplots.ps benchmarkdata/Car_Batch_Gamma_Lambda.pdf
#./gnuplotParam.pl benchmarkdata/Car_Batch_Gamma_Lambda.txt "Mountain Car" "{/Symbol g} {/Symbol l}" 0 | gnuplot
#mv allplots.ps benchmarkdata/Car_Batch_Gamma_Lambda.ps
