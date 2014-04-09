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
  $base_url = "http://966b.http.dal05.cdn.softlayer.net/data-production"

  $arch = $::architecture ? {
    /(x86_64|amd64)/ => 'x86_64',
    'i386'           => 'i686',
    default          => fail("Unrecognized architecture: ${::architecture}")
  }

  case $::osfamily {
    'Darwin': {
      $sha1 = $version ? {
        '1.4.0' => '84b27313b81c827fa9e831b9e4761224ca478451',
        '1.4.1' => '54a1ad09a99e79a59706bc7b0f0bfd8170786cbf',
        '1.4.2' => '5d3ad8df7b64695f211eb30cc7db17e670af3493',
        '1.4.3' => '78d20fbe44704d91b7958af57308eb0fde147ed4',
        '1.5.0' => '60562e033fd041887df32042ea1a988fedee0111',
        '1.5.1' => 'a96f55d746e433e681f07b2668ee19f2674acf6b',
        '1.5.2' => '02b7cd7d01d9134dadebb3ce50ce3906ee572f4b',
      }
      $filename = $version ? {
        /1\.4\.\d/ => "Vagrant-${version}.dmg",
        /1\.5\.\d/ => "vagrant-${version}.dmg",
      }
      $provider = 'pkgdmg'
    }
    'Debian': {
      $sha1 = $arch ? {
        'i686' => $version ? {
          '1.4.0' => 'a772621bd9c94094e4e6f0784c1dbd82c03a7a2e',
          '1.4.1' => '10d2354aa19e39f04fe78f41f2a1e5bae5493602',
          '1.4.2' => '32a0f5682532b2c57d2aae9b6ed38a70051a1b9f',
          '1.4.3' => 'd8077ea1fb8cf89cb31480325d0d23cd807a231c',
          '1.5.0' => 'fcf2c0f72b785eee86913d48d87008f5e2bb79c8',
          '1.5.1' => '5013d1b0c1faa6b6e93b9d92f1dd4f2c2aa13720',
          '1.5.2' => '64cb92ee2070fecfd4d6ca7c77d21bc3dcf92278',
        },
        'x86_64' => $version ? {
          '1.4.0' => '1c9deb8a6955158a2385f2b1dca35b0f8285539b',
          '1.4.1' => 'ceb0d9a85f0539d54144908b590a8d1fe8d1127c',
          '1.4.2' => 'eed78efef565b9166e683159332191856852b1d1',
          '1.4.3' => '2f0b88eb857b0a4d0b71250f999f8873f0c3bc7b',
          '1.5.0' => 'a0e5e8d2aa3bd0a8e00d02c87b26698900fea2cf',
          '1.5.1' => 'b291152131b81177f4e27174e901ec2a244540ff',
          '1.5.2' => '6639b7d98647b2228da763b289a2ff73f9bac3ca',
        },
      }

      $filename = "vagrant_${version}_${arch}.deb"
      $provider = 'deb'
    }
    'RedHat': {
      $sha1 = $arch ? {
        'i686' => $version ? {
          '1.4.0' => 'f8c9bea0e4c4204c12d5e090a06d279a22e3c1a4',
          '1.4.1' => 'f3a3c7aaede095c8d844c6cd6cf0949855ce03ec',
          '1.4.2' => 'dd93277db813ee59e723c2797859ef9bd2312d6a',
          '1.4.3' => 'c9be5a1c280c9b44b8df5b50c20cf98bb83f8cfa',
          '1.5.0' => '314876b2a49be456adb128bf6eb9f4968f84c20c',
          '1.5.1' => '6fcb7371dc6b5ef9bb1437f6a303d55edc7c6a71',
          '1.5.2' => '4aa5fb44a102467c365688d5dcd9df0fb5984549',
        },
        'x86_64' => $version ? {
          '1.4.0' => '203b70de171ab6cf7d34c6dcfd1e6f3a6564503a',
          '1.4.1' => 'c080b38d61e0e348dced25484726ac6c285fd3fa',
          '1.4.2' => '68a074dc0538cb609530a0dd94264228ef147a80',
          '1.4.3' => '96ce8e4c0efb26bf5e1e70afd0483e15b57e7202',
          '1.5.0' => '8862b7a6977948153b1e9aa61536a1e42fb4648e',
          '1.5.1' => 'c36e109afdad04636dfbf52eeeece8ac710298b4',
          '1.5.2' => '5e7293f0910fa5755d6583108d105612be146e96',
        },
      }

      $filename = "vagrant_${version}_${arch}.rpm"
      $provider = 'rpm'
    }
    'Windows': {
      $sha1 = $version ? {
        '1.4.0' => 'e47a1ccc33b311d6b973c77cbcc721c1eda958eb',
        '1.4.1' => 'f9741cd126a94cbaa0e26fd3df32061e39036d71',
        '1.4.2' => 'a1fb80b1581cb1132b50e467490d11c1d9423376',
        '1.4.3' => '1835e881651ac8f27a9e4b815754f1934db71fe6',
        '1.5.0' => '48573e7f0a69173626854c7e7eb50985bc96713f',
        '1.5.1' => '237cd7320abe65f90e3442459e778e595e066cfe',
        '1.5.2' => '75003a11b33053e98634648dfbbfbf7ee52b49cf',
      }
      $filename = $version ? {
        /1\.4\.\d/ => "Vagrant-${version}.msi",
        /1\.5\.\d/ => "vagrant-${version}.msi"
      }
      $provider = 'msi'
    }
  }

  $source = "${base_url}/${sha1}?filename=${filename}"

  package {"vagrant-${version}":
    ensure   => installed,
    source   => "${source}",
    provider => "${provider}",
  }
}
