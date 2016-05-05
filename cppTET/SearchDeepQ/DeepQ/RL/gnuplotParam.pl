#!/usr/bin/perl

print '
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
';


sub print_plot_line 
{
  local($filename, $title, $row, $last) = @_;

  print " \"$filename\" using 1:$row title \"{/=18 $title}\" w linespoints lt $linestyle lw $width";
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
	local($file, $title, $ytitle, $xtitle, $logscale, $row_online, $row_offline) = @_;
	
	$width = 3;
	$linestyle = 1;

	print "\n\nset title \"{/=18 $title}\"\n";
	print "set ylabel \"{/=18 $ytitle}\"\n";
	print "set xlabel \"{/=18 $xtitle}\"\n";
	if($logscale)
	{
		print "set logscale x\n";
	}
	else
	{
		print "unset logscale x\n";
	}
	print "plot ";
    print_plot_line($file, "On-line Performance", $row_online, 0);
    print_plot_line($file, "Off-line Performance", $row_offline, 1);
}

$file = $ARGV[0];
if(-e $file)
{
    print_plot($file, $ARGV[1], "Average Episode Reward", $ARGV[2], $ARGV[3], 4, 9);
    print_plot($file, $ARGV[1], "Average Number of Steps", $ARGV[2], $ARGV[3], 2, 10);
    print_plot($file, $ARGV[1], "Average Reward per Step", $ARGV[2], $ARGV[3], 3, 11);
}

print "\nset output\n";
print "set terminal x11\n"
