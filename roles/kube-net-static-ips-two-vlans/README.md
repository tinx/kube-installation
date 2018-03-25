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

Right now, this role assumes a very specific setup of both the inventory 
and some global variables.

TODO: refactor with explicit variables

Role Variables
--------------

TODO

Example Playbook
----------------

    - name: Configure static ip networking with primary and secondary vlan
      hosts: servers
      become: true
      tasks:
        - include_role:
            name: kube-net-static-ips-two-vlans

TODO: vars

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
