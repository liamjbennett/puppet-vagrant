Puppet Module - Vagrant
=======================

Puppet module to install Vagrant.

Supported Platforms:

- Darwin
- Debian
- RedHat
- Windows

Usage
-----

Install Vagrant 1.3.5:

```
class {'vagrant': }
```

Install a specific version of Vagrant:

```
class {'vagrant':
  version => '1.3.1',
}
```

Developer Notes
---------------
This module does _NOT_ support versions of Vagrant older than 1.2.0 due to a  
URL pattern change that occured.

The module will automagically populate the ```git_hash``` for 1.2.0 to 1.3.4. 
Newer verisons will _REQUIRE_ you to add the ```git_hash``` to the parameters 
until such time the module is updated.

If the ```version``` or ```git_hash``` are not provided the module will default 
to Vagrant ```1.3.3``` and ```db8e7a9c79b23264da129f55cf8569167fc22415``` 
respectively.

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