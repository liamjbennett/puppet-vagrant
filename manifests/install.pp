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
      $filename = $version ? {
        /1\.4\.\d/ => "Vagrant-${version}.dmg",
        default    => "vagrant-${version}.dmg",
      }
      $provider = 'pkgdmg'
    }
    'Debian': {
      $filename = "vagrant_${version}_${arch}.deb"
      $provider = 'apt'
    }
    'RedHat': {
      $filename = "vagrant_${version}_${arch}.rpm"
      $provider = 'yum'
    }
    'Windows': {
      $filename = $version ? {
        /1\.4\.\d/ => "Vagrant-${version}.msi",
        default    => "vagrant-${version}.msi"
      }
      $provider = 'windows'
    }
  }

  $source = "${base_url}/${filename}"

  package {"vagrant-${version}":
    ensure   => installed,
    source   => "${source}",
    provider => "${provider}",
  }
}
