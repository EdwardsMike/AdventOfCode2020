#!/usr/bin/perl
#
## Purpose: 
#Usage: 

use strict;
use warnings;
use EGA::Utils;
use List::Util;
use Getopt::Long;



$|++;
$, = "|";
$\ = "\n";

my $pattern	= "#..###....#.";
my @pattern	= split //, $pattern;
use InfinitelyLoopingArray qw( );

tie my @dow_lookup, InfinitelyLoopingArray::,
   @pattern;

printf "%3d %s\n", $_, $dow_lookup[$_]
   for 0..30, 125;
