kube-prepare-kubespray
======================

Clones and configures [kubespray](https://github.com/kubernetes-sigs/kubespray).

Limitations
-----------

Only tested on Centos 7.

Still includes some hard-coded IPs and node names in `hosts.yaml.j2`.

Role Variables
--------------

- kube_prepare_kubespray_repodir - path to directory to use for cloning
- kube_prepare_kubespray_giturl - git url to use for cloning
- kube_prepare_kubespray_version - git version tag / branch or HEAD to clone

Example Playbook
----------------

    - name: Clone and configure kubespray
      hosts: servers
      become: true
      tasks:
        - name: Clone and configure kubespray
          include_role:
            name: kube-prepare-kubespray
          vars:
            kube_prepare_kubespray_repodir: 'kubespray'
            kube_prepare_kubespray_giturl: 'https://github.com/kubernetes-sigs/kubespray'
            kube_prepare_kubespray_version: 'v.2.14.1'

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
