# IMPORTANT: if you delete this file your app will not work as
# expected.  you have been warned
use inc::Module::Install;

name 'Bugz';
all_from 'lib/Bugz.pm';

requires 'Catalyst::Runtime' => '5.71001';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'parent';
requires 'Config::General'; # This should reflect the config file format you've chosen
                 # See Catalyst::Plugin::ConfigLoader for supported formats

# both of these are unreleased versions with bugfixes
requires 'Catalyst::Controller::WrapCGI' => '0.0029';
requires 'HTTP::Request::AsCGI' => '0.6';

catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
