#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

my $dataset="aps";

my %count;

open IN, "<4-un-1-$dataset.txt";
while (<IN>) {
	chomp;
	my ($word, $cn, $kk)=split/\t/, $_;
	
	if ($cn > $kk) {
		$count{"cn"}++;
	} else {
		$count{"kk"}++;
	}
}
close IN;

open OUT, ">5-ev.txt";
print OUT "$dataset:\n\n";
for my $key (sort { $count{$b} <=> $count{$a} } keys %count) {
	print OUT "$key\t$count{$key}\n";
}
close OUT;
