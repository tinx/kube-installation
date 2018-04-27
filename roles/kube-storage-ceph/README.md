kube-storage-ceph
=================

Install and configure ceph monitors and OSDs.

Will also ensure synchronization of the ceph keyrings

- ceph.mon.keyring (contains the monitor secret key)
- ceph.client.admin.keyring (keyring for the client.admin user, to be used from ansible and on the command line)
- ceph.client.bootstrap-osd.keyring (keyring for the OSD)

between all monitors and osd hosts. 

If the keyrings do not exist on any of the hosts this role is run on, they will be 
created. 

Limitations
-----------

Only tested on Centos 7.

If you have some hosts with existing keyrings and some without, and ALL the
hosts that have the existing keyrings are down, the cluster will be
created in an inconsistent state. 

Role Variables
--------------

- kube_storage_ceph_repo_baseurl - base url for repo, with no trailing /
- kube_storage_ceph_version - version number, e.g. 12.2.4
- kube_storage_ceph_release - name of release in all lower caps, e.g. luminous
- kube_storage_ceph_cluster_uuid - run ```uuidgen``` to generate it for your cluster
- kube_storage_ceph_cluster_name - the cluster name, if you only have one, you can use ceph
- kube_storage_ceph_scriptdir - location to generate script to create the initial keyrings
- kube_storage_ceph_flagdir - location for flag files used by this role 

Example Playbook
----------------

    - name: Install and configure ceph
      hosts: servers
      become: true
      tasks:
        - name: Install and configure ceph
          include_role:
            name: kube-storage-ceph
          vars:
            kube_storage_ceph_repo_baseurl: https://download.ceph.com
            kube_storage_ceph_version: 12.2.4
            kube_storage_ceph_release: luminous
            kube_storage_ceph_cluster_uuid: deadbeef-dead-beef-1234-567890abcdef
            kube_storage_ceph_cluster_name: ceph
            kube_storage_ceph_scriptdir: /root/ceph-scripts
            kube_storage_ceph_flagdir: /var/run/ceph-ansible

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
