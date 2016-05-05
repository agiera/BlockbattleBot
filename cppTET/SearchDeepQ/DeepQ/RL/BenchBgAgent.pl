#!/usr/bin/perl

$episodes = $ARGV[0];
$name = $ARGV[1];
$outfile = $ARGV[2];
$agentfile = $ARGV[3];

if(!(-e $agentfile))
{
	exit;
}

$param = $name;
$param =~ m/.*_(.*)/g;
$param = $1 + 0.0;

# Perl trim function to remove whitespace from the start and end of the string
sub trim($)
{
	my $string = shift;
	$string =~ s/^\s+//;
	$string =~ s/\s+$//;
	return $string;
}

#against random player
print("Processing $name for $episodes episodes against random player\n");
$cmd = "(./runbgrandom.sh -q -te $episodes -on 0 -off 0 -name test -f ".$agentfile." | grep 'OFFLINE' | cut -c 8-18)";
# print "$cmd\n";	
$output = `$cmd`;
$randomreward = trim($output);
$randomwin = (($randomreward+1.0)/2.0)*100.0;

#against heuristic player
print("Processing $name for $episodes episodes against heuristic player\n");
$cmd = "(./runbgheuristic.sh -q -te $episodes -on 0 -off 0 -name test -f ".$agentfile." | grep 'OFFLINE' | cut -c 8-18)";
# print "$cmd\n";	
$output = `$cmd`;
$heuristicreward = trim($output);
$heuristicwin = (($heuristicreward+1.0)/2.0)*100.0;

$out = "$param $heuristicreward $randomreward $heuristicwin $randomwin";
print "$out\n";
system("echo '$out' >> $outfile");
