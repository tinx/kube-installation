kube-disable-swap
=================

Disable swap space.

Limitations
-----------

Currently only supports raspbian.

Example Playbook
----------------

    - name: Disable swap space on all servers
      hosts: servers
      become: true
      tasks:
        - include_role:
            name: kube-disable-swap

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx

