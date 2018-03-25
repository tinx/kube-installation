kube-net-disable-wlan-bluetooth
===============================

Completely disable any wireless networking at the kernel module level.

Limitations
-----------

Currently only supports raspbian.

Example Playbook
----------------

    - name: Disable wlan and bluetooth
      hosts: servers
      become: true
      tasks:
        - include_role:
            name: kube-net-disable-wlan-bluetooth

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
