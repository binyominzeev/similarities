#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;

# ======== initialize ========

my $dataset="1-aps";
my $file="aps_edges.txt";

my $edge_count=4710547;

# ========== process ==========

my %outdeg;
my $progress=new Term::ProgressBar::Simple($edge_count);

my $i=1;

open IN, "<$file";
while (<IN>) {
	chomp;
	my ($a, $b)=split/\t/, $_;
	
	$outdeg{$a}++;
	$progress++;
	
#	if ($i++ > 50000) { last; }
}
close IN;

my $sum=0;
my $count=0;

for my $from (keys %outdeg) {
	$sum+=$outdeg{$from};
	$count++;
}

print "$sum/$count = ".($sum/$count)."\n";
