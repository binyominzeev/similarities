#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

# ======== initialize ========

my $dataset="1-aps";

#my $mode="1-cn";
#my $mode="2-kk";
my $mode="4-oc";

# ======== process ========

my %words;

open IN, "<1-mes-$dataset-$mode.txt";
while (<IN>) {
	chomp;
	my ($a, $b, $val)=split/\t/, $_;
	
	if ($val == 1) { last; }

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

