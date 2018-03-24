kube-account
============

Configure a single account, including ssh authorized keys and sudoers configuration.
If the account does not exist, it is created.

Role Variables
--------------

* kube_account_name
* kube_account_comment (optional, defaults to "")
* kube_account_sudo (optional, defaults to false) - if true, this account can use sudo without needing a password
* kube_account_ssh_keys - a list of ssh key entries to be added to the authorized_keys file

Example Playbook
----------------

Use as follows:

    - name: Set up ansible automation account
      hosts: servers
      become: true
      tasks:
        - include_role:
            name: kube-account
          vars:
            kube_account_name: ansible
            kube_account_comment: Ansible Automation
            kube_account_sudo: true
            kube_account_ssh_keys:
                - ssh_key_1
                - ssh_key_2

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
