#!/usr/bin/perl

$episodes = $ARGV[0];
$name = $ARGV[1];
$randomfile = "benchmarkdata/$name/GreedyRandomWins.out";
$heuristicfile = "benchmarkdata/$name/GreedyHeuristicWins.out";

system("rm -f $randomfile $heuristicfile");

foreach $argnum (2 .. $#ARGV) 
{
	$episodeNum = $ARGV[$argnum];
	$episodeNum =~ m/.*_0_(\d+)\.txt/g;
	$episodeNum = $1;
	
	#against random player
	print("Processing ".($argnum-1)." of ".($#ARGV-1)." for $episodes episodes against random player\n");
	system("echo -n '$episodeNum ' >> $randomfile\n");
	$cmd = "(./runbgrandom.sh -q -te $episodes -ge $episodes -name test -f ".$ARGV[$argnum]." | grep 'WinPercent\\[1\\]' | cut -c 16-30 >> $randomfile)";
	$output = `$cmd 2>&1`;
	system("tail -n 1 $randomfile");

	#against heuristic player
	print("Processing ".($argnum-1)." of ".($#ARGV-1)." for $episodes episodes against heuristic player\n");
	system("echo -n '$episodeNum ' >> $heuristicfile\n");
	$cmd = "(./runbgheuristic.sh -q -te $episodes -ge $episodes -name test -f ".$ARGV[$argnum]." | grep 'WinPercent\\[1\\]' | cut -c 16-30 >> $heuristicfile)";
	$output = `$cmd 2>&1`;
	system("tail -n 1 $heuristicfile");
}