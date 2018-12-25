#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

# ======== initialize ========

#my $dataset="1-aps";
#my $dataset="2-so";
#my $dataset="4-patent";
my $dataset="5-zeit";

#my $mode="1-cn";
my $mode="2-kk";
#my $mode="3-td";
#my $mode="4-oc";

# ======== process ========

print "($dataset, $mode)\n";

my %words;

open IN, "<1-mes-$dataset-$mode.txt";
while (<IN>) {
	chomp;
	my ($a, $b, $val)=split/\t/, $_;
	
	#if ($val == 1) { last; }

	$words{$a}="";
	$words{$b}="";
}
close IN;

# ======== output ========

open OUT, ">2-wd-$dataset-$mode.txt";
for my $word (sort keys %words) {
	print OUT "$word\n";
}
close OUT;

