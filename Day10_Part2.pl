#!/usr/bin/perl
#
# Sadly, I had to crib this from somone on Reddit...
# I wanted to get a better understanding of the concepts, 
# but I'm somewhat lost

use strict;
use warnings;
use Perl6::Slurp;
use List::Util qw( uniq );

$, = '|';
$\ = "\n";

my $upper   = 0;
my %NODES;

my @data    = slurp \*DATA, { chomp => 1 };

foreach ( @data ) {
    $upper  = $_ if $_ > $upper; # Define uppermost value;
    $NODES{ $_ } = 1;
}

my $t3	= 1;
my $t2	= 0;
my $t1	= 0;
my $t0  = 0;

while ( $upper ) {
    print $upper, $t3, $t2, $t1, $t0;
    $t0	= $NODES{ $upper } 
	? $t3 + $t2 + $t1 
	: 0
	;
    $t3 = $t2;
    $t2 = $t1;
    $t1 = $t0;
    $upper--;
}

print $t3 + $t2 +  $t1;

# The correct answer is 3100448333024

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
