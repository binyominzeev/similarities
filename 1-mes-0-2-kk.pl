#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;
use List::Util qw(sum max min);

# ========== parameters ==========

my $file="aps-records.txt";

my $n_per_k=41842.8;

my $lin_a=-2.8;
my $lin_b=24.4;

my $lin_min=-7.85;
my $lin_max=30.85;

my $lin_full=$lin_max-$lin_min;

# ========== top words ==========

my %words;
my @words=split/\n/, `head -n2700 0-wdc-1-aps.txt`;
map { /\t/; $words{$`}=$'; } @words;

# ========== loading %id_nodes ==========

print "loading %id_nodes...";
#my %id_nodes;
my %nodes_id;

open IN, "<aps_nodes.txt";
while (<IN>) {
	chomp;
	my ($id, $node)=split/\t.*\//, $_;
	#$id_nodes{$id}=$node;
	$nodes_id{$node}=$id;
}
close IN;
print "done.\n";

# ========== loading %nodes ==========

print "loading %nodes...";

my %nodes;
my $progress=new Term::ProgressBar::Simple(463347);

open IN, "<$file";
while (<IN>) {
	chomp;
	my ($node, $year, $title)=split/\t/, $_;
	
	if (exists $nodes_id{$node}) {
		my @szavak=$title=~/[a-zA-Z]+/g;
		@szavak=map { $nodes{$nodes_id{$node}}->{$_}="" }
			grep { exists $words{$_} }
			map { lc $_; } @szavak;
	}
	
	$progress++;
}
close IN;
print "done.\n";

# ========== loading %pairs ==========

print "loading %pairs...";

my %pairs;
$progress=new Term::ProgressBar::Simple(4710547);

open IN, "<aps_edges.txt";
while (<IN>) {
	chomp;
	my ($from, $to)=split/\t/, $_;
	
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

open OUT, ">1-mes-1-aps-2-kk.txt";
for my $pair (sort { $output{$b} <=> $output{$a} } keys %output) {
	my ($a, $b)=split/\t/, $pair;
	
	my $log_x=log($output{$pair});
	my $y=$lin_a*$log_x+$lin_b;

	my $y_norm=($y-$lin_min)/$lin_full;
	$y_norm=1-$y_norm;
	
	#print OUT "$pair\t$y_norm\t$y\t$output{$pair}\t$words{$a}\t$words{$b}\t$pairs{$pair}\n";
	print OUT "$pair\t$y_norm\n";
}
close OUT;
