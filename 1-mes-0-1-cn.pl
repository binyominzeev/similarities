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

#my @results=split/\n/, `grep -i "$word" $file`;
my @results=split/\n/, `cat $file`;

my $progress=new Term::ProgressBar::Simple(scalar @results);

my %pairs;

for my $line (@results) {
	my ($id, $year, $title)=split/\t/, $line;
	
	my @szavak=$title=~/[a-zA-Z]+/g;
	@szavak=grep { !exists $stopwords{$_} } @szavak;
	
	for my $i (0..$#szavak-1) {
		my $x=lc $szavak[$i];
		my $y=lc $szavak[$i+1];
		
		#if (!exists $stopwords{$x} && !exists $stopwords{$y}) {
			$pairs{"$x\t$y"}++;
		#}
	}
	
	$progress++;
	
#	print "---\n$title\n";
#	print Dumper \@szavak;

	
}

# ========== output ==========

open OUT, ">aps-cn.txt";
for my $pair (sort { $pairs{$b} <=> $pairs{$a} } keys %pairs) {
	print OUT "$pair\t$pairs{$pair}\n";
}
close OUT;
