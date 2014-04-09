Puppet Module - Vagrant
=======================

Puppet module to install Vagrant 1.4.0 - 1.5.2.

Supported Platforms:

- Darwin
- Debian
- RedHat
- Windows

Usage
-----

Install Vagrant 1.5.2:

```
class {'vagrant': }
```

Install a specific version of Vagrant:

```
class {'vagrant':
  version => '1.4.0',
}
```

Developer Notes
---------------
* This module is untested with RedHat, Debian, and Windows. Please submit issues
on GitHub if you find problems with these OS families. I have had to refactor this
module again due to changes in URL patterns on Vagrants site.
* Due to the current URL patterns on Vagrant's site/CDN this plugin is limited
to versions between 1.4.0-1.5.2
* This module does __NOT__ support versions of Vagrant older than 1.4.0. Versions
of this module prior to 0.5.0 supported Vagrant 1.2.0-1.3.5. Rather than
maintaining historical versions I've decided to drop support.

MIT License
-----------

Copyright 2013 Ryan Skoblenick

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
