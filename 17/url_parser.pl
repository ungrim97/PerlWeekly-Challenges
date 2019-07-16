#!/usr/bin/env perl
{
    package URI::jdbc;
    use parent 'URI::Nested';

    sub scheme {
        my ($self) = shift;
        my $schema = $self->SUPER::scheme(@_);

        return sprintf('%s:%s', $schema, $self->nested_uri->scheme);
    }
}

use Carp qw/croak/;
use URI;

use feature 'say';

sub parse_url {
    my ($url) = @_;

    croak("URL is mandatory") unless $url;

    my $uri = URI->new($url);
    return {
        scheme   => $uri->scheme,
        userinfo => $uri->userinfo,
        host     => $uri->host,
        port     => $uri->port,
        path     => $uri->path,
        query    => $uri->query,
        fragment => $uri->fragment
    };
}

my $parsed_url = parse_url($ARGV[0]);
printf(<<EOF, @{$parsed_url}{qw/scheme userinfo host port path query fragment/});
scheme:   %s
userinfo: %s
host:     %s
port:     %s
path:     %s
query:    %s
fragment: %s
EOF
