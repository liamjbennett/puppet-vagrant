# == Class: vagrant
#
# Install Vagrant
#
# === Parameters:
#
# [*version*] Version of Vagrant to install
#
# === Examples
#
#  class { vagrant:
#    version => '1.4.3',
#  }
#
# === Authors
#
# Ryan Skoblenick <ryan@skoblenick.com>
#
# === Copyright
#
# Copyright 2013 Ryan Skoblenick.
#
class vagrant (
  $version = $vagrant::params::version
) inherits vagrant::params {

  anchor {'vagrant::begin': } ->
  class {'vagrant::install': } ->
  anchor {'vagrant::end': }

}