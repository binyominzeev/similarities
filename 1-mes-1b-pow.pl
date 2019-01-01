#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;
use List::Util qw(sum max min);

# ========== parameters ==========

#my $dataset="1-aps";
#my $line_count=1207720;

#my $dataset="4-patent";
#my $line_count=6019542;

my $dataset="5-zeit";
my $line_count=837223;

#my $measure="1-cn";
my $measure="2-kk";
#my $measure="4-oc";

# ========== parameters ==========

print "determining alpha...";
my ($alpha, $p_val)=split/ /, `cut -f3 1-mes-$dataset-$measure-raw.txt | Rscript power-fit.r 2> /dev/null`;

print "$alpha (p_val=$p_val)\n";

print "determining pdf...\n";
my @pdf=split/\n/, `cut -f3 1-mes-$dataset-$measure-raw.txt | ~/pdf.pl 2> /dev/null`;

print "processing $dataset, $measure... ($line_count)\n";

my ($one, $first_val)=split/ /, $pdf[0];
my ($max, $last_val)=split/ /, $pdf[-1];

my $max_val=log($first_val);
my $min_val=log($first_val*($max**(-$alpha)));
my $support=$max_val-$min_val;

#print "$first_val ($min_val, $max_val, $support)\n";
#exit;

my $progress=new Term::ProgressBar::Simple($line_count);

open IN, "<1-mes-$dataset-$measure-raw.txt";
open OUT, ">1-mes-$dataset-$measure.txt";
while (<IN>) {
	chomp;
	my ($a, $b, $val)=split/\t/, $_;
	
	my $est_y=$first_val*($val**(-$alpha));
	my $log_est=log($est_y);
	my $norm=($log_est-$min_val)/$support;
	$norm=1-$norm;
	
	print OUT "$a\t$b\t$norm\n";

	$progress++;
}
close IN;
close OUT;

