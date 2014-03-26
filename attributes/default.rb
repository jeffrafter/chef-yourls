#
# Cookbook Name:: yourls
# Attributes:: yourls
#
# Author:: Jeff Rafter (<jeffrafter@gmail.com>)
#
# Copyright 2014
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['yourls']['url'] = "https://github.com/YOURLS/YOURLS/archive/1.7.tar.gz"
default['yourls']['checksum'] = "c13bd61eeb5150c70ad6b8dda402de7e"
default['yourls']['db_user'] = nil
default['yourls']['db_password'] = nil
default['yourls']['db_name'] = "yourls"
default['yourls']['db_host'] = "localhost"
default['yourls']['db_prefix'] = "yourls_"
default['yourls']['port'] = 80
default['yourls']['domain'] = nil
default['yourls']['hours_offset'] = 0
default['yourls']['lang'] = nil
default['yourls']['unique_urls'] = true
default['yourls']['private'] = true
default['yourls']['cookiekey'] = nil
default['yourls']['users'] = []
default['yourls']['debug'] = false
default['yourls']['url_convert'] = 36
default['yourls']['reserved_url'] = nil

