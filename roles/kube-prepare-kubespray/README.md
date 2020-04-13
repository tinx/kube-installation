kube-prepare-kubespray
======================

Clones and configures [kubespray](https://github.com/kubernetes-sigs/kubespray).

Limitations
-----------

Only tested on Centos 7.

Role Variables
--------------

- kube_prepare_kubespray_repodir - path to directory to use for cloning
- kube_prepare_kubespray_giturl - git url to use for cloning

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

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
