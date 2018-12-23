#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

# ======== initialize ========

my $dataset="1-aps";

#my $mode="1-cn";
#my $mode="3-td";
my $mode="4-oc";

# cut -f3 1-mes-1-aps-3-td.txt | pdf.pl
# 
# --> 17 a legnagyobb ertek, az mappolando 0-ba, 0 pedig 100-ba, linearisan
#my $max_val=17;

my %max_val=(
	"1-cn" => 61,
	"3-td" => 17,
	"4-oc" => 71
);

# ======== initialize ========

my $max_val=$max_val{$mode};

open IN, "<1-mes-$dataset-$mode.txt";
open OUT, ">3-pr-$dataset-$mode.txt";
while (<IN>) {
	chomp;
	my ($a, $b, $val)=split/\t/, $_;
	
	#my $perc=int((1-$val/$max_val)*100);
	my $perc=int(($val/$max_val)*100);
	print OUT "$a\t$perc\n";
}
close IN;
close OUT;
