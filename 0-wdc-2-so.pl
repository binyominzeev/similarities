#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;

# ======== initialize ========

# itt: szantoadam@atlasz:~/wordtime/so$ head so-id-title.txt 

my $dataset="2-so";
my $file="so-id-title.txt";

my $first_year="2008-09";
my $last_year="2015-12";

# ========== stopwords ==========

my %stopwords;
my @stopwords=split/\n/, `cat stopwords-en.txt`;
map { $stopwords{$_}=""; } @stopwords;

# ========== process ==========

my $progress=new Term::ProgressBar::Simple(11203031);

my %pairs;
my %words;

#my $i=1;

open IN, "<$file";
while (<IN>) {
#for my $line (@results) {
	my ($id, $year, $title)=split/\t/, $_;
	
	$year=substr($year, 0, 7);
	
	if ($first_year le $year && $year le $last_year) {
		my @szavak=$title=~/[a-zA-Z]+/g;
		@szavak=grep { !exists $stopwords{lc $_} } @szavak;
		
		map { $words{lc $_}++ } @szavak;
		
#		$i++;
#		if ($i > 10000) { last; }
	}

	$progress++;
}
close IN;

# ========== output ==========

open OUT, ">0-wdc-$dataset.txt";
for my $word (sort { $words{$b} <=> $words{$a} } keys %words) {
	print OUT "$word\t$words{$word}\n";
}
close OUT;

