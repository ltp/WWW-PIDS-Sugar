#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'WWW::PIDS::Sugar' ) || print "Bail out!\n";
}

diag( "Testing WWW::PIDS::Sugar $WWW::PIDS::Sugar::VERSION, Perl $], $^X" );
