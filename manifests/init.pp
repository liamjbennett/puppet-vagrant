# == Class: vagrant
#
# Install Vagrant
#
# === Examples
#
#  class { vagrant:
#    git_hash => 'b12c7e8814171c1295ef82416ffe51e8a168a244',
#    version => '1.3.1',
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
  $git_hash = $vagrant::params::git_hash,
  $version = $vagrant::params::version
) inherits vagrant::params {

  anchor {'vagrant::begin': } ->
  class {'vagrant::install': } ->
  anchor {'vagrant::end': }

}