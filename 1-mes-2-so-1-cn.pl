#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;
use List::Util qw(sum max min);

# ========== parameters ==========

# itt: szantoadam@atlasz:~/wordtime/so$ head so-id-title.txt 

my $dataset="2-so";
my $file="so-id-title.txt";

my $first_year="2008-09";
my $last_year="2015-12";

# ========== top words ==========

my %words;
my @words=split/\n/, `cat 0-wdc-$dataset.txt`;
map { /\t/; $words{$`}=$'; } @words;

# ========== process ==========

my $progress=new Term::ProgressBar::Simple(11203031);

my %pairs;

open IN, "<$file";
while (<IN>) {
#for my $line (@results) {
	my ($id, $year, $title)=split/\t/, $_;

	$year=substr($year, 0, 7);
	
	if ($first_year le $year && $year le $last_year) {
		my @szavak=$title=~/[a-zA-Z]+/g;
		@szavak=grep { exists $words{$_} } @szavak;
		
		for my $i (0..$#szavak-1) {
			my $x=lc $szavak[$i];
			my $y=lc $szavak[$i+1];
			
			$pairs{"$x\t$y"}++;
		}
	}
	
	$progress++;
}

# ========== output hash ==========

my %output;

for my $pair (sort { $pairs{$b} <=> $pairs{$a} } keys %pairs) {
	my ($a, $b)=split/\t/, $pair;
	
	my $max=max($words{$a}, $words{$b});
	my $val=int(($pairs{$pair}/$max)*10000)/100;
	
	$output{$pair}=$val;
}

# ========== output ==========

open OUT, ">1-mes-$dataset-1-cn.txt";
for my $pair (sort { $output{$b} <=> $output{$a} } keys %output) {
	print OUT "$pair\t$output{$pair}\n";
}
close OUT;
