kube-net-static-ips-two-vlans
=============================

Configure static ip on eth0 for primary network interface.

Add a secondary network interface on a vlan, also with static ips.

Disable DHCP client.

Limitations
-----------

Right now, only raspbian is supported.

Requirements
------------

You will need a switch that supports vlans to make use of this.

Role Variables
--------------

* kube_net_interface - the name of the interface, e.g. eth0
* kube_net_primary_ip
* kube_net_primary_netmask
* kube_net_primary_network
* kube_net_primary_broadcast
* kube_net_primary_gateway - optional, only set if your gateway is on the primary vlan
* kube_net_secondary_vlan - the vlan number used for the secondary interface, e.g. 200
* kube_net_secondary_ip
* kube_net_secondary_netmask
* kube_net_secondary_network
* kube_net_secondary_broadcast
* kube_net_secondary_gateway - optional, only set if your gateway is on the secondary vlan

You should probably only set one of the two "gateway" variables.

Example Playbook
----------------

    - name: Configure static ip networking with primary and secondary vlan
      hosts: servers
      become: true
      tasks:
        - include_role:
            name: kube-net-static-ips-two-vlans
          vars:
            kube_net_interface: eth0
            kube_net_primary_ip: 192.168.0.40
            kube_net_primary_netmask: 255.255.255.0
            kube_net_primary_network: 192.168.0.0
            kube_net_primary_broadcast: 192.168.0.255
            kube_net_primary_gateway: 192.168.0.8
            kube_net_secondary_vlan: 200
            kube_net_secondary_ip: 192.168.200.40
            kube_net_secondary_netmask: 255.255.255.0
            kube_net_secondary_network: 192.168.200.0
            kube_net_secondary_broadcast: 192.168.200.255

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
