kube-payload-rook
===================

Deploy [rook](https://github.com/rook/rook) using their predefined resources.

Dependencies
------------

TODO - does this need a LB? Possibly for the SMB/NFS support?

Limitations
------------

Many configuration details are currently hardcoded.

Role Variables
--------------

* kube_payload_basedir - will be created if it does not exist. Manifests placed in directory `argocd` under this.
* kube_payload_owner - user that owns the files, needs to have access to kubectl
* kube_payload_group - group that owns the files
* kube_payload_rook_release_train - rook release train to deploy, without the `release-` prefix. Example: `1.4`
* kube_payload_rook_storage_device - local device to use on all nodes, e.g. '/dev/mapper/crypted_disk'

Example Playbook
----------------

Use as follows:

    - name: Deploy Rook
      hosts: servers
      become: true
      tasks:
        - include_role:
            name: kube-payload-rook
          vars:
            kube_payload_basedir: '/some/path'
            kube_payload_owner: root
            kube_payload_group: root
            kube_payload_rook_release_train: 1.4
            kube_payload_rook_storage_device: '/dev/mapper/crypted_disk'

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
