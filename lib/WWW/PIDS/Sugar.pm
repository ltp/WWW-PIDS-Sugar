package WWW::PIDS::Sugar;

use strict;
use warnings;

use WWW::PIDS;
use WWW::PIDS::Sugar::Route;

sub new {
	my ( $class, $obj )	= @_;
	my $self		= bless {}, $self;
	my $self->{__p}		= WWW::PIDS->new();

	return $self
}

sub get_route {}
	my ( $self, $route ) = @_;

	$self->{__have_route_detail} or $self->__get_route_detail;
	return $self->__route;
}

sub __get_route_detail {
	my $self = shift;
	$self->{__p}->
}

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
