#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;
use List::Util qw(sum max min);

use utf8;

# ========== parameters ==========

#my $dataset="1-aps";
#my $file="aps-records.txt";
#my $first_year=1965;
#my $last_year=2009;
#my $word_count=2700;
#my $line_count=463347;

my $dataset="2-so";
my $file="so-id-title.txt";
my $first_year="2008-09";
my $last_year="2015-12";
my $word_count=9500;
my $line_count=11203031;

#my $dataset="4-patent";
#my $file="patent_nodes.gz";
#my $first_year=1976;
#my $last_year=2012;
#my $word_count=11500;
#my $line_count=4992224;

#my $dataset="5-zeit";
#my $file="zeit_nodes.txt";
#my $first_year=1965;
#my $last_year=2014;
#my $word_count=3200;
#my $line_count=4016965;

# ========== top words ==========

print "processing $dataset... ($line_count)\n";

my %words;
my @words=split/\n/, `head -n$word_count 0-wdc-$dataset.txt`;
map { /\t/; $words{$`}=$'; } @words;

# ========== process ==========

#my @results=split/\n/, `cat $file`;
my $progress=new Term::ProgressBar::Simple($line_count);

my %pairs;

#open IN, "zcat $file|";
open IN, "<$file";
while (<IN>) {
#for (@results) {
	chomp;
	my ($id, $year, $title)=split/\t/, $_;
	
	if ($year) {
		#$year=substr($year, 0, 4);
		$year=substr($year, 0, 7);

		#if ($first_year <= $year && $year <= $last_year) {
		if ($first_year le $year && $year le $last_year) {
			#my @szavak=$title=~/[a-zA-ZöüäÄÖÜß]+/g;
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
		}
	}

	$progress++;
}

# ========== output ==========

open OUT, ">1-mes-$dataset-4-oc-raw.txt";
for my $pair (sort { $pairs{$b} <=> $pairs{$a} } keys %pairs) {
	print OUT "$pair\t$pairs{$pair}\n";
}
close OUT;
