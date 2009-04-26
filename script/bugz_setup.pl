#!/usr/local/bin/perl

use strict;
use warnings;
use Cwd ();
use File::Spec;
use File::Basename;
use File::Path;

die "usage: $0 /path/to/bugzilla\n"
  unless @ARGV;

my $bugz_path = Cwd::abs_path(shift);

unlink(
  glob('root/cgi-bin/*'),
  qw(root/images root/js root/skins)
);

(-d "root/cgi-bin") || mkpath("root/cgi-bin")
  or die "Can't mkpath('root/cgi-bin'): $!";

for my $cgi (glob("$bugz_path/*.cgi")) {
  my $dest = "root/cgi-bin/" . basename($cgi);
  symlink($cgi, $dest) or die "Can't symlink $dest -> $cgi: $!";
  print "$dest -> $cgi\n";
}

for my $dir (qw(images js skins)) {
  symlink("$bugz_path/$dir", "root/$dir")
    or die "Can't symlink root/$dir -> $bugz_path/$dir: $!";
  print "root/$dir -> $bugz_path/$dir\n";
}
