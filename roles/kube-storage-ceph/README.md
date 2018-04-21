kube-storage-ceph
=================

Install and configure ceph OSD.

Limitations
-----------

Only tested on Centos 7.

Role Variables
--------------

- kube_storage_ceph_repo_baseurl - base url for repo, with no trailing /
- kube_storage_ceph_version - version number, e.g. 12.2.4
- kube_storage_ceph_release - name of release in all lower caps, e.g. luminous
- kube_storage_ceph_cluster_uuid - run ```uuidgen``` to generate it for your cluster
- kube_storage_ceph_cluster_name - the cluster name, if you only have one, you can use ceph

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

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
