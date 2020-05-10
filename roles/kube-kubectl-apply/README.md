kube-kubectl-apply
==================

Auxiliary role that handles kubectl apply with proper change detection and error handling
and support for execution on one of the available cluster nodes.

Also offers an easy upgrade path to server side apply when we move to k8s v1.18.

Limitations
-----------

Concurrent updates may walk over each other because k8s v1.17 doesn't support
server side apply yet.

Role Variables
--------------

* kube_kubectl_apply_dir - the working directory
* kube_kubectl_apply_yaml - the yaml resource to diff and then apply if needed
* kube_kubectl_apply_namespace - the namespace to use, otherwise uses default

Example Playbook
----------------

Use as follows:

    - name: Create argocd namespace
      hosts: servers
      become: true
      tasks:
        - include_role:
            name: kube-kubectl-apply
          vars:
            kube_kubectl_apply_dir: /path/to/yamls
            kube_kubectl_apply_yaml: install.yaml
            kube_kubectl_apply_namespace: argocd

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
