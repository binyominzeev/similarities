#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;
use List::Util qw(sum max min);

# ========== parameters ==========

# itt: szantoadam@atlasz:~/wordtime/so$ head so-id-title.txt 

my $dataset="5-zeit";
my $file="zeit_nodes.txt";

my $first_year=1965;
my $last_year=2014;

my $n_per_k=10648256.82;

my $lin_a=-1.55;
my $lin_b=15.58;

my $lin_min=-2.552;
my $lin_max=20.224;

my $lin_full=$lin_max-$lin_min;

# ========== top words ==========

my %words;
my @words=split/\n/, `cat 0-wdc-$dataset.txt`;
map { /\t/; $words{$`}=$'; } @words;

# ========== loading %nodes ==========

print "loading %nodes...";

my %nodes;

my @results=split/\n/, `cat $file`;
my $progress=new Term::ProgressBar::Simple(scalar @results);

for my $line (@results) {
	my ($id, $year, $title)=split/\t/, $line;
	
	if ($first_year <= $year && $year <= $last_year) {
		my @szavak=$title=~/[a-zA-Z]+/g;
		@szavak=map { $nodes{$id}->{$_}="" }
			grep { exists $words{$_} }
			map { lc $_; } @szavak;
	}
	
	$progress++;
}
print "done.\n";

# ========== loading %pairs ==========

print "loading %pairs...";

my %pairs;
$progress=new Term::ProgressBar::Simple(186046);

open IN, "<zeit_edges.txt";
while (<IN>) {
	chomp;
	my ($from, $to)=split/\t/, $_;
	
	if (!$from || !$to) { next; }
	
	my @from_szavak=keys %{$nodes{$from}};
	my @to_szavak=keys %{$nodes{$to}};
	
	for my $x (@from_szavak) {
		for my $y (@to_szavak) {
			if ($x ne $y) {
				$pairs{"$x\t$y"}++;
			}
		}
	}
	$progress++;
}
close IN;

# ========== output hash ==========

my %output;

for my $pair (sort { $pairs{$b} <=> $pairs{$a} } keys %pairs) {
	my ($a, $b)=split/\t/, $pair;
	
	my $norm=($words{$a}*$words{$b})/$n_per_k;
	my $val=$pairs{$pair}/$norm;
	
	my $perc=int(($val)*10000)/100;
	
	$output{$pair}=$perc;
}

# ========== output ==========

open OUT, ">1-mes-$dataset-2-kk.txt";
open OUT2, ">1-mes-$dataset-2-kk-exp.txt";
for my $pair (sort { $output{$b} <=> $output{$a} } keys %output) {
	my ($a, $b)=split/\t/, $pair;
	
	my $log_x=log($output{$pair});
	my $y=$lin_a*$log_x+$lin_b;

	my $y_norm=($y-$lin_min)/$lin_full;
	$y_norm=1-$y_norm;
	
	print OUT2 "$pair\t$output{$pair}\n";
	#print OUT "$pair\t$y_norm\t$y\t$output{$pair}\t$words{$a}\t$words{$b}\t$pairs{$pair}\n";
	print OUT "$pair\t$y_norm\n";
}
close OUT;
close OUT2;
