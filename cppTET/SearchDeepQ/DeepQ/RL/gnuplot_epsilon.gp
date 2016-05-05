
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

set yrange [0:100]
set xrange [0.000001:1]


set title "{/=18 Backgammon}"
set ylabel "{/=18 Average Win Percentage}"
set xlabel "{/=18 {/Symbol e}}"
set logscale x
plot  "Data/Bg_Cascade_Epsilon.txt" using 1:5 title "{/=18 Against random player}" w linespoints lt 1 lw 3, \
 "Data/Bg_Cascade_Epsilon.txt" using 1:4 title "{/=18 Against heuristic player}" w linespoints lt 2 lw 3
set yrange [-1:1]


set title "{/=18 Backgammon}"
set ylabel "{/=18 Average Episode Reward}"
set xlabel "{/=18 {/Symbol e}}"
set logscale x
plot  "Data/Bg_Cascade_Epsilon.txt" using 1:3 title "{/=18 Against random player}" w linespoints lt 1 lw 3, \
 "Data/Bg_Cascade_Epsilon.txt" using 1:2 title "{/=18 Against heuristic player}" w linespoints lt 2 lw 3
set output
set terminal x11
