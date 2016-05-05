#!/bin/sh

./runbg.sh -q -te 2000 -ge 101 -fa fann -fann-layers 3 196 40 1 -nocache -name "BG_Random_Incremental_Lambda_0.0_Sigma_0.5_Gamma_1.0_Rehearse" -s 0.5 -l 0 -g 1.0 -rehearse
./runbg.sh -q -te 2000 -ge 101 -fa fann -fann-layers 3 196 40 1 -nocache -name "BG_Random_Incremental_Lambda_0.0_Sigma_0.5_Gamma_1.0_NoRehearse" -s 0.5 -l 0 -g 1.0
