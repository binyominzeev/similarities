#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use List::Util qw/max/;

# ======== parameters ========

my @dataset=qw/1-aps 2-so 4-patent 5-zeit/;
my @stats=qw/1-cn 2-kk 3-td 4-oc/;

# ======== process ========

my %count;

for my $dataset (@dataset) {
	open IN, "<4-un-$dataset.txt";
	while (<IN>) {
		chomp;
		my @line=split/\t/, $_;
		my $word=shift @line;
		my $max=max(@line);
		
		for my $i (0..$#line) {
			if ($line[$i] == $max) {
				$count{$dataset}->{$stats[$i]}++;
				#print "$stats[$i]\t$word\n";
				
				#if ($i == 2) {
				#	print "$stats[$i]\t$word\n";
				#}
			}
		}
	}
	close IN;
}

#print Dumper \%count;

# ======== output ========

open OUT, ">5-ev.txt";
for my $dataset (@dataset) {
	print OUT afterdash($dataset);
	print OUT ":\n\n";
	
	for my $key (sort { $count{$dataset}->{$b} <=> $count{$dataset}->{$a} } keys %{$count{$dataset}}) {
		print OUT afterdash($key);
		print OUT "\t$count{$dataset}->{$key}\n";
	}
	
	print OUT "\n";
}
close OUT;

# ======== functions ========

sub afterdash {
	my $a=shift;
	$a=~/\-/;
	return $';
}

