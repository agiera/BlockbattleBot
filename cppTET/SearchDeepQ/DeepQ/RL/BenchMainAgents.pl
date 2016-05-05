#!/usr/bin/perl

$episodes = $ARGV[0];

$namestring = "";

foreach $argnum (1 .. $#ARGV) 
{
	$name = $ARGV[$argnum];
	$namestring .= " ".$name;
	system("./BenchMainAgent.pl $episodes $name benchmarkdata/$name/agent_0_*.txt");
}

system("./gnuplot.pl $namestring | gnuplot");