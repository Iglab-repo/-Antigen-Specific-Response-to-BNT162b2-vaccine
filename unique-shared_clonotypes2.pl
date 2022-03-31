#!/usr/bin/perl
use List::MoreUtils qw(uniq);
#This section for all timepoints but sequences with less than 1 libraseq score for both HIV and Flu antignes
open(IN,"5timepoints_newscore_andrea_v2-0.2_clone-pass.tab");@a=<IN>;close IN;
open(OUT1,">unique-shared_clonotypes_upsetplot_v2_20May2021.txt");





print OUT1 "CLONE-ID\tC_CALL\tPRE\tDAY8\tDAY14\tDAY42\n";

foreach $get(@a)
{
  chomp $get;@t=();@t=split(/\t/,$get);
  $size=scalar(@t)-1;
  push(@clone,"$t[$size]");
}
@clone_u=uniq(@clone);


foreach $get(@clone_u)
{
  $ok1=$ok2=$ok3=$ok4=$ok5=0;
  @iso=();
  foreach $get1(@a)
  {
    chomp $ge1t;@t=();@t=split(/\t/,$get1);
    $size=scalar(@t)-1;
    if($t[$size]==$get)
    {
      $iso1=substr($t[27],0,4);
      if($iso1=~/IGH/)
      {
      push(@iso,substr($iso1,3,1));
      if($t[1] eq "Pre") {$ok1=1;}
      if($t[1] eq "Day_8") {$ok2=1;}
      if($t[1] eq "Day_14") {$ok3=1;}
      if($t[1] eq "Day_42") {$ok4=1;}
      }
    }
   }
   @iso_u=();@iso_u=uniq(@iso);
   @iso_u_s=();@iso_u_s=sort(@iso_u);
   if(scalar(@iso_u_s)>1) {$isotype="Multi";}
   else {$isotype="IGH".$iso_u_s[0]};
   print OUT1 "$get\t$isotype\t$ok1\t$ok2\t$ok3\t$ok4\n";
}
close OUT;


