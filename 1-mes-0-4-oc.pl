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

# ========== process ==========

my @results=split/\n/, `cat $file`;

my $progress=new Term::ProgressBar::Simple(scalar @results);

my %pairs;

for my $line (@results) {
	my ($id, $year, $title)=split/\t/, $line;
	
	my @szavak=$title=~/[a-zA-Z]+/g;
	@szavak=grep { exists $words{$_} } @szavak;
	
	for my $i (0..$#szavak-1) {
		for my $j ($i+1..$#szavak) {
			my $x=lc $szavak[$i];
			my $y=lc $szavak[$j];
			
			my @xy=sort($x, $y);
			my $xy=join "\t", @xy;
			
			$pairs{$xy}++;
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

open OUT, ">1-mes-1-aps-4-oc.txt";
for my $pair (sort { $output{$b} <=> $output{$a} } keys %output) {
	print OUT "$pair\t$output{$pair}\n";
}
close OUT;
