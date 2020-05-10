kube-payload-metallb
===================

Deploy [metallb](https://metallb.universe.tf/) using their predefined
resources.

Role Variables
--------------

* kube_payload_basedir - will be created if it does not exist. Manifests placed in directory `metallb` under this.
* kube_payload_owner - user that owns the files, needs to have access to kubectl
* kube_payload_group - group that owns the files
* kube_payload_metallb_version - metallb version to deploy, without the `v` prefix. Example: `1.5.4`
* kube_payload_metallb_iprange - range of ip adresses available for metallb services. Example: '192.168.1.240-192.168.1.250'

Example Playbook
----------------

Use as follows:

    - name: Deploy metallb
      hosts: servers
      become: true
      tasks:
        - include_role:
            name: kube-payload-metallb
          vars:
            kube_payload_basedir: '/some/path'
            kube_payload_metallb_version: 1.5.4
            kube_payload_metallb_iprange: '192.168.1.240-192.168.1.250'
            kube_payload_owner: root
            kube_payload_group: root

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
