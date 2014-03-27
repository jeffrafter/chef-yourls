#
# Cookbook Name:: yourls
# Recipe:: default
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

# This cookbook performs the following:
#
# 1. Download and extract the yourls source
# 2. Create an nginx endpoint (conf) for a yourls site
# 3. Configure the database settings for yourls

yourls_src_filename = ::File.basename(node['yourls']['url'])
yourls_src_filepath = "#{Chef::Config['file_cache_path']}/#{yourls_src_filename}"
yourls_extract_path = "#{Chef::Config['file_cache_path']}/yourls/#{node['yourls']['checksum']}"
yourls_dest_path = node['yourls']['path']

remote_file yourls_src_filepath do
  source node['yourls']['url']
  checksum node['yourls']['checksum']
  owner "root"
  group "root"
  mode 00644
end

bash "extract_yourls" do
  cwd ::File.dirname(yourls_src_filepath)
  code <<-EOH
    rm -rf #{yourls_extract_path}
    mkdir -p #{yourls_extract_path}
    cd #{yourls_extract_path}
    tar xzf #{yourls_src_filename}
  EOH

#  not_if { ::File.exists?(yourls_extract_path) }
end

bash "copy_yourls" do
  cwd ::File.dirname(yourls_src_filepath)
  code <<-EOH
    mkdir -p #{yourls_dest_path}
    cp -R #{yourls_extract_path}/ #{yourls_dest_path}
  EOH

#  not_if { ::File.exists?(yourls_dest_path) }
end

template "config.php" do
  path "#{node['yourls']['path']}/user/config.php"
  source "config-sample.php.erb"
  action :create
end

template "nginx-yourls.conf" do
  path "/etc/nginx/sites-available/default"
  source "nginx-yourls.conf.erb"
  action :create

	notifies :reload, resources(:service => "nginx")
end


