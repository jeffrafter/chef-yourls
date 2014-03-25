Description
===========

Installs yourls URL shortener from source. This cookbook is intended to
be used with the nginx::source cookbook from opscode (version 2.0.0 or newer).
This cookbook is dependent on having PHP5 and a database connection setup.

Requirements
============

Cookbooks
---------

The following cookbooks are direct dependencies because they're used
for common "default" functionality.

* nginx::source (from opscode)
* php (from opscode)
* postgresql (from opscode)
* database (from opscode)

Platform
--------

The following platforms are supported:

* Ubuntu 12.04

Other Debian and RHEL family distributions are assumed to work.

Attributes
==========

Node attributes for this cookbook are logically separated into
different files. Some attributes are set only via a specific recipe.

* `node['yourls']['url']` - URL for the tarball.
* `node['yourls']['checksum']` - Checksum of the tarball.

Usage
=====

Include the recipe on your node or role after including the
nginx::source recipe. It is assumed that you will specify this
module as part of the modules default attributes. For example,
in your module:

    "yourls": {
    }


License and Author
==================

- Author:: Jeff Rafter (<jeffrafter@gmail.com>)
- Copyright:: 2014

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
