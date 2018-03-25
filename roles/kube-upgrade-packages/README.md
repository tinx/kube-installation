kube-upgrade-packages
=====================

Perform an upgrade of the operating system.

Limitations
-----------

Currently only supports raspbian and other apt based distributions.

Example Playbook
----------------

    - name: Upgrade packages
      hosts: servers
      become: true
      tasks:
        - include_role:
            name: kube-upgrade-packages

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
