#!perl
use strict;
use warnings;
use Test::More tests => 6;

package Foony;
use strict;
use warnings;
use Sub::Become;

sub new { bless { cake => 'fruit' }, shift }

sub crazy_legs {
    my $self = shift;
    evolve {
        my $self = shift;
        return reverse $self->{cake};
    }
    $self;
    return $self->{cake};
}

package main;

my $foo1 = Foony->new;
my $foo2 = Foony->new;

is $foo1->crazy_legs, 'fruit', 'foo1 before evolving';
is $foo1->crazy_legs, 'tiurf', 'foo1 after evolving';
is $foo1->crazy_legs, 'tiurf', 'foo1 stable';

is $foo2->crazy_legs, 'fruit', 'foo2 before evolving';
is $foo2->crazy_legs, 'tiurf', 'foo2 after evolving';
is $foo2->crazy_legs, 'tiurf', 'foo2 stable';
