kube-net-static-dns-resolver
============================

Configure a static nameserver ip and disable resolvconf subsystem so it actually stays.

Limitations
-----------

Currently only supports raspbian.

Role Variables
--------------

* kube_net_static_nameserver - ip address of your name server 

Example Playbook
----------------

    - name: Configure fixed nameserver ip and disable having it overwritten
      hosts: servers
      become: true
      tasks:
        - include_role:
            name: kube-net-static-dns-resolver
          vars:
            kube_net_static_nameserver: 192.168.0.8 

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx

