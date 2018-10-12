#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;

# ========== parameters ==========

my $file="aps-records.txt";

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
	@szavak=grep { !exists $stopwords{$_} } @szavak;
	
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

# ========== output ==========

open OUT, ">1-mes-1-aps-4-oc.txt";
for my $pair (sort { $pairs{$b} <=> $pairs{$a} } keys %pairs) {
	print OUT "$pair\t$pairs{$pair}\n";
}
close OUT;
