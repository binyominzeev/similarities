#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;

use Scalar::Util qw(looks_like_number);
use List::Util qw(sum max min);

# ======== parameters ========

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
my $line_count=4016965;

# ========== top words ==========

my %words;
my @words=split/\n/, `head -n$word_count 0-wdc-$dataset.txt | cut -f1`;
map { %{$words{$_}}=(); } @words;

# ========== process ==========

print "processing $dataset... ($line_count)\n";

my @results=split/\n/, `cat $file`;
my $progress=new Term::ProgressBar::Simple($line_count);

my %year_count;

#open IN, "zcat $file|";
#open IN, "<$file";
#while (<IN>) {
for (@results) {
	my ($id, $year, $title)=split/\t/, $_;
	
	$year=substr($year, 0, 4);

	if (looks_like_number($year) && $first_year <= $year && $year <= $last_year) {
		$year_count{$year}++;

		my @szavak=$title=~/[a-zA-ZöüäÄÖÜß]+/g;
		#my @szavak=$title=~/[a-zA-Z]+/g;
		@szavak=grep { exists $words{$_} }
			map { lc $_ }
			@szavak;
		
#		for (@szavak) {
#			if ($_ eq "ukraine") {
#				print "$id\t$year\t$title\n";
#			}
			
#			$words{$_}->{$year}++;
#		}
		
		map { $words{$_}->{$year}++; } @szavak;
	}

	$progress++;
}

my @year_count=map { $year_count{$_} }
	sort { $a <=> $b }
	keys %year_count;

#print Dumper \@year_count;
#exit;

# ========== output ==========

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
	my $b=yearly_max_norm(\@a);
#	$b=sum_norm($b);
	
	my $vals=join ",", @$b;
	print OUT "$word,$vals\n";
}
close OUT;

# ========== functions ==========

sub yearly_max_norm {
	my ($a)=@_;
	
	my @b;
	for my $i (0..$#$a) {
		push @b, $a->[$i]/$year_count[$i];
	}

	my $max=max(@b);
	
	if ($max > 0) {
		@b=map { int(100*$_/$max) } @b;
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


