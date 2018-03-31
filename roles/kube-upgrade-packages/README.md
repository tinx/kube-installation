kube-upgrade-packages
=====================

Perform an upgrade of the operating system.

Limitations
-----------

A mirror repo for package updates is only supported for CentOS, and there it is **mandatory**.

Variables
---------

* kube_upgrade_packages_mirror_base_url - using a mirror currently only works with CentOS, 
  and for centos it is mandatory, do NOT include a trailing /
* kube_upgrade_packages_centos_version - for CentOS, the full version string (e.g. "7.4.1708")

Example Playbook
----------------

For debian machines:

    - name: Upgrade packages
      hosts: servers
      become: true
      tasks:
        - include_role:
            name: kube-upgrade-packages

For CentOS machines:

    - name: Upgrade packages
      hosts: servers
      become: true
      tasks:
        - include_role:
            name: kube-upgrade-packages
          vars:
            kube_upgrade_packages_mirror_base_url: 'http://192.168.200.40/mirrors'
            kube_upgrade_packages_centos_version: '7.4.1708'

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
