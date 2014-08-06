#
# Cookbook Name:: dhcp
# Recipe:: server
#
# Copyright 2014, FutureGrid Project, Indiana University
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

# Disable iptables
include_recipe 'iptables::disabled'
# Disable SELinux
include_recipe 'selinux::disabled'

package "dhcp"

service "dhcpd" do
  action :stop
end

template "/etc/sysconfig/dhcpd" do
  source "dhcpd.erb"
  owner "root"
  group "root"
  mode "0644"
  action :create
  variables(
    :network_interface => node['dhcp']['server']['network_interface']
  )
end

template "/etc/dhcp/dhcpd.conf" do
  source "dhcpd.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  action :create
  variables(
    :domain_name => node['dhcp']['domain_name'],
    :domain_name_servers => node['dhcp'] ['domain_name_servers'],
    :subnet => node['dhcp']['subnet'],
    :netmask => node['dhcp']['netmask'],
    :range_start => node['dhcp']['range_start'],
    :range_end => node['dhcp']['range_end'],
    :routers => node['dhcp']['routers']
  )
end

service "dhcpd" do
  action [:start, :enable]
end

