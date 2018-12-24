#!/usr/bin/perl
use strict;
use warnings;

open IN, "<zeit_nodes_pre.txt";
#open OUT, ">zeit_nodes.txt";
while (<IN>) {
	chomp;
	my ($id, $url, $title)=split/\t/, $_;
	
	$url=~/\/([0-9]+)\//;
	
	if ($1 eq "10") {
		print "$id\t$1\t$title\n";
	}
	
#	print OUT "$id\t$1\t$title\n";
}
close IN;
#close OUT;
