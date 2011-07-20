#!/usr/bin/perl -w
#
# Tim Hawes
# 19th January 2011
#
# Display stdin with a timestamp prefix to each line
# (similar to 'nl' which prefixes a line number)

use strict;
use POSIX qw/strftime/;
use Time::HiRes qw/gettimeofday/;

$| = 1;

sub timestamp {
    my ($ts, $tu) = gettimeofday();
    return sprintf("%s.%06dZ",
		   strftime("%Y-%m-%dT%H:%M:%S", gmtime($ts)),
		   $tu);
}

while (<>) {
    print timestamp() . " " . $_;
}
