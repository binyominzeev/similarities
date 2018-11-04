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

my @test_words=qw/quantum model/;

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

my %year_count;

for my $line (@results) {
	my ($id, $year, $title)=split/\t/, $line;
	
	if (looks_like_number($year) && $first_year <= $year && $year <= $last_year) {
		$year_count{$year}++;

		my @szavak=$title=~/[a-zA-Z]+/g;
		@szavak=grep { exists $words{$_} }
			map { lc $_ }
			@szavak;
		
		map { $words{$_}->{$year}++; } @szavak;
	}

	$progress++;
}

my @year_count=map { $year_count{$_} }
	sort { $a <=> $b }
	keys %year_count;

# ========== output ==========

open OUT, ">teszt.txt";
for my $word (@test_words) {
	my @a;
	
	for my $year ($first_year..$last_year) {
		my $val=0;
		if (exists $words{$word}->{$year}) {
			$val=$words{$word}->{$year};
		}
		push @a, $val;
	}

	my $vals=join ",", @a;
	print OUT "$word,$vals\n";
}
close OUT;

open OUT, ">1-mes-$dataset-3-td-1-norm.txt";
for my $word (sort keys %words) {
	my @a;
	
	for my $year ($first_year..$last_year) {
		my $val=0;
		if (exists $words{$word}->{$year}) {
			$val=$words{$word}->{$year};
		}
		push @a, $val;
	}

	#my $b=min_max_norm(\@a);
	my $b=yearly_norm(\@a);
	$b=sum_norm($b);
	
	my $vals=join ",", @$b;
	print OUT "$word,$vals\n";
}
close OUT;

# ========== functions ==========

sub yearly_norm {
	my ($a)=@_;
	
	my @b;
	for my $i (0..$#$a) {
		push @b, 1000*($a->[$i]/$year_count[$i]);
	}
	
	return \@b;
}

sub my_avg {
	return my_sum(@_)/(scalar @_);
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

sub sum_norm {
	my ($a)=@_;
	
	my $avg=my_avg(@$a);
	my @b=map { int(100*$_/$avg) } @$a;
	
	return \@b;
}

sub my_sum {
	my $sum=0;
	for (@_) {
		$sum+=$_;
	}
	return $sum;
}


