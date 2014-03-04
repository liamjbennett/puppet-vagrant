# == Class: vagrant::install
#
# Install Vagrant
#
# === Authors
#
# Ryan Skoblenick <ryan@skoblenick.com>
#
# === Copyright
#
# Copyright 2013 Ryan Skoblenick.
#
class vagrant::install {
  $version = $vagrant::version
  $base_url = "http://dl.bintray.com/mitchellh/vagrant"

  $arch = $::architecture ? {
    /(x86_64|amd64)/ => 'x86_64',
    'i386'           => 'i686',
    default          => fail("Unrecognized architecture: ${::architecture}")
  }

  case $::osfamily {
    'Darwin': {
      $source   = "${base_url}/Vagrant-${version}.dmg"
      $provider = 'pkgdmg'
    }
    'Debian': {
      $source   = "${base_url}/vagrant_${version}_${arch}.deb"
      $provider = 'deb'
    }
    'RedHat': {
      $source   = "${base_url}/vagrant_${version}_${arch}.rpm"
      $provider = 'rpm'
    }
    'Windows': {
      $source   = "${base_url}/Vagrant_${version}.msi"
      $provider = 'msi'
    }
    default: {
      fail("Unsupported Kernel: ${::kernel} operatingsystem: ${::operatingsystem}")
    }
  }

  package {"vagrant-${version}":
    ensure   => installed,
    source   => "${source}",
    provider => "${provider}",
  }
}