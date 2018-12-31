#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

# ======== parameters ========

#my $dataset="1-aps";
#my $dataset="2-so";
my $dataset="4-patent";
#my $dataset="5-zeit";

my @stats=qw/1-cn 2-kk 3-td 4-oc/;

# ======== process ========

my %words;

for my $mode (@stats) {
	open IN, "<3-pr-$dataset-$mode.txt";
	while (<IN>) {
		chomp;
		my ($word, $val)=split/\t/, $_;
		$words{$word}->{$mode}=$val;
	}
	close IN;
}

# ======== output ========

open OUT, ">4-un-$dataset.txt";
for my $word (sort keys %words) {
	my @line;
	
	for my $mode (@stats) {
		if (exists $words{$word}->{$mode}) {
			push @line, $words{$word}->{$mode};
		} else {
			push @line, 0;
		}
	}
	
	my $line=join "\t", @line;
	print OUT "$word\t$line\n";
}
close OUT;
