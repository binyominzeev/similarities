#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

# ======== initialize ========

my $mode="cn";
my $log_cn_max=log(4532);

#my $mode="kk";
#my $log_cn_max=log(36901);	# igen, betolteni elegansabb lenne, de egy plusz lepes, egyelore felesleges

# ======== load words ========

my %words;
my @words=split/\n/, `cat aps-$mode-words.txt`;
map { $words{$_}="" } @words;

# ======== initialize ========

my %words_cn;
my $i=1;

open IN, "<aps-$mode.txt";
while (<IN>) {
	chomp;
	my ($a, $b, $val)=split/\t/, $_;
	
	if (exists $words{$a}) {
		$words_cn{$a}=log($val)/$log_cn_max;
		delete $words{$a};
	}

	if (exists $words{$b}) {
		$words_cn{$b}=log($val)/$log_cn_max;
		delete $words{$b};
	}
	
	$i++;
	
	if (scalar keys %words == 0) { last; }
}
close IN;

print "$i\n";

# ======== output ========

open OUT, ">aps-$mode-perc.txt";
for my $word (sort keys %words_cn) {
	my $perc=int($words_cn{$word}*10000)/100;
	
	print OUT "$word\t$perc\n";
}
close OUT;
