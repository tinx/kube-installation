kube-storage-ceph
=================

Install and configure ceph monitors and OSDs.

Limitations
-----------

Only tested on Centos 7.

Prerequisites
-------------

This role assumes that you have created several ceph keyrings, namely 

- ceph.mon.keyring (contains the monitor secret key)
- ceph.client.admin.keyring (keyring for the client.admin user, to be used from ansible and on the command line)
- ceph.client.bootstrap-osd.keyring (keyring for the OSD)

the latter two must have been imported into the first one and the capabilities
must match those explained in 

https://docs.ceph.com/docs/master/install/manual-deployment/

For security reasons it is recommended that you (a) vault encrypt the files
(b) do not check them into public repositories.

When you first run this role, each node will generate keyrings as needed locally under
kube_storage_ceph_scriptdir. After that, the role will fail, but now you can
choose the keyring set from one host (any host that successfully created them
will work), vault encrypt them using

```ansible-vault encrypt foo.yml bar.yml baz.yml```

and place them on your ansible control host

- TODO where?

Once you have done this, simply re-run the role, and it will properly
install them and continue with ceph installation.

Role Variables
--------------

- kube_storage_ceph_repo_baseurl - base url for repo, with no trailing /
- kube_storage_ceph_version - version number, e.g. 12.2.4
- kube_storage_ceph_release - name of release in all lower caps, e.g. luminous
- kube_storage_ceph_cluster_uuid - run ```uuidgen``` to generate it for your cluster
- kube_storage_ceph_cluster_name - the cluster name, if you only have one, you can use ceph
- kube_storage_ceph_scriptdir - location to generate script to create the initial keyrings

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

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
