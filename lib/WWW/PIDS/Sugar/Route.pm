package WWW::PIDS::Sugar::Route;

use strict;
use warnings;

use overload ( '""' => \&__to_string );

our $M_MAP = {
	Description	=> 'description',
	DownDestination	=> 'down',
	HasLowFloor	=> 'low_floor',
	HeadboardRouteNo=> 'headboard_number',
	InternalRouteNo	=> 'internal_number',
	IsMainRoute	=> 'main_route',
	LastModified	=> 'last_modified',
	MainRouteNo	=> 'main_route_number',
	RouteNo		=> 'route_number',
	UpDestination	=> 'up'
};

foreach my $method ( keys %{ $M_MAP } ) {
	no strict 'refs';
	
	*{ __PACKAGE__ ."::$M_MAP->{ $method }" } = sub {
		my $self = shift;
		return $self->{ $method }
	}
}

sub new {
	my ( $class, %args ) = @_;
	
	my $self = bless {}, $class;

	return $self
}

sub __route_no	{ return $_[0]->{RouteNo}		}

sub __description	{ return $_[0]->{Description}		}

sub __up		{ return $_[0]->{UpDestination}		}

sub __down	{ return $_[0]->{DownDestination}	}

sub __to_string	{ return $_[0]->{RouteNo}		}

1;

__END__

=pod

NAME
