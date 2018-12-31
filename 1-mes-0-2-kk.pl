#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;
use List::Util qw(sum max min);

# ========== parameters ==========

my $dataset="1-aps";
my $file="aps-records.txt";
my $first_year=1965;
my $last_year=2009;
my $word_count=2700;
my $line_count=463347;

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

#my $dataset="5-zeit";
#my $file="zeit_nodes.txt";
#my $first_year=1965;
#my $last_year=2014;
#my $word_count=3200;
#my $line_count=891431;

# ========== top words ==========

my %words;
my @words=split/\n/, `head -n$word_count 0-wdc-$dataset.txt`;
map { /\t/; $words{$`}=$'; } @words;

# ========== loading %nodes ==========

print "processing $dataset... ($line_count)\n";

print "loading %nodes...";

my %nodes;
#my $aps_nodes=aps_nodes();

my @results=split/\n/, `cat $file`;
my $progress=new Term::ProgressBar::Simple($line_count);

#open IN, "zcat $file|";
#open IN, "<$file";
#while (<IN>) {
for (@results) {
	my ($id, $year, $title)=split/\t/, $_;

#	$year=substr($year, 0, 4);
	
#	if ($first_year <= $year && $year <= $last_year && exists $aps_nodes->{$id}) {
	if ($first_year <= $year && $year <= $last_year) {
		#my @szavak=$title=~/[a-zA-ZöüäÄÖÜß]+/g;
		my @szavak=$title=~/[a-zA-Z]+/g;
#		@szavak=map { $nodes{$aps_nodes->{$id}}->{$_}="" }
		@szavak=map { $nodes{$id}->{$_}="" }
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
#$progress=new Term::ProgressBar::Simple(4710547);	# aps
#$progress=new Term::ProgressBar::Simple(108993629);	# patent
$progress=new Term::ProgressBar::Simple(186046);	# zeit

#open IN, "zcat patent_edges.gz|";
open IN, "<zeit_edges.txt";
while (<IN>) {
	chomp;
	my ($from, $to)=split/\t/, $_;
	
	$progress++;

	if (!$from || !$to || !exists $nodes{$from} || !exists $nodes{$to}) { next; }
	
	my @from_szavak=keys %{$nodes{$from}};
	my @to_szavak=keys %{$nodes{$to}};
	
	for my $x (@from_szavak) {
		for my $y (@to_szavak) {
			if ($x ne $y) {
				$pairs{"$x\t$y"}++;
			}
		}
	}
}
close IN;

# ========== output ==========

open OUT, ">1-mes-$dataset-2-kk-raw.txt";
for my $pair (sort { $pairs{$b} <=> $pairs{$a} } keys %pairs) {
	print OUT "$pair\t$pairs{$pair}\n";
}
close OUT;

# ========== functions ==========

sub aps_nodes {
	print "loading %id_nodes...";
	my %nodes_id;

	open IN, "<aps_nodes.txt";
	while (<IN>) {
		chomp;
		my ($id, $node)=split/\t.*\//, $_;
		$nodes_id{$node}=$id;
	}
	close IN;
	print "done.\n";
	
	return \%nodes_id;
}


