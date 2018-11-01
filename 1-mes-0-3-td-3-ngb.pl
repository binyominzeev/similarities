#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;

use List::Util qw(sum max min);

# ======== parameters ========

my $categ_ht=5;
my $len=3;

my $dataset="1-aps";

# ======== initialize ========

my $pmz=pmz_combinations($len);

# ========== read ==========

my %box_codes;
my %word_codes;

my %word_distances;
my %word_neighbors;

open IN, "<1-mes-$dataset-3-td-2-box.txt";
while (<IN>) {
	chomp;

	my ($word, $code, $box)=split/\t/, $_;
	$box_codes{$box}->{$word}=$code;
	$word_codes{$word}=$code;
}
close IN;

for my $box (sort keys %box_codes) {
	my $neighbors=box_neighbors($box);
	
	my @neighbor_words;
	
	for my $neighbor_box (@$neighbors) {
		for my $neighbor_word (keys %{$box_codes{$neighbor_box}}) {
			push @neighbor_words, $neighbor_word;
		}
	}
	
	my $x=scalar keys %{$box_codes{$box}};
	my $y=scalar @neighbor_words;
	my $xy=$x*$y;
	
	print "$box\t$x *\t$y =\t$xy\n";
	
	for my $word (keys %{$box_codes{$box}}) {
		my $min_dist=10000;
		my $min_neighbor="";
		
		for my $neighbor_word (@neighbor_words) {
			if ($word ne $neighbor_word) {
				my $dist=my_distance($word, $neighbor_word);
				if ($dist < $min_dist) {
					$min_dist=$dist;
					$min_neighbor=$neighbor_word;
				}
			}
		}
		
		$word_distances{$word}=$min_dist;
		$word_neighbors{$word}=$min_neighbor;
	}
}

# ========== output ==========

open OUT, ">1-mes-$dataset-3-td.txt";
for my $word (sort keys %word_distances) {
	print OUT "$word\t$word_neighbors{$word}\t$word_distances{$word}\n";
}
close OUT;

# ========== functions ==========

sub my_distance {
	my ($word1, $word2)=@_;
	
	my @word1=split//, $word_codes{$word1};
	my @word2=split//, $word_codes{$word2};
	
	my $dist=0;
	
	for my $i (0..$#word1) {
		$dist+=abs($word1[$i]-$word2[$i]);
	}
	
	return $dist;
}

sub box_neighbors {
	my $box=shift;
	
	my @box=split//, $box;
	my @neighbors;
	
	for my $inc (@$pmz) {
		my @neighbor;
		for my $i (0..$#box) {
			my $box_i=$box[$i];
			my $inc_i=$inc->[$i];
			
			if ($inc_i == 2) {
				$box_i--;
				if ($box_i == -1) {
					$box_i=$categ_ht-1;
				}
			} else {
				$box_i+=$inc_i;
			}
			
			push @neighbor, $box_i;
		}
		
		my $neighbor=join "", @neighbor;
		push @neighbors, $neighbor;
	}
	
	return \@neighbors;
}

sub pmz_combinations {
	# plus-minus-zero combinations of $len length
	my $len=shift;

	my @all=();
	my @current=(0) x $len;
	my @start=@current;
	
	my $retval=1;
	
	do {
		$retval=pmz_inc(\@current);
		my_push(\@all, \@current);
		
		my $current=join "", @current;
	} while ($retval == 1);
	
	return \@all;
}

sub my_push {
	my ($all, $current)=@_;
	my @current=@$current;
	push @$all, \@current;
}

sub pmz_inc {
	my $current=shift;
	
	my $retval=1;
	if (scalar @$current == 0) {
		$retval=0;
	} else {
		if ($current->[0] == 2) {
			my @rest=@$current[1..$#$current];
			$retval=pmz_inc(\@rest);

			@$current=(0, @rest);
		} else {
			$current->[0]++;
		}
	}
	
	return $retval;
}
