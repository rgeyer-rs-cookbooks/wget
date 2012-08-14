#
# Cookbook Name:: wget
# Recipe:: install_from_source
#
# Copyright 2012, Ryan J. Geyer
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

rightscale_marker :begin

sourcetar = ::File.join(Chef::Config['file_cache_path'], 'wget.tar.gz')
compiledir = ::File.join(Chef::Config['file_cache_path'], 'wget')

remote_file sourcetar do
  source "http://ftp.gnu.org/gnu/wget/wget-#{node['wget']['version']}.tar.gz"
end

directory compiledir

bash "Extract source files" do
  code "tar --strip-components 1 -zxf #{sourcetar} -C #{compiledir}"
end

bash "Configure, compile, and install wget" do
  cwd compiledir
  code <<-EOF
./configure --with-ssl=openssl --prefix=#{node['wget']['install_dir']}
make
make install
  EOF
end

rightscale_marker :end