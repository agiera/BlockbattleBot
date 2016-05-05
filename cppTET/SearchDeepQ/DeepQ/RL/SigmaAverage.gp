
set terminal postscript color solid enhanced
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

set xrange [-0.025:1.025]
set yrange [-1000:200]

set xlabel "{/=18 Average Episode Reward}"

set title "{/=18 Cart Pole}"
set ylabel "{/=18 Average Episode Reward}"
set xlabel "{/=18 {/Symbol s}}"
unset logscale x

set output "cart-batch-on-line-avg-perf.ps"
plot  "benchmarkdata/SigmaAverageData.txt" using 1:4:2:3 title "{/=18 On-line Performance}" w errorbars lt 1 lw 3, \
      "benchmarkdata/SigmaAverageData.txt" using 1:4 notitle smooth csplines lt 1 lw 3

set output "cart-batch-off-line-avg-perf.ps"
plot "benchmarkdata/SigmaAverageData.txt" using 1:10:8:9 title "{/=18 Off-line Performance}" w errorbars lt 2 lw 3, \
     "benchmarkdata/SigmaAverageData.txt" using 1:10 notitle smooth csplines lt 2 lw 3

set yrange [0:300]
     
set title "{/=18 Cart Pole}"
set ylabel "{/=18 Average Number of Steps}"
set xlabel "{/=18 {/Symbol s}}"
unset logscale x

set output "cart-batch-on-line-avg-step.ps"
plot  "benchmarkdata/SigmaAverageData.txt" using 1:7:5:6 title "{/=18 On-line Number of Steps}" w errorbars lt 1 lw 3, \
      "benchmarkdata/SigmaAverageData.txt" using 1:7 notitle smooth csplines lt 1 lw 3


set output "cart-batch-off-line-avg-step.ps"
plot "benchmarkdata/SigmaAverageData.txt" using 1:13:11:12 title "{/=18 Off-line Number of Steps}" w errorbars lt 2 lw 3, \
     "benchmarkdata/SigmaAverageData.txt" using 1:13 notitle smooth csplines lt 2 lw 3

set output
set terminal x11
