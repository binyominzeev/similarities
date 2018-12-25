#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;

# ======== initialize ========

#my $dataset="1-aps";
#my $file="aps-records.txt";
#my $first_year=1965;
#my $last_year=2009;
#my $word_count=2700;
#my $line_count=463347;

#my $dataset="2-so";
#my $file="so-id-title.txt";
#my $first_year="2008-09";
#my $last_year="2015-12";
#my $word_count=9500;
#my $line_count=11203031;

#my $dataset="4-patent";
#my $file="patent_nodes.gz";
#my $first_year=1976;
#my $last_year=2012;
#my $word_count=11500;
#my $line_count=4992224;

my $dataset="5-zeit";
my $file="zeit_nodes.txt";
my $first_year=1965;
my $last_year=2014;
my $word_count=3200;
my $line_count=891431;

# ========== stopwords ==========

my %stopwords;
#my @stopwords=split/\n/, `cat stopwords-en.txt`;
my @stopwords=split/\n/, `cat stopwords-de.txt`;
map { $stopwords{$_}=""; } @stopwords;

# ========== process ==========

print "processing $dataset... ($line_count)\n";

my @results=split/\n/, `cat $file`;
my $progress=new Term::ProgressBar::Simple($line_count);

my %pairs;
my %words;

#open IN, "zcat $file|";
#open IN, "<$file";
#while (<IN>) {
for (@results) {
	chomp;
	my ($id, $year, $title)=split/\t/, $_;
	
	if ($year) {
		$year=substr($year, 0, 4);
	
		if ($first_year <= $year && $year <= $last_year) {
			my @szavak=$title=~/[a-zA-ZöüäÄÖÜß]+/g;
	#		my @szavak=$title=~/[a-zA-Z]+/g;
			@szavak=grep { !exists $stopwords{lc $_} } @szavak;
			
			map { $words{lc $_}++ } @szavak;
		}
	}

	$progress++;
}
#close IN;

# ========== output ==========

open OUT, ">0-wdc-$dataset.txt";
for my $word (sort { $words{$b} <=> $words{$a} } keys %words) {
	print OUT "$word\t$words{$word}\n";
}
close OUT;

