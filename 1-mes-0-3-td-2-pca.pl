#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;

use Scalar::Util qw(looks_like_number);
use List::Util qw(sum max);

use Statistics::PCA;

# ======== initialize ========

my $dataset="1-aps";
my $file="aps-records.txt";

my $cum_eigen_limit=0.95;

my $pca = Statistics::PCA->new;

# ========== load data ==========

my @data;
my %data;

open IN, "<1-mes-$dataset-3-td-1-norm.txt";
while (<IN>) {
	chomp;

	my @line=split/,/, $_;
	my $word=shift @line;
	push @data, \@line;
	
	$data{$word}=\@line;
}
close IN;

# ========== calculate PCA ==========

$pca->load_data ( { format => 'table', data => \@data, } );
$pca->pca;

my @list = $pca->results('full');
my $max_rank=0;

for my $i (@list) {
	if ($i->[3] >= 0.95) {
		$max_rank=$i->[0];
		last;
	}
}

my @vec=$pca->results('eigenvector');

# ========== transform coordinates ==========

open OUT, ">1-mes-$dataset-3-td-2-pca.txt";
for my $word (sort keys %data) {
	my @line=@{$data{$word}};
	my @out_vec;
	
	for my $i (0..$max_rank-1) {
		my $out_val=0;
		for my $j (0..$#{$vec[$i]}) {
			$out_val+=$vec[$i]->[$j]*$line[$j];
		}
		
		push @out_vec, my_round($out_val);
	}

	print OUT "$word\t";
	print OUT join "\t", @out_vec;
	print OUT "\n";
}
close OUT;

# ========== function ==========

sub my_round {
	my $val=shift;
	return int($val*10000)/100;
}

