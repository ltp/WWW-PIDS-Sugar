package WWW::PIDS::Sugar::Route;

use strict;
use warnings;

use overload ( '""' => \&__to_string );

sub new {
	my ( $class, %args ) = @_;
	
	my $self = bless {}, $class;
	return $self
}

sub route_no	{ return $_[0]->{RouteNo}		}

sub description	{ return $_[0]->{Description}		}

sub up		{ return $_[0]->{UpDestination}		}

sub down	{ return $_[0]->{DownDestination}	}

sub __to_string	{ return $_[0]->{RouteNo}		}

1;
