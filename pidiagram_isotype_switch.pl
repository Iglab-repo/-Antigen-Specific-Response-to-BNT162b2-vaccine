#!/usr/bin/perl
#This script is used to generate data for upset plot based on new files from Andrea.
use List::MoreUtils qw(uniq);
use List::Util qw(max);
open(IN,"5timepoints_newscore_v2.tab");@a=<IN>;close IN;

print "Timepoint,IgG,IgA,IgM,IgD\n";
@time=("Pre","Day_8","Day_14","Day_42");

=for
foreach $get1(@time)
{
  $count=$igg=$iga=$igd=$igm=0;
  foreach $get(@a)
  {
   @t=();@t=split(/\t/,$get);
   $len=scalar(@t)-1;
   if(($t[$len-5]>=1 || $t[$len]>=1)&& $t[1] eq $get1)
   {
     $count++;
     if($t[27]=~/IGHG/) {$igg++;}
     elsif($t[27]=~/IGHA/) {$iga++;}
     elsif($t[27]=~/IGHM/) {$igm++;}
     elsif($t[27]=~/IGHD/) {$igd++;}      
   }
   }
   $igg1=($igg/$count)*100;$iga1=($iga/$count)*100;$igm1=($igm/$count)*100;$igd1=($igd/$count)*100;
   print "$get1,$igg1,$iga1,$igm1,$igd1\n";
}
#only SARS2 LSS>=1
foreach $get1(@time)
{
  $count=$igg=$iga=$igd=$igm=0;
  foreach $get(@a)
  {
   @t=();@t=split(/\t/,$get);
   $len=scalar(@t)-1;
   if(($t[$len-5]>=1 || $t[$len]>=1) && $t[$len-4]<1 && $t[$len-3]<1 && $t[$len-2]<1 && $t[$len-1]<1 && $t[1] eq $get1)
   {
     $count++;
     if($t[27]=~/IGHG/) {$igg++;}
     elsif($t[27]=~/IGHA/) {$iga++;}
     elsif($t[27]=~/IGHM/) {$igm++;}
     elsif($t[27]=~/IGHD/) {$igd++;}
   }
   }
   $igg1=($igg/$count)*100;$iga1=($iga/$count)*100;$igm1=($igm/$count)*100;$igd1=($igd/$count)*100;
  #print "$get1,$igg,$iga,$igm,$igd\n";
   print "$get1,$igg1,$iga1,$igm1,$igd1\n";
}

=cut
foreach $get1(@time)
{
  $count=$igg=$iga=$igd=$igm=0;
  foreach $get(@a)
  {
   @t=();@t=split(/\t/,$get);
   $len=scalar(@t)-1;
   $maxcov=0;$maxcov=max($t[$len-4],$t[$len-3],$t[$len-2],$t[$len-1]);
   if(($t[$len-5]>=1 || $t[$len]>=1) && $maxcov>=1 && $t[1] eq $get1)
   {
     $count++;
     if($t[27]=~/IGHG/) {$igg++;}
     elsif($t[27]=~/IGHA/) {$iga++;}
     elsif($t[27]=~/IGHM/) {$igm++;}
     elsif($t[27]=~/IGHD/) {$igd++;}
   }
   }
   $igg1=($igg/$count)*100;$iga1=($iga/$count)*100;$igm1=($igm/$count)*100;$igd1=($igd/$count)*100;
   print "$get1,$igg1,$iga1,$igm1,$igd1\n";
#   print "$get1,$igg,$iga,$igm,$igd\n";
}








