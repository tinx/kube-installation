kube-repo-mirror
================

Set up a mirror for a repository using rsync. Each run will update
the mirror and also set up a cron job to automatically run the generated
script.

Role Variables
--------------

* kube_repo_mirror_jobname
* kube_repo_mirror_source
* kube_repo_mirror_target
* kube_repo_mirror_excludes - a list of excludes

Example Playbook
----------------

    - name: Mirror Centos7 Updates
      hosts: servers
      become: true
      tasks:
        - name: Mirror Centos7 Updates
          include_role:
            name: kube-repo-mirror
          vars:
            kube_repo_mirror_jobname: centos7-updates
            kube_repo_mirror_source: 'rsync://mirror.eu.oneandone.net/centos/7.4.1708/updates/x86_64/'
            kube_repo_mirror_target: '/var/www/html/centos/7.4.1708/updates/x86_64/'
            kube_repo_mirror_excludes:
              - 'drpms/'

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
