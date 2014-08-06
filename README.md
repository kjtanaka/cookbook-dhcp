dhcp-server Cookbook
====================
This cookbook installs dhcp server.

Requirements
------------
#### platform
- CentOS 6.5 is supported and tested.

Attributes
----------

- `['dhcp']['domain_name']` - Domain name. Default is `example.org`
- `['dhcp']['domain_name_servers']` - Domain name server. Default is `10.0.2.3`.
- `['dhcp']['subnet']` - Subnet. Default is `192.168.33.0`.
- `['dhcp']['netmask']` - Netmask. Default is `255.255.255.0`.
- `['dhcp']['range_start']` - DHCP range starting IP Address. Default is `192.168.33.101`.
- `['dhcp']['range_end']` - DHCP range ending IP Address. Default is `192.168.33.200`.
- `['dhcp']['range_routers']` - Routers. Default is `192.168.33.31`.
- `['dhcp']['server']['network_interface']` - Server's DHCP interface. Default is `eth1`.
- `['dhcp']['client']['network_interface']` - Client's DHCP interface. Default is `eth1`.

Usage
-----
#### dhcp::server
Include `dhcp::server` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[dhcp::server]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
- Author:: Koji Tanaka (<kj.tanaka@gmail.com>)

```text
Copyright 2014, FutureGrid, Indiana Univercity

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
