#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;
use List::Util qw(sum max min);

# ========== parameters ==========

my $dataset="5-zeit";
my $file="zeit_nodes.txt";

my $first_year=1965;
my $last_year=2014;

# ========== top words ==========

my %words;
my @words=split/\n/, `head -n3200 0-wdc-$dataset.txt`;
map { /\t/; $words{$`}=$'; } @words;

# ========== process ==========

my @results=split/\n/, `cat $file`;

my $progress=new Term::ProgressBar::Simple(scalar @results);

my %pairs;

for my $line (@results) {
	my ($id, $year, $title)=split/\t/, $line;
	
	if ($first_year <= $year && $year <= $last_year) {
		my @szavak=$title=~/[a-zA-ZöüäÄÖÜß]+/g;
		#my @szavak=$title=~/[a-zA-Z]+/g;
		@szavak=grep { exists $words{$_} } @szavak;
		
		for my $i (0..$#szavak-1) {
			my $x=lc $szavak[$i];
			my $y=lc $szavak[$i+1];
			
			$pairs{"$x\t$y"}++;
		}
	}

	$progress++;
}

# ========== output hash ==========

my %output;

for my $pair (sort { $pairs{$b} <=> $pairs{$a} } keys %pairs) {
	my ($a, $b)=split/\t/, $pair;
	
	my $max=max($words{$a}, $words{$b});
	my $val=int(($pairs{$pair}/$max)*10000)/100;
	
	$output{$pair}=$val;
}

# ========== output ==========

open OUT, ">1-mes-$dataset-1-cn.txt";
for my $pair (sort { $output{$b} <=> $output{$a} } keys %output) {
	print OUT "$pair\t$output{$pair}\n";
}
close OUT;
