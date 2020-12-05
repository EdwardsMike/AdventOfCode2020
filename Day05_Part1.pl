#!/usr/bin/perl
#
# Purpose: 
# Usage: 

use strict;
use warnings;
use Perl6::Slurp;

$, = '|';
$\ = "\n";

my $max_id = 0;

while ( <DATA> ) {
	my $row_code	= substr $_, 0, 7;
	my $seat_code	= substr $_, 7, 3;

	my $row		= calc_row( $row_code );
	my $seat	= calc_seat( $seat_code );
	print $row_code, $row, $seat_code, $seat;
	my $id	= ( $row * 8 ) + $seat;
	if ( $id > $max_id ) {
		$max_id	= $id;
	}
}
print "Max ID: $max_id";

sub calc_seat {
	my $code	= shift;
	my @code	= split //, $code;
	my @seats	= ( 0 .. 8 );
	foreach ( @code ) {
		if ( m/L/ ) {
			splice @seats, ( @seats / 2 );
		}
		elsif ( m/R/ ) {
			splice @seats, 0, ( @seats / 2 );
		}
		print @seats;
	}
	return $seats[0];
}

sub calc_row {
	my $code	= shift;
	my @code	= split //, $code;
	my @rows	= ( 0 .. 127 );
	foreach ( @code ) {
		if ( m/F/ ) {
			splice @rows, ( @rows / 2 );
		}
		elsif ( m/B/ ) {
			splice @rows, 0, ( @rows / 2 );
		}
		print @rows;
	}
	return $rows[0];
}

__DATA__
FBBFBBBRLR
BFFBBFFLLL
BFFBBBBRRR
BBBFBBFRLL
FFBFFFFLRL
FFBFBBBLLL
BFFBBFBLLL
FBFFFFBLLL
FBBBBBBRLL
BBFFBBFLLR
FFBFBBBLRL
FFBBBBFLLL
FBBFFBBRLL
BFBFFFFRLR
BFBBFBBLLL
FBFFBBBRRR
BBFBFBFLRR
FFBBFFFRRR
BBFFBBFLRL
FBFBBBBLRR
BFFFBFBLRL
FBFFBFFLLR
FFFBFBBRLR
BFFBBBFRLR
BFFBFFFLLR
FFBBBFFLLL
BBBFBBFRRL
BBFBFBFRLR
BFBFFBBRRL
BFFFFFFRLR
FBFBFBBLLL
BFFFBBFRLR
FBFBBBBRRR
BFBFBFBRLR
BBBFFBBLRL
FBFFBFBRLR
FBBBBBFLLR
FFBBBFBRRL
BFFBBFBRLL
BBFFBFFLLL
BFBFBBBLRL
FFBBBFBRRR
FFBBBBBRLL
BFBFBBFLRR
FFBFFBBLRR
BBBFBFFLRL
BBFBBBFLLL
BFBBFFFRLL
FBFBFBFRRR
BBFFBFFLRR
FBFBFBBRRL
BBFFBFFRLR
BBFFFFBRRL
FBFBBBFRLL
BFFFBBFRRR
BFBFBFFLLL
BBFBBFFRRR
FFBBFFBLRR
BFBBFBBRLR
FFFBFBBLLR
FBBFBBFLLR
BBBFBFBRRL
BFBBBFFRLR
BBBFBFBRLL
BBFBBBFLLR
BBFFBFFRRL
FFBFBBBLLR
FFBFBBFLRR
FBBFFBFRLL
BBBFFFBLLL
BBFBFBBLLL
BFFBFBBLRL
BBFFBFBRRR
FFFBFBBRRR
FBFBFFFRRR
FFFBBBBRRR
BFFBBFFRRL
FFBBBFBLRL
BFBBFBFLRL
FFFBBFFLLL
FBBBBFBLLR
FBBBFFBLRL
FBFBFFBLRR
FFBFBFFLLR
BFFFFFFLRL
BFFFBBBLRR
BBBFBFFLLL
BFFFBBFRLL
FBFFFFFRRR
BBFFBBFRLR
FBBFFFFRLL
FBBFBFFLLR
FBBFFFFRLR
BBFFBBBRLL
BFFBFFFRLR
FFBBFBBLLL
BFBFBFBRRL
BFFFBBFLRL
FFBBFFBLRL
FBFFFFFRLR
BFFBBBBRLL
BBFBBBFRLL
BBBFFBFRRR
FBBBBBFLRL
FFBFBBFRRR
BFFFFFBLRL
FBFBFFFRLL
BFFFBBBRLR
BFFFBBBRRR
FFBBBBBRLR
BFFFBBFLLR
BFBBBFBLRR
BBFFFFFLRR
FBBFFBFRRL
FFBBBBBLLL
FBBBBFBLRL
BFBFFBBRLR
BFFFFBBRRL
BBFBBBBRRL
BFFFFBFLRL
BBFFFBBLLR
FBFFFFBRLL
FBBBFBBRRL
FFBFBBBRLR
BFFFBFBRLR
BFBFFBFLLR
BBFBFFFRRL
FBBBFBFRRL
BFBFBBFRLL
FBBBFFFLLL
BBFBBFFRLL
BFBBBBFRRL
BBFFFBFLRR
BFFBFFBLRL
FBBBFFBRRL
BBBFFFBRLR
BFBBFBBRRL
FFBBFBBRRL
FBBFBBFRRL
BBFBFFBRRR
BFBBFFFLLL
BFFBBBFLLR
FBBBBFBRRL
BBFBFBFLLL
BFBFBBFLLR
BBFFFBBRLR
BBFFFBBRRR
FFBFFBBRLR
FFBFFBFRRL
BBFFBBBLRR
FBBBFFBLRR
FBBBFBFRLR
FBFBBFBLRR
BFFBBFFLLR
BBFBBFBRLL
FFBFFBBLLL
FBFBBBBRLR
FBFFFFFLRL
BFFBFFFLRL
BBFFFFFRLR
FBBBBBBLLL
BFFBBFFLRL
FFFBBBBLLR
FFFBBFBRRL
BFFBBBFLRR
FBBFFFFLRR
FBBFBBBLLL
FFFBFBFRLR
FFBBBBFRRL
BFBFFBBRLL
FFBBFBFLLL
BBFFFFBRRR
BFFFBFFLLR
FFBFFBFLLR
FFBFFFFRLL
FBFBBBFRRL
BBFFFBFLLL
FBFBFFFLLR
BFBBBFFLLR
BBBFBBFLLL
BBBFBFFRRR
BBFBFBFLRL
FBBFFBBRLR
BBFBFFFLRR
FBFBBFFLRR
BFFBBBFLRL
BFFBFBFRLR
FBFBFFFRRL
BFBBBBBRRR
BFBFBFBLRL
FFFBBFFLRL
BBBFBFBLRR
FFBFFFFLLL
FBBFBFBRRL
BBFBFFFLLL
FFFBFBFLLR
BFFFBFFRRR
FBBBFFFRRL
BFFBBBFRLL
FBBBFFBRLR
FBFBBFBLLL
BBBFFFFLRL
FBFFBFFRRL
BBFFFFFLLL
BBFFFFFLRL
FBFFBFBRRR
FFBFFFBLRL
FBFFFFFRLL
BFBFBFFRRR
BFFBBBBLLR
FFFBFBBRRL
FFBFBFFRRL
FBBBFFFLRR
BBFBFBFRRL
FFBFBFFRRR
BBFFFFBLLL
FBBFBFBRLR
FFBFFBFRRR
BBBFBBBLRL
BFBBFBFRRR
BBBFFFBLRR
FBBBBBFRLR
BFBFFBFRRR
BFBBFFBLRR
FFBFFBBRRR
FBBFFBFRLR
BFBBFFBRRL
BBBFBBBRLR
BBBFBBBLRR
BFBFFBFRLR
FBBBFBBRRR
BFBFFBBLRL
BBFFFBBRLL
FBBFFFFLLR
FFBFBBFLLR
BFFFFFBLLL
BFBFBFFLRR
BFFBBFBRRL
FBBBFFFRLL
FBFBFFBLRL
FFFBFFBRRL
BFFFFFFLLL
FFBBFFFRLL
FFBBBFBLRR
FFBBFFFRRL
FFFBBBFRRR
FFBFFBBRLL
BFFFFFFRLL
BBFFFBFLRL
FFBBFBBLLR
FBFBBBBLLL
FBBFFBFLLR
BFFBBFFRLR
BFFBFFBLLL
FFBBFBBLRR
BBFBBFFRRL
FBBFFBBLRR
FBBFBFFLLL
BBBFFFBRRL
BFBBFFFLRR
BBBFBBBLLL
FBBBFBFRRR
BFFBBBFRRR
BBBFFFBLRL
BFBFFFBLRL
BFFBFBBLRR
BBBFFBBRRR
BBFBBFFRLR
FFFBBBBLRL
BBFFBBBLRL
FFFBFBFLRL
FFBFBBBRRR
BFFFFFFLLR
FBFBBBBRLL
FBBBFFFRRR
BFBFFBBLLL
BFBFBFFLRL
BBFFFBFLLR
FBBFFFBRLR
FFFBBBFLRR
BFFFFBFRRR
BBFFBBFRRL
BFBFFBFLRL
FBBBFBFLLL
FBBFFBFLRL
BBFBBFBLRL
BBBFBBFLLR
BBFBFFBLRR
FBFBBBFRLR
BBBFBFFLLR
FBBFFBBLLL
BBFFFBBLRR
BFBFBBBLLR
BBFFBBBRLR
FFFBFBBLLL
FBFBBFBRLL
BBFBFFBRRL
BBFFFFBRLL
BFBFFBBLRR
BBFBBBFLRL
FBFFFFBRLR
FBFBFFBRRR
BFBBBBFRRR
BBFFBFFLRL
FBFFFFFRRL
FBFFFFBLLR
BFFBBFBLRR
BBBFFBFLLL
FBFFBFBLRR
FFBBFBFRLR
BBFBFBFRRR
BBFBFBFRLL
FBBBFBBLRL
BBBFFFFRRR
FBBBBBFLLL
BBFFBBBRRR
BFFFFBBRLR
FFBBFBBRLL
BBFBFBBLRL
BFFBFFBLRR
FBBFFFBRLL
FFFBBFBRLR
BBBFFBFLLR
BBFFFFBRLR
BFFBBFFRRR
FFBFFBFRLR
FBBFFFFRRL
BFBBBFFRRL
BFFBFBFLRR
FBBBFBBRLL
FBFFBBFRRL
BFFFBFFLRL
FFFBBFFRRR
BBFFFFBLLR
BFFBFBBRLL
BFFFBFBLLR
BBBFBBFLRR
FFBFBFFLRL
BFFBFFBRLL
FBBBFBBLLL
BFBBFBFLLL
FBFBBFFRLL
BFBFFFFLRR
FFBBFFBRRL
FBFBFBBLRR
FFFBFBBRLL
FBBFFBBRRR
FBFBBBBLLR
FBBFBFBLRR
BFFFFFBRLR
BFBBFBBRRR
BFBBBBBLLR
FFFBBFBLLR
FBBFFBBLRL
FFFBFBFRRL
BFFFFBFLLL
FBBBBBBRLR
FFBBBFFLLR
BFBBBBFRLL
FFBFBFFLRR
BFFBBFBLLR
FBFBFBBRLR
BBBFFFFLLR
FFBBBBFLLR
BFBBFFBRRR
BBFBBFFLLL
BFBBBBFRLR
FFFBBFFLRR
FFBFBBBRLL
BFBBFFBLRL
BFFBBBFRRL
FFFBFBFLRR
BFFFBBBRLL
BBBFBFBRLR
FBFFBBBRRL
FFBBBBFLRR
BFBBFBFRLL
BFBBBFFRRR
BBBFFBFRRL
BBFBFFFRLL
FFBFBFBRLL
FBBFBBFLRL
FFBBFFFRLR
FBBFFBBRRL
FBBBBFBLRR
BFFFBFFRRL
BFFFFBFRRL
BFBFBFBRLL
BFFBFBFRLL
FBFBBFBRRL
FFFBBFFRLL
BFFFFBFLRR
BFBBBBFLRR
BBFBFBBRRR
FBBBBBFRRR
BFBBBFFLLL
BFBBBFBRRR
FBFBBFFRRL
BBFBBBBLLR
BFBBFFBLLR
BFBBFBFLRR
FBFBBFFLLR
BFBFFFFLLR
BFFFBFBRRR
FBFBBFFLLL
FBFBFBFRLL
BBFBFFBLRL
BBBFFFFRRL
BFFFFBBLLR
FFFBBBBRLR
BFFFBFFLLL
BFFFBFFRLL
BFBFFBFRRL
FFBFBFBLRL
FFBFFFFRLR
BFFBBBFLLL
FBFFFBFRRL
BBFFBBBLLR
BFFBFFFRRR
BFBFFFBRLL
FFBFFBFLLL
BBFBBFBRRL
BBFBFBBRRL
BFBBFFBRLR
BBFFFBFRLR
BBBFFFBLLR
BFFBBFBRLR
BBFBFBBLLR
BBFFBBBRRL
FFFBBBFLRL
BFFBFFFRLL
FBFBFFFLRL
FBFBBBFLRL
BFBFFBFLLL
BFBFFFBLRR
BFBFFFFLRL
FBBBBFFLRL
BFFBFFBRRL
BFBBBBBLRL
BFBFBBBRLL
BBBFFBBLLL
FBBFBBBRRR
FFBBFFFLRR
FBBFFFFLRL
BBBFBFFLRR
BFBFBBFRLR
BBFBBFBRLR
FBFBFFBLLR
BFBFBBBRRL
BBFFBFBLLL
FBFFFFBLRL
FFBFBBFLLL
FBFFBFFLRR
BFFFFBFLLR
FFBFFFBRLL
FBFBBBBRRL
FFBFFFBLLL
BFBBFFBLLL
FFBBFFFLRL
FBFFFBFLRL
FBBBBBBLRL
BBBFFBBLRR
FBFBFBFRLR
BFBFBFFRLL
BFFFBBBLRL
BFFFBFBRRL
BBFFBBBLLL
FBFFFBBLRR
BFFBFBFRRL
BFFFBFBLLL
FBFBBFBRRR
BFBFBBFRRR
BBBFBFFRLL
FBBFFBFLRR
FFBBBFBLLL
BFBBBFFLRR
FFBBBFFRLR
BFFFBFFLRR
FFBBBFFRLL
FFBFBFBLLR
FBFFBFBLRL
FBFFFBBRRR
FFBFFFBLLR
FFBFFFBRLR
BFBFFBBLLR
BFBBBFBRLR
BFFBBBBLRL
BFBFFFBRRL
FBFFFBBLLL
BFFFFFFRRL
BBBFFBFLRL
FFFBBFBLRR
FBFFBBFRLL
BBFFBFBLRL
BBFBBFFLLR
FBBBFBFLRL
BBBFFBBLLR
FBBFFFBLRR
BFFFBBBRRL
BFBBFFFRLR
FFBFBBFLRL
BFFBBBBLLL
FBBBBBBRRL
FBFFBFFRLR
FBFFBFFLRL
BFFBBFBLRL
FBFFBBFLLR
BBFFFFBLRR
FBBFFBFRRR
BFFBFFBRLR
FBBBBBFLRR
BFBFFBFRLL
FBFFBFBLLR
FBFBBFBRLR
BBBFFFFRLR
FFFBFFBRRR
BBFFFBFRRL
BFBFBBFLRL
FBBFBBFRLL
FFFBBBBLRR
BFBBFBBLLR
BFBFFFBLLR
FBBFBBBRRL
BFBFFFFLLL
FBFFFBFLLL
BBFFFBFRRR
FBFFBBBRLL
FBFFBFBRLL
FFBBFBFLRR
FFFBBBFRRL
FBBFBFFLRR
FBFFBBBLRL
BFBBFFFRRR
FBBFBFBRLL
FBFFBBBLRR
FFBBBFBLLR
BFBFBFFRLR
BFFBFBBLLR
FBFFBFBLLL
FBBBFBFLLR
BFFFFBBLLL
FFBBBBFLRL
BFBBFBFLLR
BFFBFFBRRR
FBFBBFFRLR
FBFBBBFLRR
FBBFFFBRRL
BBFFBFBRLR
BFBFFBBRRR
BBFFBFFLLR
BBBFFFFLLL
FFBFBFFRLL
BFFBFBFRRR
FBBBBFBLLL
FBFBFBFLRR
FBFBBFBLLR
BFFFBBBLLL
FBBFFFBRRR
FBBBBFFRRR
FFFBBFFRRL
FFBBBFFRRR
FBBFBBFLLL
BBBFBFFRRL
BBFFBFBRLL
FBFFFFBLRR
FFBFFBFLRR
FBBBFBFLRR
BFBBBBFLRL
FFBBFBFLLR
FFBBFFBRLR
BFBFBBBRLR
BFBFFBFLRR
FBBFBFBLRL
FFFBBFBRRR
BFFFFFFLRR
BBFBFFBRLR
FBBBFFFRLR
FBBFBFFRLL
FBFBBBFRRR
FBFFBBFRRR
BBFBBFBLLR
FBFFFBBRRL
BFBFBBFLLL
FBFFFBFRRR
FBFBFBBRLL
FFBBFFBRLL
FBBBFBBRLR
FBBBFBBLLR
BFBBFBFRRL
FBFFBBFRLR
FBBFBFFRRL
BFBFBBBLLL
BFBBBFBLRL
BFFFFBBLRR
BFBBBFFLRL
FBFFFBBRLR
FFBFFFFRRR
FBBFBFFLRL
BFBFFFFRRL
BFBBFFFRRL
BFBFBFBLLR
BBFFFBFRLL
BFBBBBFLLL
BFFBBBBRLR
FBBBBBBRRR
BFFFFBBRLL
BBBFBBBRRL
BFFBFFFRRL
FBFBBBBLRL
BBFBBFBLLL
FBFFFBFRLR
FBFFFBFLRR
BBBFBBFRLR
FFBBBBFRRR
FBFBFBFLLR
FBBBFFFLRL
FFBFBFBLLL
BFFBFBFLRL
BFFBFBBRRR
FBBFFFFLLL
BBFBBBBLRL
FFFBFBFRLL
FFBBBFBRLR
BFBBBFBLLR
BFBBBBBRLL
FBFFBBFLRR
BFBBBBBLLL
FBBFBFFRRR
FBBBBBBLRR
BFBBFBFRLR
BBFFFFFLLR
BBFBBFBLRR
BFFFFFBRLL
FFBBFBBLRL
FBFBFBBLLR
BBFBFBBRLL
BFFFFBFRLL
FFFBBFFLLR
BBBFBFFRLR
BFBBBFFRLL
FBBFBBFLRR
BFBFBFBLLL
BFFBBBBRRL
BBFBBBFRRL
FFBBBBBLRR
FFBBBFBRLL
BFBBFBBRLL
FBBBFBBLRR
FFFBFBBLRR
BBFBFFFRRR
BFBFBFFLLR
BFFFBFBRLL
BBFFBFFRLL
FFBFFBFLRL
FBBBBFFRLL
FFBFBFBRRR
BBFBBBBLLL
BBFFBFBLRR
FFBBFFBRRR
FBBFFFFRRR
FFBFFBBLLR
FBFBFBBRRR
FFFBFBFLLL
FFBBFBFRRL
BFFFBBFRRL
FBFBFFBRRL
FFBBFFFLLR
BFFBBBBLRR
BFFFFFBRRL
BBFBBBBRLL
BFFFBBBLLR
BFBFFFFRRR
BBFBFFBLLR
FBFFFFFLRR
FBBBBBFRLL
BFFBFBBLLL
BBBFBBFLRL
BBFFFBBRRL
FBFBBBFLLR
FFBBBBBRRL
BFFFFFBLRR
FFBFBBFRLL
FBBFFFBLLL
FFBBFBFRRR
FBFFBBFLLL
FBBFBBFRLR
BFFFFBBRRR
BFFFBBFLRR
FBFFFFBRRL
BFBFBBBLRR
BBBFFBBRLL
BBFFBBFLLL
BFBFBBFRRL
FBBFBFBLLL
FFBFFBBRRL
FBFBBFFRRR
BFBBBFBRRL
FFBFFBBLRL
FFBBBBBLRL
FFFBBFBLRL
FBBBBFBRLL
FBBBFFBLLL
BBFFFBBLLL
BFFFFFFRRR
BFBBBBBRRL
FBFBFBFRRL
FBBBFFBRLL
BBBFBFBLRL
FBBBBFFRRL
FBFFBFFRRR
FBFFBFFRLL
FBFBFFFLLL
BBFBBFBRRR
FFBBFFBLLR
BBBFBBFRRR
BBBFFBFRLR
FFBFFFFRRL
BFFFBFBLRR
FBBBFFBRRR
FFFBBBFLLL
FBFFFBBRLL
BBFBBFFLRL
FFBFBBBLRR
FFBBBFFLRR
FFBBBBFRLL
FFFBFBBLRL
BBBFFBBRLR
BBBFFFFRLL
FBBFFBFLLL
BFBBBBFLLR
FBFBFBFLLL
FBFFFBFLLR
BFBBFFFLRL
FFBFBFFRLR
BFFBFBBRRL
FBFFFFFLLL
BFFFFBBLRL
BFBBBFBLLL
BBFFBFBRRL
BBFBBBFRRR
FBBBFFFLLR
FFFBBBFRLL
BFBBBBBLRR
BBFFFBBLRL
BBFBFBBLRR
BBFBFBBRLR
FBBBBFFRLR
BBBFBFBRRR
BBBFFFBRRR
FBBFBBBRLL
FBFBFFFLRR
FFBBBFFLRL
FBBBBFBRLR
BFFBFBFLLL
BFBFBFFRRL
BFBFFFFRLL
BBBFFBBRRL
FBBBFBFRLL
BFBBFBBLRR
BBBFBBBRLL
BBBFFBFLRR
FBBFFFBLLR
BFBFBBBRRR
BBBFBBBRRR
FBFFBBBLLR
FBFBFFBRLR
FFBFFFBRRR
FBFFFBBLLR
BFFBFFFLLL
FBFBFFBLLL
FBFBBBFLLL
FFBFBFFLLL
FFBFBBFRLR
FFBFFFFLRR
FFBBFBBRRR
FFBFBBBRRL
BFBBBFBRLL
BBBFFFBRLL
FBFFBFFLLL
BBFFBFFRRR
FFFBBFBRLL
BFFBFFFLRR
FBBBBBFRRL
FFBFBBFRRL
BBFFFFFRRR
BFFFFFBLLR
FBFBFFBRLL
BFBFFFBRLR
FFBBFBFRLL
BBFBBBFRLR
FBFBBFBLRL
FFBFFFBLRR
FBFBFFFRLR
BFFBBFFRLL
FBBFBFBRRR
FFBBBBBRRR
FBBFFBBLLR
FFFBBBBRRL
FFFBBBBRLL
BBFFFFFRLL
BBFBBBBRRR
BFFBBFBRRR
BFBBFBBLRL
BBFBBBBRLR
FBBBFFBLLR
FBBFBBBLRR
FFBBBFFRRL
BBFBBBBLRR
FBBFBBFRRR
FFBBFBFLRL
FBBFBBBLRL
FBFFFFBRRR
FFBBFFFLLL
BBBFFFFLRR
FBFBBFFLRL
FFFBBFFRLR
FBBBBFFLLR
BFBFBFBLRR
FBBBBFFLRR
BBFBFFFLLR
FFBBFBBRLR
BFFBBFFLRR
FFBFFBFRLL
BBFBBFFLRR
BBFBFBFLLR
BBFBFFBRLL
FFBFBFBRRL
BFBBFFBRLL
FFFBBBFLLR
FBFFBBBLLL
FFFBBBFRLR
FFBBFFBLLL
FFBBBBFRLR
BBFFFFBLRL
FBBBBFBRRR
BFFFBBFLLL
BBBFBBBLLR
BBFBFFFRLR
FBFFFBFRLL
BBFBBBFLRR
BBFBFFFLRL
FFBFFFFLLR
FBBFBBBLLR
BBFFBBFRRR
BBBFBFBLLL
FBBFBFFRLR
FBFFBBFLRL
FFFBBBBLLL
BFBFFFBLLL
FBBFBFBLLR
BBFBFFBLLL
FFFBBFBLLL
BFFBFBFLLR
FFBFBFBRLR
BFFBFBBRLR
FFBFBFBLRR
FBFFFBBLRL
BBFFBFBLLR
BFBFFFBRRR
BFFFFBFRLR
FBFBFBBLRL
BFFFBFFRLR
BBFFBBFRLL
BFBBBBBRLR
BFBFBFBRRR
BBFFBBFLRR
FFBBBBBLLR
FBFFFFFLLR
FBFBFBFLRL
FBFFBBBRLR
BBBFBFBLLR
BFFBFFBLLR
FBBBBFFLLL
BFBBFFFLLR
FFFBFBFRRR
FFBFFFBRRL
FBBBBBBLLR
FBBFFFBLRL
BBBFFBFRLL
FBFFBFBRRL
BBFFFFFRRL
