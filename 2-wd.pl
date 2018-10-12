#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

# ======== initialize ========

my $mode="cn";

# ======== process ========

my %words;

open IN, "<aps-$mode.txt";
while (<IN>) {
	chomp;
	my ($a, $b, $val)=split/\t/, $_;
	
	if ($val == 1) { last; }

	$words{$a}="";
	$words{$b}="";
}
close IN;

# ======== output ========

open OUT, ">aps-$mode-words.txt";
for my $word (sort keys %words) {
	print OUT "$word\n";
}
close OUT;

