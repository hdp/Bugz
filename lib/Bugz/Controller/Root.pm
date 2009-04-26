package Bugz::Controller::Root;

use parent 'Catalyst::Controller::CGIBin';
use Moose;
use lib '../bugzilla-3.2.3';

__PACKAGE__->config->{namespace} = '';

sub index : Chained(/) Args(0) {
  my ($self, $c) = @_;
  $c->go('/CGI_index_cgi');
}

sub cgi_path {
  my ($self, $cgi) = @_;
  return $cgi;
}

sub is_perl_cgi { 1 }

around wrap_perl_cgi => sub {
  my $next = shift;
  my $code = shift->$next(@_);
  sub { $Bugzilla::_request_cache = {}; $code->(); Bugzilla::_cleanup() };
};


1;
