#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

# ======== initialize ========

#my $dataset="1-aps";
my $dataset="2-so";
#my $dataset="4-patent";
#my $dataset="5-zeit";

my $mode="1-cn";
#my $mode="2-kk";
#my $mode="4-oc";

# ======== load words ========

print "($dataset, $mode)\n";

my %words;
my @words=split/\n/, `cat 2-wd-$dataset-$mode.txt`;
map { $words{$_}="" } @words;

# ======== initialize ========

my %words_vals;

open IN, "<1-mes-$dataset-$mode.txt";
while (<IN>) {
	chomp;
	my ($a, $b, $val)=split/\t/, $_;
	
	if (exists $words{$a}) {
		$words_vals{$a}=$val;
		delete $words{$a};
	}

	if (exists $words{$b}) {
		$words_vals{$b}=$val;
		delete $words{$b};
	}
	
	if (scalar keys %words == 0) { last; }
}
close IN;

# ======== output ========

open OUT, ">3-pr-$dataset-$mode.txt";
for my $word (sort { $words_vals{$b} <=> $words_vals{$a} } keys %words_vals) {
	my $perc=int($words_vals{$word}*10000)/100;
#	$perc=100-$perc;
	
	print OUT "$word\t$perc\n";
}
close OUT;
