#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;
use List::Util qw(sum max min);

# ========== parameters ==========

my $file="aps-records.txt";

# ========== top words ==========

my %words;
my @words=split/\n/, `head -n2700 0-wdc-1-aps.txt`;
map { /\t/; $words{$`}=$'; } @words;

# ========== stopwords ==========

my %stopwords;
my @stopwords=split/\n/, `cat stopwords-en.txt`;
map { $stopwords{$_}=""; } @stopwords;

# ========== process ==========

my @results=split/\n/, `cat $file`;

my $progress=new Term::ProgressBar::Simple(scalar @results);

my %pairs;

for my $line (@results) {
	my ($id, $year, $title)=split/\t/, $line;
	
	my @szavak=$title=~/[a-zA-Z]+/g;
	@szavak=grep { exists $words{$_} } @szavak;
	
	for my $i (0..$#szavak-1) {
		my $x=lc $szavak[$i];
		my $y=lc $szavak[$i+1];
		
		#if (!exists $stopwords{$x} && !exists $stopwords{$y}) {
			$pairs{"$x\t$y"}++;
		#}
	}
	
	$progress++;
}

# ========== output ==========

open OUT, ">1-mes-1-aps-1-cn.txt";
for my $pair (sort { $pairs{$b} <=> $pairs{$a} } keys %pairs) {
	my ($a, $b)=split/\t/, $pair;
	
	my $max=max($words{$a}, $words{$b});
	my $val=int(($pairs{$pair}/$max)*10000)/100;
	
	print OUT "$pair\t$val\n";
}
close OUT;
