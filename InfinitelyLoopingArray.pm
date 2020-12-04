package InfinitelyLoopingArray;

use strict;
use warnings;

use Carp qw( croak );

sub TIEARRAY {
   my $class = shift;
   return bless([ @_ ], $class);
}

sub FETCHSIZE {
   # Largest supported array index.
   # Currently 2**31-1 or 2**63-1 depending on the build.
   return unpack('J', pack('j', -1)) >> 1;
}

sub FETCH {
   my ($self, $idx) = @_;
   croak "Negative indexes not supported" if $idx < 0;
   return $self->[$idx % @$self];
}

sub new {
   tie my ( @array ), @_;
   return \@array;
}

1;

