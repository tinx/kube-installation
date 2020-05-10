kube-payload-argocd
===================

Deploy [argocd](https://argoproj.github.io/argo-cd/) using their predefined resources.

Dependencies
------------

Needs some deployed load balancer, e.g. metallb which 
can be deployed by role `kube-payload-metallb`.

Role Variables
--------------

* kube_payload_basedir - will be created if it does not exist. Manifests placed in directory `argocd` under this.
* kube_payload_owner - user that owns the files, needs to have access to kubectl
* kube_payload_group - group that owns the files
* kube_payload_argocd_version - argocd version to deploy, without the `v` prefix. Example: `1.5.4`

Example Playbook
----------------

Use as follows:

    - name: Deploy Argocd
      hosts: servers
      become: true
      tasks:
        - include_role:
            name: kube-payload-argocd
          vars:
            kube_payload_basedir: '/some/path'
            kube_payload_argocd_version: 1.5.4
            kube_payload_owner: root
            kube_payload_group: root

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
