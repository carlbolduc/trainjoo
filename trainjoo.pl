# natural language input
use strict;
use Term::ANSIColor;

print "Enter something like '10 50 ben p' to get '10x50lbs, Bench Presses'... or exercise name to see past sessions:\n";
my $input = <>;
if ($input =~ /(\d+)\s(\d+)\s(\w+.*)/)
{
    my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)=localtime(time);
    my $reps = $1;
    my $weight = $2;
    my $exercise = $3;         
    print "You just logged ";
    print colored ['bold blue'], $exercise . ": " . $reps . "x" . $weight . "lbs, ";
    print colored( sprintf("%4d.%02d.%02d %02d:%02d:%02d",         $year+1900,$mon+1,$mday,$hour,$min,$sec), 'bold blue' );
    print color 'reset';
    print ", press u to undo\n";
}
elsif ($input =~ /{\d+}/)
{
    #print last sessions
}
else
{
    print "I could not detect understandable information.\n";
}

# load a list of exercises from a flat file
 
# open file
open(FILE, "exerciseNames.txt") or die("Unable to open file");
 
# read file into an array
my @ExerciseNames = <FILE>;
 
# close file 
close(FILE);


# parse input
