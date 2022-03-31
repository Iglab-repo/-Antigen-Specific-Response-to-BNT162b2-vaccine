#!/usr/bin/perl
#This script is used to generate data for upset plot
use List::MoreUtils qw(uniq);
open(IN,"5timepoints_newscore_andrea_v2.tab");@a=<IN>;close IN;
open(OUT,">5812-5_libraseqscorea1_IgAIgG_upsetplotdata_v2.tab");

foreach $get(@a)
{
   @t=();@t=split(/\t/,$get);
   if($get=~/Day_42/){push(@barcode,$t[0]);}
}
@barcode_u=uniq(@barcode);

chomp $a[0];
@t=();@t=split(/\t/,$a[0]);
$len=scalar(@t)-1;
print OUT "$t[0]\t$t[27]\t$t[$len-5]\t$t[$len-4]\t$t[$len-3]\t$t[$len-2]\t$t[$len-1]\t$t[$len]\n"; 

foreach $get(@barcode_u)
{
  for($i=0;$i<scalar(@a);$i++)
  {
     if($a[$i]=~/^$get/)
     {
        chomp $a[$i];@t=();@t=split(/\t/,$a[$i]);
        $len=scalar(@t)-1;
        if($t[1] eq "Day_42")
        {
          $isotype=substr($t[27],0,4);
          if($isotype=~/IGH/)
          {
            print OUT "$t[0]\t$isotype\t";
            if($t[$len-5]>=1) {print OUT "1\t";}
            else { print OUT "0\t";}
            if($t[$len-4]>=1) {print OUT "1\t";}
            else { print OUT "0\t";}
            if($t[$len-3]>=1) {print OUT "1\t";}
            else { print OUT "0\t";}
            if($t[$len-2]>=1) {print OUT "1\t";}
            else { print OUT "0\t";}  
            if($t[$len-1]>=1) {print OUT "1\t";}
            else { print OUT "0\t";} 
            if($t[$len]>=1) {print OUT "1\n";}
            else { print OUT "0\n";} }
         }
         last;
      }
    }
}
close OUT;



