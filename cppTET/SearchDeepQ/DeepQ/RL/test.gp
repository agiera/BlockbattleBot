
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

set xlabel "{/=18 Average Episode Reward}"
set yrange [-300:-100]
set ytics 20

set title "{/=18 Mountain Car}"
set ylabel "{/=18 Average Episode Reward}"
set xlabel "{/=18 {/Symbol a}}"
set logscale x
plot  "Data/Car_Cascade_NoWhole_Alpha.txt" using 1:4 title "{/=18 On-line Performance}" w linespoints lt 1 lw 3, \
 "Data/Car_Cascade_NoWhole_Alpha.txt" using 1:9 title "{/=18 Off-line Performance}" w linespoints lt 2 lw 3

set title "{/=18 Mountain Car}"
set ylabel "{/=18 Average Number of Steps}"
set xlabel "{/=18 {/Symbol a}}"
set logscale x
plot  "Data/Car_Cascade_NoWhole_Alpha.txt" using 1:2 title "{/=18 On-line Performance}" w linespoints lt 1 lw 3, \
 "Data/Car_Cascade_NoWhole_Alpha.txt" using 1:10 title "{/=18 Off-line Performance}" w linespoints lt 2 lw 3

set title "{/=18 Mountain Car}"
set ylabel "{/=18 Average Reward per Step}"
set xlabel "{/=18 {/Symbol a}}"
set logscale x
plot  "Data/Car_Cascade_NoWhole_Alpha.txt" using 1:3 title "{/=18 On-line Performance}" w linespoints lt 1 lw 3, \
 "Data/Car_Cascade_NoWhole_Alpha.txt" using 1:11 title "{/=18 Off-line Performance}" w linespoints lt 2 lw 3
set output
set terminal x11
