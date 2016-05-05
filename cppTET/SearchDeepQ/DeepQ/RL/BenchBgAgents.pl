#!/usr/bin/perl

$episodes = $ARGV[0];
$filename = $ARGV[1];

system("rm -f $filename");
foreach $argnum (2 .. $#ARGV) 
{
	$name = $ARGV[$argnum];
 	system("./BenchBgAgent.pl $episodes $name $filename benchmarkdata/$name/agent1.txt");
}

# $episodes = $episodes/10;

foreach $argnum (2 .. $#ARGV) 
{
	$name = $ARGV[$argnum];
 	system("rm -f benchmarkdata/$name/GreedyWins.out");
	for($num = 1000; $num <= 10000; $num += 1000)
	{
  		system("./BenchBgAgent.pl $episodes $name"."_"."$num benchmarkdata/$name/GreedyWins.out benchmarkdata/$name/agent_0_*0$num.txt");
	}	
}

# system("./gnuplot.pl $namestring | gnuplot");