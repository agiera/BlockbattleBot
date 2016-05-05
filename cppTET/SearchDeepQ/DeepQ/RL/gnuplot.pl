#!/usr/bin/perl

print '
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
';


sub print_plot_line 
{
  local($filename, $title, $row, $last) = @_;

  print " \"$filename\" using 1:$row title \"$title\" w l lt $linestyle lw $width";
  if(!$last)
  {
      print ", \\\n";
  }

  if($linestyle == 9)
  {
  	$linestyle = 1;
  	$width = ($width == 1) ? 2 : 1;
  }
  else
  {
  	$linestyle++;
  }
}

sub print_plot 
{
	local($file, $col, $ylabel, $title) = @_;
	
	$width = 1;
	$linestyle = 1;

	if(-e "benchmarkdata/".$ARGV[0]."/$file")
	{
		print "\n\nset title \"$title\"\n";
		print "set ylabel \"$ylabel\"\n";
		print "plot ";
		foreach $argnum (0 .. $#ARGV) 
		{
			$fullfile = "benchmarkdata/".$ARGV[$argnum]."/$file";
			if(-e $fullfile)
			{
			    print_plot_line($fullfile, $ARGV[$argnum], $col, ($argnum ==  $#ARGV) ? 1 : 0);
			}
		}
	}
}

sub print_plots
{
	local($col, $ylabel, $title) = @_;
	
	print_plot("benchmark_0_1.out", $col, $ylabel, $title); 	
#	print_plot("gauss_10_benchmark_0.out", $col, $ylabel, "$title Average of 20 Episodes");
#	print_plot("gauss_50_benchmark_0.out", $col, $ylabel, "$title Average of 100 Episodes");
#	print_plot("gauss_100_benchmark_0.out", $col, $ylabel, "$title Average of 200 Episodes");
#	print_plot("gauss_500_benchmark_0.out", $col, $ylabel, "$title Average of 1000 Episodes");
  	
#  	print_plot("avg_10_benchmark_0.out", $col, $ylabel, "$title Average of 20 Episodes");
#  	print_plot("avg_50_benchmark_0.out", $col, $ylabel, "$title Average of 100 Episodes");
#  	print_plot("avg_100_benchmark_0.out", $col, $ylabel, "$title Average of 200 Episodes");
#  	print_plot("avg_500_benchmark_0.out", $col, $ylabel, "$title Average of 1000 Episodes");  	
}

print_plot("OffLineReward.out", 2, "Off-line reward", "Off-line reward");
print_plot("GreedyRandomWins.out", 2, "Percentage Wins", "Percentage Wins Against Random Player");
print_plot("GreedyHeuristicWins.out", 2, "Percentage Wins", "Percentage Wins Against Heuristic Player");
print_plot("GreedyWins.out", 5, "Percentage Wins", "Percentage Wins Against Random Player");
print_plot("GreedyWins.out", 4, "Percentage Wins", "Percentage Wins Against Heuristic Player");

print_plots(6, "Cumulative Reward", "Cumulative Reward");
print_plots(11, "Average Reward", "Average Reward");
print_plots(2, "Episode Reward", "Episode Reward");
print_plots(3, "Average Step Reward", "Average Step Reward");
print_plots(4, "Number of Installed Candidate Neurons", "Number of Installed Candidate Neurons");
print_plots(5, "Average Delta for Episode", "Delta");
print_plots(7, "Number of Steps Per Episode", "Number of Steps Per Episode");
print_plots(8, "Number of Wins", "Number of Wins");
print_plots(9, "MSE", "MSE");
print_plots(10, "Portion of explorative steps", "Portion of explorative steps");

print "\nset output\n";
print "set terminal x11\n"
