#!/usr/bin/perl
use List::MoreUtils qw(uniq);
open(IN,"P22/all_virusSelSubsetsSerDel-p22_2300.out");@a=<IN>;close IN;
open(OUT,">P22/serum_delineation_error_values_p22.txt");
open(OUT1,">P22/serum_delineation_error_values_p22_all.txt");
foreach $get(@a)
{
   @t=();@t=split(/\s+/,$get);
   push(@val,$t[1]);
}
@val1=uniq(@val);
@val1=sort { $a <=> $b } @val1;
$,="\n";
print OUT1 @val1;
for($i=0;$i<5000 && $i<=scalar(@val1);$i++)
{
  print OUT "$val1[$i]\n";
}
close OUT;


