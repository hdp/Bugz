package Bugz;

use strict;
use warnings;

use Catalyst::Runtime '5.70';

use parent qw/Catalyst/;
use Catalyst qw/
  ConfigLoader
  Static::Simple
/;

our $VERSION = '0.01';

eval { require Bugz::lib; 1 }
  or die "Can't continue without Bugz::lib; run script/bugz_setup.pl: $@";

__PACKAGE__->config( name => 'Bugz' );
__PACKAGE__->config->{static}->{dirs} = [ qw(images skins js) ];
__PACKAGE__->setup();

1;
