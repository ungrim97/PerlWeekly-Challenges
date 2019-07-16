#!/usr/bin/env perl
use Carp qw/croak/;
use Scalar::Util qw/looks_like_number/;

use feature 'say';

sub ackermann {
    my ($m, $n) = @_;

    croak("$m must be a positive integer") unless looks_like_number($m) and $m >= 0;
    croak("$n must be a positive integer") unless looks_like_number($n) and $n >= 0;

    return $n + 1 if $m == 0;

    if ($m > 0) {
        return ackermann($m - 1, 1) if $n == 0;

        return ackermann($m - 1, ackermann($m, $n - 1));
    }

    croak("Something went really wrong");
}

say ackermann(@ARGV);
