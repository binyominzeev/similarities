#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Term::ProgressBar::Simple;

use List::Util qw(sum max min);

# ======== parameters ========

my $wd=5;
my $ht=9;

my $categ_wd=$wd+3;

# ======== initialize ========

my $dataset="1-aps";

# ========== output ==========

open OUT, ">1-mes-$dataset-3-td-3-box.txt";
open IN, "<1-mes-$dataset-3-td-2-pca.txt";
while (<IN>) {
	chomp;

	my @line=split/\t/, $_;
	my $word=shift @line;

	my $code=produce_code($wd, $ht, \@line);
	my $categ=produce_code($categ_wd, 2, \@line);		# same as $code, just 0-1 seq
	
	print OUT "$word\t$code\t$categ\n";
}
close OUT;
close IN;

# ========== functions ==========

sub my_avg {
	return sum(@_)/(scalar @_);
}

sub produce_code {
	my ($wd, $ht, $word)=@_;
	
	my $code="";
	my @current_box;
	
	my $max=max (@$word);
	my $min=min (@$word);
	
	for my $val (@$word) {
		push @current_box, $val;
		if (@current_box >= $wd) {
			#my $current_val=my_avg(@current_box)/$max;
			my $current_val=min_max_norm($min, $max, my_avg(@current_box));
			$code.=int($current_val*$ht);
			
			@current_box=();
		}
	}

	if (@current_box > 0) {
#		my $current_val=my_avg(@current_box)/$max;
		my $current_val=min_max_norm($min, $max, my_avg(@current_box));
		$code.=int($current_val*$ht);
	}
	
	return $code;
}

sub min_max_norm {
	my ($min, $max, $val)=@_;
	return ($val-$min)/($max-$min);
}
