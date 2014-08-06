#
# Cookbook Name:: dhcp
# Recipe:: client
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

# Disable SELinux
include_recipe 'selinux::disabled'

client_iface = node['dhcp']['client']['network_interface']

template "/etc/sysconfig/network-scripts/ifcfg-#{client_iface}" do
  source "ifcfg-ethN.erb"
  owner "root"
  group "root"
  mode "0644"
  action :create
  notifies :run, "bash[if_refresh]", :immediately
  variables(
    :network_interface => "#{client_iface}"
  )
end

bash "if_refresh" do
  user "root"
  code <<-EOH
  ifdown #{client_iface}
  ifup #{client_iface}
  EOH
  action :nothing
end

