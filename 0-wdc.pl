#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;

# ======== initialize ========

my $dataset="5-zeit";
my $file="zeit_nodes.txt";

my $first_year=1965;
my $last_year=2014;

# ========== stopwords ==========

my %stopwords;
#my @stopwords=split/\n/, `cat stopwords-en.txt`;
my @stopwords=split/\n/, `cat stopwords-de.txt`;
map { $stopwords{$_}=""; } @stopwords;

# ========== process ==========

my @results=split/\n/, `cat $file`;

my $progress=new Term::ProgressBar::Simple(scalar @results);

my %pairs;
my %words;

for my $line (@results) {
	my ($id, $year, $title)=split/\t/, $line;
	
	if ($first_year <= $year && $year <= $last_year) {
		my @szavak=$title=~/[a-zA-Z]+/g;
		@szavak=grep { !exists $stopwords{lc $_} } @szavak;
		
		map { $words{lc $_}++ } @szavak;
	}

	$progress++;
}

# ========== output ==========

open OUT, ">0-wdc-$dataset.txt";
for my $word (sort { $words{$b} <=> $words{$a} } keys %words) {
	print OUT "$word\t$words{$word}\n";
}
close OUT;

