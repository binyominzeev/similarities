#!/usr/bin/perl
use strict;
use warnings;

use Term::ProgressBar::Simple;

my $progress=new Term::ProgressBar::Simple(4992224);

my %years_count;

open IN, "zcat patent_nodes.gz|";
while (<IN>) {
	chomp;
	my ($id, $year, $title)=split/\t/, $_;
	
	if ($year) {
		$year=substr($year, 0, 4);
		$years_count{$year}++;
	}
	
	$progress++;
}
close IN;

open OUT, ">patent_years.txt";
for my $year (sort keys %years_count) {
	print OUT "$year $years_count{$year}\n";
}
close OUT;
