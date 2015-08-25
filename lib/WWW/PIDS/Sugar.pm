package WWW::PIDS::Sugar;

use strict;
use warnings;

use WWW::PIDS;
use WWW::PIDS::Sugar::Route;

our $CACHE_ENABLED = 0;
our $CACHE_MAX_AGE = 600;
our $CACHE;

our $METHODS = {};

sub new {
	my ( $class, %args )	= @_;
	my $self		= bless {}, $class;
	$self->{__p}		= WWW::PIDS->new();
	$CACHE_ENABLED		= 1 if ( $args{cache} );
	$CACHE_MAX_AGE		= $args{cache_max_age} if ( $args{cache_max_age} );

	return $self
}

sub get_destinations {
	my $self = shift;

	return __cache( 'destinations' ) if __is_cached( 'destinations' );
	my @d = $self->{__p}->GetDestinationsForAllRoutes();
	__update_cache( 'destinations', @d ) if $CACHE_ENABLED;
	return @d;
}

sub __update_cache {
	my ( $key, $val ) = @_;

	$CACHE->{ $key }->{ val } = $val;
	$CACHE->{ $key }->{ ts }  = time();
}

sub __cache {
	return $CACHE->{ $_[0] }->{ value }
}

sub __is_cached {
	my $key = shift;
print "In __is_cached\n";
	if ( $CACHE_ENABLED 
		and defined $CACHE->{ $key }
		and defined $CACHE->{ $key }->{ val }
		and defined $CACHE->{ $key }->{ ts }
		#and ( ( time() - $CACHE->{ $key }->{ ts } ) > $CACHE_MAX_AGE ) 
	) {
		my $a = ( time() - $CACHE->{ $key }->{ ts } );
		print "a = $a\n";
		print " Yeah\n";
		return $CACHE->{ $key }->{ value }
	}

	print "Is cached\n";
	return 0
}

#sub get_route {}
#	my ( $self, $route ) = @_;
#
#	$self->{__have_route_detail} or $self->__get_route_detail;
#	return $self->__route;
#}

#sub __get_route_detail {
#	my $self = shift;
#	$self->{__p}->
#}

# my $s = WWW::PIDS::Sugar->new;

# for my $route ( $p->get_destinations ) {
#	
# }
#
# $p->get_stops_for_route(
#
# $p->get_route(96)->stops
# Get all 
#

1;

__END__
