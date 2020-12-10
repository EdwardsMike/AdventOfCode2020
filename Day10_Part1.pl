#!/usr/bin/perl
#
# Purpose: 
# Usage: 

use strict;
use warnings;
use Perl6::Slurp;
use List::Util qw( uniq );

$, = '|';
$\ = "\n";

my %ADAPT;
my @data    = slurp \*DATA, { chomp => 1 };
$ADAPT{ $_ }++ for @data;
my @adapters	= sort { $a <=> $b } keys %ADAPT;

my $builtin = $adapters[-1] + 3;
my $rating  = 0;

my $jolt1   = 0;
my $jolt3   = 1;    # Device's builtin counts!

while ( $rating < ( $builtin - 3 ) ) {
    $rating = find_adapter( $rating );
    print "Rating: $rating";
}

print "Built-in adapter $builtin";
print "Rating: " . ( $rating + 3 );

printf "Jolt 1: %d\nJolt 3: %d\nAnswer: %d\n", $jolt1, $jolt3, $jolt1 * $jolt3;

sub find_adapter {
    my $rat = shift;
    print sort { $a <=> $b } keys %ADAPT;
    my $rat1	= $rat + 1;
    my $rat2	= $rat + 2;
    my $rat3	= $rat + 3;
    if ( grep { /^$rat1$/ } keys %ADAPT ) {
	print "Using adapter $rat1";
	delete $ADAPT{ $rat1 };
	$jolt1++;
	return $rat1;
    }
    elsif ( grep { /^$rat2$/ } keys %ADAPT ) {
	print "Using adapter $rat2";
	delete $ADAPT{ $rat2 };
	return $rat2;
    }
    elsif ( grep { /^$rat3$/ } keys %ADAPT ) {
	print "Using adapter $rat3";
	delete $ADAPT{ $rat3 };
	$jolt3++;
	return $rat3;
    }
    else {
	die "No valid adapter found!";
    }
}


__DATA__
67
118
90
41
105
24
137
129
124
15
59
91
94
60
108
63
112
48
62
125
68
126
131
4
1
44
77
115
75
89
7
3
82
28
97
130
104
54
40
80
76
19
136
31
98
110
133
84
2
51
18
70
12
120
47
66
27
39
109
61
34
121
38
96
30
83
69
13
81
37
119
55
20
87
95
29
88
111
45
46
14
11
8
74
101
73
56
132
23
