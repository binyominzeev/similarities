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

my $pca = Statistics::PCA->new;

# ========== process ==========

my $data = [
	[qw/0 1 1 1 3 4 5 7 8/],   # Var1
	[qw/0 0 0 0 1 2 4 5 6/],   # Var2
	[qw/0 0 2 1 2 2 5 4 7/],   # Var3
	[qw/0 1 1 2 3 4 4 5 6/],   # Var4
];

my @data;
open IN, "<1-mes-$dataset-3-td-svd.csv";
<IN>;

while (<IN>) {
	chomp;

	my @line=split/,/, $_;
	my $word=shift @line;
	push @data, \@line;
}
close IN;


#$pca->load_data ( { format => 'table', data => $data, } );
$pca->load_data ( { format => 'table', data => \@data, } );

#$pca->pca( { eigen => 'M' } );
$pca->pca( { eigen => 'C' } );
#$pca->pca;

my @list = $pca->results('full');
for my $i (@list) {
    print qq{\nPC rank: $i->[0]}
          . qq{\nPC stdev $i->[1]}
          . qq{\nPC proportion of variance $i->[2]}
          . qq{\nPC cumulative variance $i->[3]}
          . qq{\nPC eigenvalue $i->[4]}
    }
exit;

# ======== parameters ========

my $wd=5;
my $ht=9;

my $first_year=1965;
my $last_year=2009;


my %categ_count;

open IN, "<1-mes-$dataset-3-td-diagrams.txt";
while (<IN>) {
		chomp;
		my ($word, $code, $categ)=split/\t/, $_;
		
		$categ_count{$categ}++;
}
close IN;

print scalar keys %categ_count;
