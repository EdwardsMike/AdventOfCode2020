#!/usr/bin/perl
#
# Purpose: 
# Usage: 

use strict;
use warnings;
use List::Util qw( product );
use Perl6::Slurp;

$, = '|';
$\ = "\n";

my @hill    = slurp \*DATA, { chomp => 1 };
my @choices	= ( [1,1], [3,1], [5,1], [7,1], [1,2] );
my @trees;

foreach my $xy ( @choices ) {
    my ( $x, $y )   = @{ $xy };
	print STDERR "$x, $y";

    my $pos		= 0;
    my $trees   = 0;

	for ( my $i = $y; $i < @hill; $i += $y ) {
	    my $pat = $hill[$i];
	    my $len = length $pat;
	    $pos    = $pos + $x;
	
	    if ( $pos > $len - 1 ) {
			# reset pos
			$pos	= $pos - $len;
		}
		print $i, $pos, $len, $pat;
	    
	    if ( ( substr $pat, $pos, 1 ) eq '#' ) {
			$trees++;
	    }
	}
	push @trees, $trees;
}

print @trees;
my $total	= product @trees;
print $total;



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
