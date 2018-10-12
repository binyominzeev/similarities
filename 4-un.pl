#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

# ======== process ========

my %words;

open IN, "<aps-cn-perc.txt";
while (<IN>) {
	chomp;
	my ($word, $val)=split/\t/, $_;
	
	$words{$word}->{"cn"}=$val;
	$words{$word}->{"kk"}=0;
}
close IN;

open IN, "<aps-kk-perc.txt";
while (<IN>) {
	chomp;
	my ($word, $val)=split/\t/, $_;
	
	$words{$word}->{"kk"}=$val;
	if (!exists $words{$word}->{"cn"}) { $words{$word}->{"cn"}=0; }
}
close IN;

# ======== output ========

open OUT, ">aps-cn-kk-perc.txt";
for my $word (sort keys %words) {
	my $cn=$words{$word}->{"cn"};
	my $kk=$words{$word}->{"kk"};
	
	print OUT "$word\t$cn\t$kk\n";
}
close OUT;
