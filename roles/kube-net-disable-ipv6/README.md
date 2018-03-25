kube-net-disable-ipv6
=====================

Completely disables ipv6.

Example Playbook
----------------

    - name: Disable ipv6 on all servers
      hosts: servers
      become: true
      tasks:
        - include_role:
            name: kube-net-disable-ipv6

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
