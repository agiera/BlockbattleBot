
set terminal postscript color solid
set output "allplots.ps"

set style line 1 lt 1 lw 1
set style line 2 lt 2 lw 1
set style line 3 lt 3 lw 1
set style line 4 lt 4 lw 1
set style line 5 lt 5 lw 1
set style line 6 lt 6 lw 1
set style line 7 lt 7 lw 1
set style line 8 lt 8 lw 1
set style line 9 lt 9 lw 1

set grid

set xlabel "Number of episodes"


set title "Cumulative Reward"
set ylabel "Cumulative Reward"
plot  "benchmarkdata/Cart_Batch_Sigma_0.0/benchmark_0_1.out" using 1:6 title "Cart_Batch_Sigma_0.0" w l lt 1 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.1/benchmark_0_1.out" using 1:6 title "Cart_Batch_Sigma_0.1" w l lt 2 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.2/benchmark_0_1.out" using 1:6 title "Cart_Batch_Sigma_0.2" w l lt 3 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.3/benchmark_0_1.out" using 1:6 title "Cart_Batch_Sigma_0.3" w l lt 4 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.4/benchmark_0_1.out" using 1:6 title "Cart_Batch_Sigma_0.4" w l lt 5 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.5/benchmark_0_1.out" using 1:6 title "Cart_Batch_Sigma_0.5" w l lt 6 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.6/benchmark_0_1.out" using 1:6 title "Cart_Batch_Sigma_0.6" w l lt 7 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.7/benchmark_0_1.out" using 1:6 title "Cart_Batch_Sigma_0.7" w l lt 8 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.8/benchmark_0_1.out" using 1:6 title "Cart_Batch_Sigma_0.8" w l lt 9 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.9/benchmark_0_1.out" using 1:6 title "Cart_Batch_Sigma_0.9" w l lt 1 lw 2, \
 "benchmarkdata/Cart_Batch_Sigma_1.0/benchmark_0_1.out" using 1:6 title "Cart_Batch_Sigma_1.0" w l lt 2 lw 2

set title "Average Reward"
set ylabel "Average Reward"
plot  "benchmarkdata/Cart_Batch_Sigma_0.0/benchmark_0_1.out" using 1:11 title "Cart_Batch_Sigma_0.0" w l lt 1 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.1/benchmark_0_1.out" using 1:11 title "Cart_Batch_Sigma_0.1" w l lt 2 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.2/benchmark_0_1.out" using 1:11 title "Cart_Batch_Sigma_0.2" w l lt 3 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.3/benchmark_0_1.out" using 1:11 title "Cart_Batch_Sigma_0.3" w l lt 4 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.4/benchmark_0_1.out" using 1:11 title "Cart_Batch_Sigma_0.4" w l lt 5 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.5/benchmark_0_1.out" using 1:11 title "Cart_Batch_Sigma_0.5" w l lt 6 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.6/benchmark_0_1.out" using 1:11 title "Cart_Batch_Sigma_0.6" w l lt 7 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.7/benchmark_0_1.out" using 1:11 title "Cart_Batch_Sigma_0.7" w l lt 8 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.8/benchmark_0_1.out" using 1:11 title "Cart_Batch_Sigma_0.8" w l lt 9 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.9/benchmark_0_1.out" using 1:11 title "Cart_Batch_Sigma_0.9" w l lt 1 lw 2, \
 "benchmarkdata/Cart_Batch_Sigma_1.0/benchmark_0_1.out" using 1:11 title "Cart_Batch_Sigma_1.0" w l lt 2 lw 2

set title "Episode Reward"
set ylabel "Episode Reward"
plot  "benchmarkdata/Cart_Batch_Sigma_0.0/benchmark_0_1.out" using 1:2 title "Cart_Batch_Sigma_0.0" w l lt 1 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.1/benchmark_0_1.out" using 1:2 title "Cart_Batch_Sigma_0.1" w l lt 2 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.2/benchmark_0_1.out" using 1:2 title "Cart_Batch_Sigma_0.2" w l lt 3 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.3/benchmark_0_1.out" using 1:2 title "Cart_Batch_Sigma_0.3" w l lt 4 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.4/benchmark_0_1.out" using 1:2 title "Cart_Batch_Sigma_0.4" w l lt 5 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.5/benchmark_0_1.out" using 1:2 title "Cart_Batch_Sigma_0.5" w l lt 6 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.6/benchmark_0_1.out" using 1:2 title "Cart_Batch_Sigma_0.6" w l lt 7 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.7/benchmark_0_1.out" using 1:2 title "Cart_Batch_Sigma_0.7" w l lt 8 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.8/benchmark_0_1.out" using 1:2 title "Cart_Batch_Sigma_0.8" w l lt 9 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.9/benchmark_0_1.out" using 1:2 title "Cart_Batch_Sigma_0.9" w l lt 1 lw 2, \
 "benchmarkdata/Cart_Batch_Sigma_1.0/benchmark_0_1.out" using 1:2 title "Cart_Batch_Sigma_1.0" w l lt 2 lw 2

set title "Average Step Reward"
set ylabel "Average Step Reward"
plot  "benchmarkdata/Cart_Batch_Sigma_0.0/benchmark_0_1.out" using 1:3 title "Cart_Batch_Sigma_0.0" w l lt 1 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.1/benchmark_0_1.out" using 1:3 title "Cart_Batch_Sigma_0.1" w l lt 2 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.2/benchmark_0_1.out" using 1:3 title "Cart_Batch_Sigma_0.2" w l lt 3 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.3/benchmark_0_1.out" using 1:3 title "Cart_Batch_Sigma_0.3" w l lt 4 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.4/benchmark_0_1.out" using 1:3 title "Cart_Batch_Sigma_0.4" w l lt 5 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.5/benchmark_0_1.out" using 1:3 title "Cart_Batch_Sigma_0.5" w l lt 6 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.6/benchmark_0_1.out" using 1:3 title "Cart_Batch_Sigma_0.6" w l lt 7 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.7/benchmark_0_1.out" using 1:3 title "Cart_Batch_Sigma_0.7" w l lt 8 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.8/benchmark_0_1.out" using 1:3 title "Cart_Batch_Sigma_0.8" w l lt 9 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.9/benchmark_0_1.out" using 1:3 title "Cart_Batch_Sigma_0.9" w l lt 1 lw 2, \
 "benchmarkdata/Cart_Batch_Sigma_1.0/benchmark_0_1.out" using 1:3 title "Cart_Batch_Sigma_1.0" w l lt 2 lw 2

set title "Number of Installed Candidate Neurons"
set ylabel "Number of Installed Candidate Neurons"
plot  "benchmarkdata/Cart_Batch_Sigma_0.0/benchmark_0_1.out" using 1:4 title "Cart_Batch_Sigma_0.0" w l lt 1 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.1/benchmark_0_1.out" using 1:4 title "Cart_Batch_Sigma_0.1" w l lt 2 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.2/benchmark_0_1.out" using 1:4 title "Cart_Batch_Sigma_0.2" w l lt 3 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.3/benchmark_0_1.out" using 1:4 title "Cart_Batch_Sigma_0.3" w l lt 4 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.4/benchmark_0_1.out" using 1:4 title "Cart_Batch_Sigma_0.4" w l lt 5 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.5/benchmark_0_1.out" using 1:4 title "Cart_Batch_Sigma_0.5" w l lt 6 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.6/benchmark_0_1.out" using 1:4 title "Cart_Batch_Sigma_0.6" w l lt 7 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.7/benchmark_0_1.out" using 1:4 title "Cart_Batch_Sigma_0.7" w l lt 8 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.8/benchmark_0_1.out" using 1:4 title "Cart_Batch_Sigma_0.8" w l lt 9 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.9/benchmark_0_1.out" using 1:4 title "Cart_Batch_Sigma_0.9" w l lt 1 lw 2, \
 "benchmarkdata/Cart_Batch_Sigma_1.0/benchmark_0_1.out" using 1:4 title "Cart_Batch_Sigma_1.0" w l lt 2 lw 2

set title "Delta"
set ylabel "Average Delta for Episode"
plot  "benchmarkdata/Cart_Batch_Sigma_0.0/benchmark_0_1.out" using 1:5 title "Cart_Batch_Sigma_0.0" w l lt 1 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.1/benchmark_0_1.out" using 1:5 title "Cart_Batch_Sigma_0.1" w l lt 2 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.2/benchmark_0_1.out" using 1:5 title "Cart_Batch_Sigma_0.2" w l lt 3 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.3/benchmark_0_1.out" using 1:5 title "Cart_Batch_Sigma_0.3" w l lt 4 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.4/benchmark_0_1.out" using 1:5 title "Cart_Batch_Sigma_0.4" w l lt 5 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.5/benchmark_0_1.out" using 1:5 title "Cart_Batch_Sigma_0.5" w l lt 6 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.6/benchmark_0_1.out" using 1:5 title "Cart_Batch_Sigma_0.6" w l lt 7 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.7/benchmark_0_1.out" using 1:5 title "Cart_Batch_Sigma_0.7" w l lt 8 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.8/benchmark_0_1.out" using 1:5 title "Cart_Batch_Sigma_0.8" w l lt 9 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.9/benchmark_0_1.out" using 1:5 title "Cart_Batch_Sigma_0.9" w l lt 1 lw 2, \
 "benchmarkdata/Cart_Batch_Sigma_1.0/benchmark_0_1.out" using 1:5 title "Cart_Batch_Sigma_1.0" w l lt 2 lw 2

set title "Number of Steps Per Episode"
set ylabel "Number of Steps Per Episode"
plot  "benchmarkdata/Cart_Batch_Sigma_0.0/benchmark_0_1.out" using 1:7 title "Cart_Batch_Sigma_0.0" w l lt 1 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.1/benchmark_0_1.out" using 1:7 title "Cart_Batch_Sigma_0.1" w l lt 2 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.2/benchmark_0_1.out" using 1:7 title "Cart_Batch_Sigma_0.2" w l lt 3 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.3/benchmark_0_1.out" using 1:7 title "Cart_Batch_Sigma_0.3" w l lt 4 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.4/benchmark_0_1.out" using 1:7 title "Cart_Batch_Sigma_0.4" w l lt 5 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.5/benchmark_0_1.out" using 1:7 title "Cart_Batch_Sigma_0.5" w l lt 6 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.6/benchmark_0_1.out" using 1:7 title "Cart_Batch_Sigma_0.6" w l lt 7 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.7/benchmark_0_1.out" using 1:7 title "Cart_Batch_Sigma_0.7" w l lt 8 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.8/benchmark_0_1.out" using 1:7 title "Cart_Batch_Sigma_0.8" w l lt 9 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.9/benchmark_0_1.out" using 1:7 title "Cart_Batch_Sigma_0.9" w l lt 1 lw 2, \
 "benchmarkdata/Cart_Batch_Sigma_1.0/benchmark_0_1.out" using 1:7 title "Cart_Batch_Sigma_1.0" w l lt 2 lw 2

set title "Number of Wins"
set ylabel "Number of Wins"
plot  "benchmarkdata/Cart_Batch_Sigma_0.0/benchmark_0_1.out" using 1:8 title "Cart_Batch_Sigma_0.0" w l lt 1 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.1/benchmark_0_1.out" using 1:8 title "Cart_Batch_Sigma_0.1" w l lt 2 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.2/benchmark_0_1.out" using 1:8 title "Cart_Batch_Sigma_0.2" w l lt 3 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.3/benchmark_0_1.out" using 1:8 title "Cart_Batch_Sigma_0.3" w l lt 4 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.4/benchmark_0_1.out" using 1:8 title "Cart_Batch_Sigma_0.4" w l lt 5 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.5/benchmark_0_1.out" using 1:8 title "Cart_Batch_Sigma_0.5" w l lt 6 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.6/benchmark_0_1.out" using 1:8 title "Cart_Batch_Sigma_0.6" w l lt 7 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.7/benchmark_0_1.out" using 1:8 title "Cart_Batch_Sigma_0.7" w l lt 8 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.8/benchmark_0_1.out" using 1:8 title "Cart_Batch_Sigma_0.8" w l lt 9 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.9/benchmark_0_1.out" using 1:8 title "Cart_Batch_Sigma_0.9" w l lt 1 lw 2, \
 "benchmarkdata/Cart_Batch_Sigma_1.0/benchmark_0_1.out" using 1:8 title "Cart_Batch_Sigma_1.0" w l lt 2 lw 2

set title "MSE"
set ylabel "MSE"
plot  "benchmarkdata/Cart_Batch_Sigma_0.0/benchmark_0_1.out" using 1:9 title "Cart_Batch_Sigma_0.0" w l lt 1 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.1/benchmark_0_1.out" using 1:9 title "Cart_Batch_Sigma_0.1" w l lt 2 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.2/benchmark_0_1.out" using 1:9 title "Cart_Batch_Sigma_0.2" w l lt 3 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.3/benchmark_0_1.out" using 1:9 title "Cart_Batch_Sigma_0.3" w l lt 4 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.4/benchmark_0_1.out" using 1:9 title "Cart_Batch_Sigma_0.4" w l lt 5 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.5/benchmark_0_1.out" using 1:9 title "Cart_Batch_Sigma_0.5" w l lt 6 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.6/benchmark_0_1.out" using 1:9 title "Cart_Batch_Sigma_0.6" w l lt 7 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.7/benchmark_0_1.out" using 1:9 title "Cart_Batch_Sigma_0.7" w l lt 8 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.8/benchmark_0_1.out" using 1:9 title "Cart_Batch_Sigma_0.8" w l lt 9 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.9/benchmark_0_1.out" using 1:9 title "Cart_Batch_Sigma_0.9" w l lt 1 lw 2, \
 "benchmarkdata/Cart_Batch_Sigma_1.0/benchmark_0_1.out" using 1:9 title "Cart_Batch_Sigma_1.0" w l lt 2 lw 2

set title "Portion of explorative steps"
set ylabel "Portion of explorative steps"
plot  "benchmarkdata/Cart_Batch_Sigma_0.0/benchmark_0_1.out" using 1:10 title "Cart_Batch_Sigma_0.0" w l lt 1 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.1/benchmark_0_1.out" using 1:10 title "Cart_Batch_Sigma_0.1" w l lt 2 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.2/benchmark_0_1.out" using 1:10 title "Cart_Batch_Sigma_0.2" w l lt 3 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.3/benchmark_0_1.out" using 1:10 title "Cart_Batch_Sigma_0.3" w l lt 4 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.4/benchmark_0_1.out" using 1:10 title "Cart_Batch_Sigma_0.4" w l lt 5 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.5/benchmark_0_1.out" using 1:10 title "Cart_Batch_Sigma_0.5" w l lt 6 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.6/benchmark_0_1.out" using 1:10 title "Cart_Batch_Sigma_0.6" w l lt 7 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.7/benchmark_0_1.out" using 1:10 title "Cart_Batch_Sigma_0.7" w l lt 8 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.8/benchmark_0_1.out" using 1:10 title "Cart_Batch_Sigma_0.8" w l lt 9 lw 1, \
 "benchmarkdata/Cart_Batch_Sigma_0.9/benchmark_0_1.out" using 1:10 title "Cart_Batch_Sigma_0.9" w l lt 1 lw 2, \
 "benchmarkdata/Cart_Batch_Sigma_1.0/benchmark_0_1.out" using 1:10 title "Cart_Batch_Sigma_1.0" w l lt 2 lw 2
set output
set terminal x11
