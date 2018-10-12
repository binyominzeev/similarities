#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;

# ========== parameters ==========

my $file="aps-records.txt";

# ========== stopwords ==========

my %stopwords;
my @stopwords=split/\n/, `cat stopwords-en.txt`;
map { $stopwords{$_}=""; } @stopwords;

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
			grep { !exists $stopwords{$_} }
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


# ========== output ==========

open OUT, ">aps-kk.txt";
for my $pair (sort { $pairs{$b} <=> $pairs{$a} } keys %pairs) {
	print OUT "$pair\t$pairs{$pair}\n";
}
close OUT;
