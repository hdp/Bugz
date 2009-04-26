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

__PACKAGE__->config( name => 'Bugz' );
__PACKAGE__->config->{static}->{dirs} = [ qw(images skins js) ];
__PACKAGE__->setup();

1;
