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
  $git_hash = $version ? {
    '1.2.0' => 'f5ece47c510e5a632adb69701b78cb6dcbe03713',
    '1.2.1' => 'a7853fe7b7f08dbedbc934eb9230d33be6bf746f',
    '1.2.2' => '7e400d00a3c5a0fdf2809c8b5001a035415a607b',
    '1.2.3' => '95d308caaecd139b8f62e41e7add0ec3f8ae3bd1',
    '1.2.4' => '0219bb87725aac28a97c0e924c310cc97831fd9d',
    '1.2.5' => 'ec2305a9a636ba8001902cecb835a00e71a83e45',
    '1.2.6' => '22b76517d6ccd4ef232a4b4ecbaa276aff8037b8',
    '1.2.7' => '7ec0ee1d00a916f80b109a298bab08e391945243',
    '1.3.0' => '0224c6232394680971a69d94dd55a7436888c4cb',
    '1.3.1' => 'b12c7e8814171c1295ef82416ffe51e8a168a244',
    '1.3.2' => '9a394588a6dcf97e8f916da9564088fcf242c4b3',
    '1.3.3' => 'db8e7a9c79b23264da129f55cf8569167fc22415',
    default => $vagrant::git_hash
  }
  $base_url = "http://files.vagrantup.com/packages/${git_hash}"

  $arch = $::architecture ? {
    /(x86_64|amd64)/ => 'x86_64',
    'i386'           => 'i686',
    default          => fail("Unrecognized architecture: ${::architecture}")
  }

  case $::kernel {
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