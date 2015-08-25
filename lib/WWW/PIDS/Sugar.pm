package WWW::PIDS::Sugar;

use strict;
use warnings;

use WWW::PIDS;
use WWW::PIDS::Sugar::Route;
use WWW::PIDS::Sugar::Destination;

our $CACHE_ENABLED = 0;
our $CACHE_MAX_AGE = 600;
our $CACHE;

sub new {
	my ( $class, %args )	= @_;
	my $self		= bless {}, $class;
	$self->{__p}		= WWW::PIDS->new();
	$CACHE_ENABLED		= 1 if ( $args{cache} );
	$CACHE_MAX_AGE		= $args{cache_max_age} if ( $args{cache_max_age} );

	return $self
}

sub get_destinations_like {
	my ( $self, $r ) = @_;
	$r =~ s/\/\\//g;
	return	grep { $_->destination =~ /$r/i } $self->get_destinations;
}

sub get_routes {
	my $self = shift;

	return __cache( 'routes' ) if __is_cached( 'routes' );
	my @d = map { bless $_, 'WWW::PIDS::Sugar::Route' } $self->{__p}->GetRouteSummaries();
	__update_cache( 'routes', @d ) if $CACHE_ENABLED;
	return @d;
}

sub get_destinations {
	my $self = shift;

	return __cache( 'destinations' ) if __is_cached( 'destinations' );
	my @d = map { bless $_, 'WWW::PIDS::Sugar::Destination' } $self->{__p}->GetDestinationsForAllRoutes();
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

	if ( $CACHE_ENABLED 
		and defined $CACHE->{ $key }
		and defined $CACHE->{ $key }->{ val }
		and defined $CACHE->{ $key }->{ ts }
		and ( ( time() - $CACHE->{ $key }->{ ts } ) > $CACHE_MAX_AGE ) 
	) {
		my $a = ( time() - $CACHE->{ $key }->{ ts } );
		return $CACHE->{ $key }->{ value }
	}

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

# for my $route ( $p->get_destinations( like => /foo/ ) ) {
#	
# }
#
# $p->get_stops_for_route(
# $p->get_stops_for_route(
#
# $p->get_route(96)->stops
# Get all 
#

1;

__END__
