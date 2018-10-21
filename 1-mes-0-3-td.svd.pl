#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;

use Scalar::Util qw(looks_like_number);
use List::Util qw(sum max min);

# ======== parameters ========

my $wd=5;
my $ht=9;

my $categ_wd=$wd+3;

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

open OUT, ">1-mes-$dataset-3-td-svd.csv";
print OUT "word,";
print OUT join ",", map { "y$_" } ($first_year..$last_year);
print OUT "\n";
for my $word (sort keys %words) {
	my @a;
	
	for my $year ($first_year..$last_year) {
		my $val=0;
		if (exists $words{$word}->{$year}) {
			$val=$words{$word}->{$year};
		}
		push @a, $val;
	}
	my $b=min_max_norm(\@a);
	
	my $vals=join ",", @$b;
	print OUT "$word,$vals\n";
}
close OUT;

# ========== functions ==========

sub my_avg {
	return sum(@_)/(scalar @_);
}

sub min_max_norm {
	my ($a)=@_;
	
	my $min=min(@$a);
	my $max=max(@$a);
	my $all=($max-$min);
	
	my @b;
	for my $val (@$a) {
		push @b, int(100*($val-$min)/$all);
	}
	
	return \@b;
}


