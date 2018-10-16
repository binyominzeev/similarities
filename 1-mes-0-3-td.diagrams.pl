#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;

use Scalar::Util qw(looks_like_number);
use List::Util qw(sum max);

# ======== parameters ========

my $wd=5;
my $ht=9;

my $first_year=1965;
my $last_year=2009;

# ======== initialize ========

my $dataset="1-aps";
my $file="aps-records.txt";

# ========== stopwords ==========

my %words;
my @words=split/\n/, `head -n2700 0-wdc-1-aps.txt | cut -f1`;
map { %{$words{$_}}=(); } @words;

# ========== process ==========

my @results=split/\n/, `cat $file`;
my $progress=new Term::ProgressBar::Simple(scalar @results);

for my $line (@results) {
	my ($id, $year, $title)=split/\t/, $line;
	
	if (looks_like_number($year) && $first_year <= $year && $year <= $last_year) {
		my @szavak=$title=~/[a-zA-Z]+/g;
		@szavak=grep { exists $words{$_} }
			map { lc $_ }
			@szavak;
		
		map { $words{$_}->{$year}++; } @szavak;
	}

	$progress++;
}

# ========== output ==========

open OUT, ">1-mes-$dataset-3-td-diagrams.txt";
for my $word (sort keys %words) {
	my $code="";
	my @current_box;
	
	my $max=max (values %{$words{$word}});
	
	#for my $year (sort { $a <=> $b } keys %{$words{$word}}) {
	for my $year ($first_year..$last_year) {
		my $val=0;
		if (exists $words{$word}->{$year}) {
			$val=$words{$word}->{$year};
		}
		
		push @current_box, $val;
		if (@current_box >= $wd) {
			my $current_val=int((my_avg(@current_box)/$max)*$ht);
			$code.=$current_val;
			@current_box=();
		}
	}

	if (@current_box > 0) {
		my $current_val=int((my_avg(@current_box)/$max)*$ht);
		$code.=$current_val;
	}
	
	print OUT "$word\t$code\n";
}
close OUT;

# ========== functions ==========

sub my_avg {
	return sum(@_)/(scalar @_);
}
