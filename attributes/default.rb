#
# Cookbook Name:: wget
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

default['wget']['version'] = "1.13.4"

case node['platform']
  when 'mac_os_x'
    default['wget']['install_dir'] = ::File.join(ENV['HOME'], %w{Library wget})
  else
    default['wget']['install_dir'] = '/usr/local'
end