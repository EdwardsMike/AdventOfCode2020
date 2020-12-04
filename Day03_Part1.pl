#!/usr/bin/perl
#
# Purpose: 
# Usage: 

use strict;
use warnings;
use Perl6::Slurp;

$, = '|';
$\ = "\n";

my $pos	= 0;
my $x	= 3;
my $y	= 1;

my @hill    = slurp \*DATA, { chomp => 1 };
my $trees   = 0;

for ( my $i = 1; $i < @hill; $i++ ) {
    my $pat = $hill[$i];
    my $len = length $pat;
    $pos    = $pos + $x;

    if ( $pos > $len - 1 ) {
	# reset pos
	$pos	= $pos - $len;
    }
    #print $pos, $len, $pat;
    
    if ( ( substr $pat, $pos, 1 ) eq '#' ) {
	( substr $pat, $pos, 1 ) = 'X';
	printf "%2d => %31s\n", $pos, $pat;
	$trees++;
    }
    else {
	( substr $pat, $pos, 1 ) = 'O';
	printf "%2d => %31s\n", $pos, $pat;
    }

}

print $trees;



__DATA__
...#...###......##.#..#.....##.
..#.#.#....#.##.#......#.#....#
......#.....#......#....#...##.
...#.....##.#..#........##.....
...##...##...#...#....###....#.
...##...##.......#....#...#.#..
..............##..#..#........#
#.#....#.........#...##.#.#.#.#
.#..##......#.#......#...#....#
#....#..#.#.....#..#...#...#...
#.#.#.....##.....#.........#...
......###..#....#..#..#.#....#.
##.####...#.............#.##..#
....#....#..#......#.......#...
...#.......#.#..#.........##.#.
......#.#.....###.###..###..#..
##..##.......#.#.....#..#....#.
..##.#..#....#.............##.#
....#.#.#..#..#........##....#.
.....####..#..#.###..#....##..#
#.#.......#...##.##.##..#....#.
.#..#..##...####.#......#..#...
#...##.......#...####......##..
...#.####....#.#...###.#.#...#.
....#...........#.##.##.#......
.....##...#.######.#..#....#..#
.#....#...##....#..######....#.
...#.....#...#####.##...#..#.#.
.....#...##........##.##.##.###
#.#..#....##....#......#....#.#
......##...#.........#....#.#..
###..#..##......##.#####.###.##
#.....#..##.##....#...........#
##..#.#..##..#.#.....#......#..
.#.##.#..#.#....##..#..#....#..
.#......##..##.#...#..#.......#
#....##.##..###..###......##.#.
....###..##.......#.###.#....#.
..##........#........##.....#..
.#..#.....#...####.##...##.....
....#.#.#.....#.##..##.....#..#
..............#.....#...#.....#
.#.....#......###...........#.#
.....#.#......#.##..#..........
.#......###............#.#.##..
.#.#....##.#..###.....#.##..#.#
.......#.#.#..#..#..#...##..#.#
.#.###...##.#.#.####.#.#...#...
...#.#....#......##.##.#.......
#...#.....##....#........##....
.....###...#.##.#......##.#..#.
..#...##.##.###..#..#......####
.#.##.#..#.##..##..........##..
..#.#.#..#.#.....#...###.....#.
..#..#.#....#.##.............##
.......#..###..#.#...#.....##.#
####.#.#......#..#.##.........#
..........#.....#..##......###.
..#..............#...#..##.....
......#.#.#..#.##.....####..##.
.##.#..#.#....#.......#..#.....
..#..#..#.##.#....###.#.#.#.#.#
.....#....#......###..#........
#.#.#..#...###.....#......#.##.
...#.#....#.#......#........#..
..#...###.#...#..#....##...#..#
.###.##..#..#...###.#..#.####..
#....#..##..##..#......#...##..
#.#..#...#..#...###..#.#.##....
##....#....##.####...#.#.###...
##.#...#.......#.##.##....#...#
..#.#..........#..#.#.#....#..#
..#........#...#....#....#....#
..#..#....#.......#........#...
......#....#....##.#....#.#.##.
.##...###.##.##....##.#...###..
.....##..#.#.....###..#.....###
....##.#.##...##..##........#..
#...#..##.#.#....#......#...#..
.###.##.#........#.####....#...
#.##.....#..#...#..##.##..#.#..
.....#.#..#....#..#...##.##.#..
.#......#####...##...#.#.###.#.
#......##....#.....#......##.#.
#.#.##.###.#......#####..#.....
........###.#...#..#.#........#
....#....###..#.##.#...#....#..
..........#..#.#....#...#.#...#
#.##......###.#.#.#....####...#
...#.#....#........##.#.....##.
.....##..#.#.#..###...##...#...
#...#...#....#....##........#..
.....#.........##.#......#..#..
#.....##..#.###.....#....##.##.
...#..#..#.#........##...##.#.#
..#..##.###.....#.#.....###.##.
..###.........#...##.....###...
...###...##.#...##....##.......
.#.#..#...###..#.#....#....#...
##..#.......#....#.#...#..#..#.
..#......#....####..##..#.###.#
..#.......##........#.#.#..#...
.#.......#.##.#.##.#.......#..#
###...#...#...#...#..#...#...##
..#..........#..###........##..
.##..#....##......##........#.#
......#.##......#......##...#.#
.#.#....#.#.#........#......#..
.#.#..#....####..##...##....#..
.#...##..#..#..#####....##.#...
.##.#.#...#...#.#...#.##.#...#.
###.#...##..#.###.#.....#.##.#.
#.....#.###.#.#...#..#....#.#..
..##..#....#......#.........###
.#...#...##......#...#.####....
..#.##...##..............#.#..#
..#......#..##...........#..#.#
..#####...#..#.......##...###..
..##..#....#.#...###.#...#.....
..#....#..#.#.......#..#.#.#...
.##..#.#.....##....#.......#...
...#.#..###...##....#....##..#.
.....##..#...##.####....##...#.
.......#.........#...#.##..####
........###..#..#.##.###..#....
.#.#..#.##.##.........#...#....
.###......#.....#....##....####
.##..##...........#.....#.....#
#.#.#.#.#.#.##..#.#.#..#.##....
.##.##...##..#....##..###..####
#..##.#......#...###.........#.
#..#...#..##..#..##.....##...#.
#...##..#...##.#.###.#...#.....
.###.....#.......#...#.##.###.#
..........#.#......#...###...##
..##....#.#..#....#.###...#..##
#.#..#....##.##..##.........##.
#.....#.##.###.#..#....##...#..
...#........##...#..###..######
#..#.#.#.#...#....#....###.#..#
...##.##.##.....##..#........#.
..#.#....#..#.......#...##.##.#
###.##.......##..#.####...#.#..
....#.#.....##.....#.#.##...#..
.#..##..#.....#.#..#...#..#..#.
.###....##...#......#.....#....
##.##.###......#...#...###.#...
#...#.##...#.#....##.....####..
#.#.#.#...###...##.............
..#....#.....##.#...#......#...
....#...#......#...#..#...#.#..
.###..#.....#..#...#....#...#..
..#...#.#..###.......#..#.#...#
#...###.##.....#....#..#.#..##.
...#.##.#.##......#.#.#.##.....
........####...##...##..#....#.
.#.#....#....#.#...##.###...##.
#.#...###.#.#.#....#....#.#....
.####.#..#.#....#..#.#..#..#...
#####...#...#...#....#.#.#..##.
..###.##.###...#..........#.##.
##.....#...#....###..###.#.#.#.
#..##.#..#..#..#...#.#...###..#
##....#.#...##......#.#...#...#
.##..........#.#....#...#.##..#
....#....####.#.####......#.###
..##.#.....####.#.####.......#.
#.##.##.#.....#.##......##...#.
......###..#.....#.....##......
..#..#....#.#...#.....#......##
##..#..#..###.#.#..#..##.....#.
#....#.#.....#####...#.#.......
.....#..#....#.#.#..#...#...#..
............#.##......##.##.#.#
....#...#.#........###....#....
..#..#...###.#....##..#..###.##
#.##....#...#.....##..#.##.#...
...##..###...#.#.....##.#......
.#..#.##.#####..#.......#..###.
...#.##...###.....####.#.#.....
.#......##.#.#.#.#.##.#.....#..
..#.##.#..##.......#.#.....##..
..................#....#...#...
.##.#..#.#.#..#.......#.#..##.#
....#........#......#..####..#.
#...#...##..##.#..#.......##...
#..#..#..#..#........####..#.#.
..#.#......#..#.##.##.#.#...#.#
...#..#......#.#.###.#.##..##..
..#...##.....#..#...##..#.#....
#.........#....#..#....##.##..#
..#..#.#....#..#...#.##.....#..
...#..#...#.#.....#..##..#.#...
....#........#.#....##..##..#..
#.....#.#..#.......#.##.....#..
.#.###.###...##...##..###...#..
.##.##.......#.#......#.....#.#
...#....##....#..#..........#.#
..#.##.........#.#.....#.....#.
...#.##..##.......##..##...#...
#.##......##.##..#.....##...##.
#.#.#..##...#.#............#.#.
....#.....#......##...#.#.....#
...#.#......#.#...###.......#..
......##..###....#.#...#.#####.
..#..#.#.#...##.#...###..##..#.
##.##.#.#.##.#..#....#...#...#.
#..#....######.##.#...#...#.#..
.#..#.##....#..#.#.......#....#
....#....#......##....##.#.#...
.###......#..#..#.......####..#
.#.#.....#..###...........##...
.##..##.##.....####..#..#..##..
..#..##.#......#...###.##..#.#.
....##..#.....###..#.##....##.#
#..#......#....#.........#.....
.#...#.....#.#..#..##....#.....
.##..#...#..##.#..#...........#
..#..##........##.......#..#...
#.....#....#....#.#.#...##.#...
...#...#.#.#..#.##.#.#...#.....
..#..#.#....#....###....#.#.#..
...###..#...#..#....#.....#....
...#...#.#..#.....#...###......
##......#..........#.#.#..#.#.#
....#.....#.....#..#..#.#.#.#..
...####...#.##...#.#..#....#.#.
#.##........##.............#.##
#.#.#.#.#.....................#
.#.###....#..##.##.##....#.....
#.#...#.####.###...#..#..#.#...
.##...#..###.......##..#.#.....
#.#.#.#...#...#.##.....#.......
.##.#.#.#......####..#.#.......
###..........#......#...##...#.
.........##...#.##...#.#.......
...#.#.....#...#..#...#..##..#.
.#..###...#.#.........###....#.
##..#...#........#.........##..
.....#...#.#...#.#.#...........
..#....##...#.#..#..#.##....##.
.##....#.#.....##.#..#..#...##.
..##......#.#...#.#.......##.#.
##...#..#...##.#........#.##...
#......#.##..#.#..#.###.......#
#.#...#.....#.#......#.#.#.....
#.....#..#.......#....##.#.#..#
###.#....#..##.#.##....#....#..
#.##.##....#.#..#.#...#....#...
####...#####...#.....#....##.#.
....#.#...#.#.##.#.#.##.#.#.###
#.....##.#.....#.#......#.#..#.
.#....##.#..#........#...##.#..
......#...#....##....##....##..
..###.....#....##.#...#..#.....
#....##...##.##..##.#...#...#..
#..#...#...#.#....##..#.#....#.
......................#.....#..
.#..#...#.........#....##...###
.##.#.#...##...#...#...#..#....
.#.###....#.#............##..#.
###..##.#.#.#.#....##...#......
.##................####...##.##
.#.#.........##....#.#.##.##.#.
....#...#...#...##...#.##.#..#.
.#.#........#..##.....#..#....#
##.#..#.#....#.....#...#...#...
.#...##....#.....##....#..#.#.#
####.....#..#....#......###.##.
##..##.#....###.....#...#......
.##.#...#.....#.#..#.#..#.#...#
.....#.#..#..#..###.#...###.#..
.#.#.##.#..#.#..#...#..#.......
..#.....#....#.##.##.##.......#
.#..##....###...#..............
#....#...#.#.......#....##.#...
....#.#..##.#....#..#.#....#.#.
#.........##...#.#.............
#.#.......##.....#...##..##.#.#
.......#....#..##...#..#######.
.#.#...##........#..#.....#.#..
.#.......#..#......#.##.##...##
.........#............#....#..#
.#......#...##...##...#....###.
.........#...#.#.###.......#...
###.#..#.#.#.#......##...#.#...
.#.........##.#....###....#.#..
#.#....#..#.##.#..#....##...#..
###.#...#..#..##........#.###..
.....#....#..#........#..#.##.#
..#.....##......#....#..#.#.#..
.#.........#.....#.....#.......
......#....#.###..#.#....#....#
..#.#..#.#.###.........#..#..#.
..#..#.#.#.........#....##.#.#.
#.......#........##...##....#..
##..#..#...###...#..##..#..#.#.
##..#..#....#.#..##..#..#.#..#.
..##.....##.#..#.#........###..
..#.#..#..##........#...#....##
.##..#....##..#..#..#..#.#....#
#....#.....##........#.....#.##
......#....#.#..#......#.##....
.......#..#..#......##.........
......#...#..##.....#......#..#
#..#..#....##....#........##..#
##....#...#.#.....#####........
...#.#..#.#.##.#.##..##...#....
..#..#..#..#..#....#..#..##...#
.#.....#....##.##....##.....#..
#...#.....#.....#.#...#.#....#.
.###...#..##....#..#...#.###...
....#..##..#.......#.##.##..###
#.......##.....#.......#.#...##
#.....#.#.#....#.#......#.#.#..
..##.....#..###......##........
.....#...#..##....#......#.....
#..#..#....#.#...#..###.......#
.....#.....#....#..#...#.#..##.
#####........#...#..#..##..#.#.
.#..#...#.##....#.#..#......###
#.###.#..#.....##..##....#...#.
.#...#.#####....##..........##.
