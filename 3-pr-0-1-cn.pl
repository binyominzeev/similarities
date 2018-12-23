#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

# ======== initialize ========

my $dataset="1-aps";

my $mode="1-cn";

# ======== load words ========

my %words;
my @words=split/\n/, `cat 2-wd-$dataset-$mode.txt`;
map { $words{$_}="" } @words;

# ======== initialize ========

my %words_vals;
my $max=0;
my $i=1;

open IN, "<1-mes-$dataset-$mode.txt";
while (<IN>) {
	chomp;
	my ($a, $b, $val)=split/\t/, $_;
	
	if (exists $words{$a}) {
		$words_vals{$a}=log($val);
		if ($words_vals{$a} > $max) { $max=$words_vals{$a}; }
		
		delete $words{$a};
	}

	if (exists $words{$b}) {
		$words_vals{$b}=log($val);
		if ($words_vals{$b} > $max) { $max=$words_vals{$b}; }
		
		delete $words{$b};
	}
	
	$i++;
	if (scalar keys %words == 0) { last; }
}
close IN;

# ======== output ========

open OUT, ">3-pr-$dataset-$mode.txt";
for my $word (sort { $words_vals{$b} <=> $words_vals{$a} } keys %words_vals) {
	my $ratio=$words_vals{$word}/$max;
	my $perc=int($ratio*10000)/100;
	
	print OUT "$word\t$perc\n";
}
close OUT;
