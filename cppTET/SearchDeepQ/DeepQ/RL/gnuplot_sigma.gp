
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


set ytics nomirror
set y2tics 0, 10
set y2range [0:130]
set yrange [0:300]

set title "Details of episode 6000 to 8000"
set ylabel "Number of Steps Per Episode"
set y2label "MSE"
plot  "benchmarkdata/Cart_Batch_Sigma_0.4_Part/benchmark_0_1.out" using 1:7 title "Number of Steps Per Episode" w l lt 1 lw 1 axis x1y1, \
      "benchmarkdata/Cart_Batch_Sigma_0.4_Part/benchmark_0_1.out" using 1:9 title "MSE" w l lt 2 lw 1 axis x1y2

set title "MSE"
set ylabel "MSE"

set output
set terminal x11
