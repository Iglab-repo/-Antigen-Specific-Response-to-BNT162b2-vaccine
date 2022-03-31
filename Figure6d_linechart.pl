#!/usr/bin/perl
use List::MoreUtils qw(uniq);
open(IN,"5timepoints_newscore_andrea_v2.tab");@a=<IN>;close IN;

#print "Timepoint,SARS2-only,SARS1,MERS,OC43,HKU1\n";
print "Timepoint,Antigen cross-reactivity,Count\n";
@time=("Day_42","Day_14","Day_8","Pre");

foreach $get1(@time)
{
  $count=$sar2=$sar1=$mers=$oc43=$hku1=0;
  foreach $get(@a)
  {
   @t=();@t=split(/\t/,$get);
   $len=scalar(@t)-1;
   if($t[1] eq $get1 && $t[27]=~/IGHA/)
   {
     $count++;$ok=0;
     if($t[$len-4]>=1 && ($t[$len-5]>=1 || $t[$len]>=1)) {$sar1++;$ok++;}
     if($t[$len-3]>=1 && ($t[$len-5]>=1 || $t[$len]>=1)) {$mers++;$ok++;}
     if($t[$len-2]>=1 && ($t[$len-5]>=1 || $t[$len]>=1)) {$oc43++;$ok++;}
     if($t[$len-1]>=1 && ($t[$len-5]>=1 || $t[$len]>=1)) {$hku1++;$ok++;} 
     if($ok==0 && ($t[$len-5]>=1 || $t[$len]>=1)) {$sar2++;}
    }
  }
#   $sar2p=($sar2/$count)*100;
#   $sar1p=($sar1/$count)*100;
#   $mersp=($mers/$count)*100;
#   $oc43p=($oc43/$count)*100;
#   $hku1p=($hku1/$count)*100;
#   print "$get1,$sar2p,$sar1p,$mersp,$oc43p,$hku1p\n";
#print "$get1,$sar2,$sar1,$mers,$oc43,$hku1\n";
$get1=~s/_/ /g;
print "$get1,SARS-CoV-2 with HCoV-HKU1,$hku1\n";
print "$get1,SARS-CoV-2 with HCoV-OC43,$oc43\n";
print "$get1,SARS-CoV-2 only,$sar2\n";
print "$get1,SARS-CoV-2 with SARS-CoV,$sar1\n";
print "$get1,SARS-CoV-2 with MERS-CoV,$mers\n";
}



