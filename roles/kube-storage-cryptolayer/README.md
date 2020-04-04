kube-storage-cryptolayer
========================

- luks setup
- lvm?
- partition HDD
- systemd meta unit

Limitations
-----------

Only tested on Centos 7.

Role Variables
--------------

- kube_storage_local_raw_device
- kube_storage_local_crypted_devicename - e.g. sdb_crypted
- kube_storage_local_luks_cipher - e.g. aes-xts-plain64 (the default)

Example Playbook
----------------

    - name: Configure luks storage
      hosts: servers
      become: true
      tasks:
        - name: Configure luks storage
          include_role:
            name: kube-storage-cryptolayer
          vars:
            kube_storage_local_raw_device: /dev/sdb
            kube_storage_local_crypted_devicename: crypted_sdb1

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
