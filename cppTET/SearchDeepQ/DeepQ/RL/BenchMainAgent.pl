#!/usr/bin/perl

$episodes = $ARGV[0];
$name = $ARGV[1];
$file = "benchmarkdata/$name/OffLineReward.out";

system("rm -f $file");

foreach $argnum (2 .. $#ARGV) 
{
	$episodeNum = $ARGV[$argnum];
	$episodeNum =~ m/.*_0_(\d+)\.txt/g;
	$episodeNum = $1;
	
	print("Processing ".($argnum-1)." of ".($#ARGV-1)." for $episodes episodes\n");
	system("echo -n '$episodeNum ' >> $file\n");
	$cmd = "(./rl -q -te $episodes -off 0 -name test -f ".$ARGV[$argnum]." | grep 'OFFLINE' | cut -c 8-18 >> $file)";
	#print($cmd);
	$output = `$cmd 2>&1`;
	system("tail -n 1 $file");
}