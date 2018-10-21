#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;

use Scalar::Util qw(looks_like_number);
use List::Util qw(sum max);

use PDL;
use PDL::Matrix;
use PDL::Stats::GLM;

my $m = mpdl [[0,1,1,1,3,4,5,7,8],
[0,0,0,0,1,2,4,5,8],
[0,0,2,1,2,2,5,4,7],
[0,1,1,2,3,4,4,5,6]];

my ($u, $s, $v) = svd($m);
my ($u, $s, $v) = svd($m->transpose);

print $u;

exit;

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

my %categ_count;

open IN, "<1-mes-$dataset-3-td-diagrams.txt";
while (<IN>) {
		chomp;
		my ($word, $code, $categ)=split/\t/, $_;
		
		$categ_count{$categ}++;
}
close IN;

print scalar keys %categ_count;
