./runbgcompetitive.sh -q -te 10000 -select 1 -s 0.4 -g 1.0 -l 0.4 -a 0.1 -e 0.001 -fa cascade -fann-layers 2 196 1 -bv 100  -name "Bg2_Cascade_Cache_Size_100" -cachesize 100 100 -cc 100
./runbgcompetitive.sh -q -te 10000 -select 1 -s 0.4 -g 1.0 -l 0.4 -a 0.1 -e 0.001 -fa cascade -fann-layers 2 196 1 -bv 400  -name "Bg2_Cascade_Cache_Size_400" -cachesize 400 400 -cc 100
./runbgcompetitive.sh -q -te 10000 -select 1 -s 0.4 -g 1.0 -l 0.4 -a 0.1 -e 0.001 -fa cascade -fann-layers 2 196 1 -bv 500  -name "Bg2_Cascade_Cache_Size_500" -cachesize 500 500 -cc 100
./runbgcompetitive.sh -q -te 10000 -select 1 -s 0.4 -g 1.0 -l 0.4 -a 0.1 -e 0.001 -fa cascade -fann-layers 2 196 1 -bv 750  -name "Bg2_Cascade_Cache_Size_750" -cachesize 750 750 -cc 100
./runbgcompetitive.sh -q -te 10000 -select 1 -s 0.4 -g 1.0 -l 0.4 -a 0.1 -e 0.001 -fa cascade -fann-layers 2 196 1 -bv 1000  -name "Bg2_Cascade_Cache_Size_1000" -cachesize 1000 1000 -cc 100
./runbgcompetitive.sh -q -te 10000 -select 1 -s 0.4 -g 1.0 -l 0.4 -a 0.1 -e 0.001 -fa cascade -fann-layers 2 196 1 -bv 2000  -name "Bg2_Cascade_Cache_Size_2000" -cachesize 2000 2000 -cc 100

./gnuplot.pl Bg2_Cascade_Cache_Size_100 Data/Bg2_Cascade_Cache_Size_400 Data/Bg2_Cascade_Cache_Size_500 Data/Bg2_Cascade_Cache_Size_750 Bg2_Cascade_Cache_Size_1000 Data/Bg2_Cascade_Cache_Size_2000 | gnuplot
ps2pdf allplots.ps Data/Bg2_Cascade_Cache_Size.pdf
./BenchBgAgents.pl 100 Data/Bg2_Cascade_Cache_Size.txt Bg2_Cascade_Cache_Size_100 Bg2_Cascade_Cache_Size_400 Bg2_Cascade_Cache_Size_500 Bg2_Cascade_Cache_Size_750 Bg2_Cascade_Cache_Size_1000 Bg2_Cascade_Cache_Size_2000
./gnuplotParamBg.pl Data/Bg2_Cascade_Cache_Size.txt "Cache Size" 0 | gnuplot
mv allplots.ps Data/Bg2_Cascade_Cache_Size.ps

