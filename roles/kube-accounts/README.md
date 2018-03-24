kube-accounts
=============

Sets up multiple user accounts with permission to sudo without a password and 
an authorized ssh public key each. All these accounts can only log in using
their respective ssh key.

Also sets up an "ansible" account with permission to sudo without a password, 
authorizing all the ssh public keys for it, so all the users can administer 
the server using ansible.

Finally, disables root login with a password.

If any changes were made, the ssh service is restarted at the end.

Role Variables
--------------

* kube_accounts_userlist - a list of dictionaries with keys:
  * username
  * comment (optional, default "")
  * ssh_key

Dependencies
------------

kube-account

Example Playbook
----------------

Given a group_vars/all.yml file with this structure

    kube_users:
      - username: tmusterfrau
        comment: Tina Musterfrau
        ssh_key: !vault |
              $ANSIBLE_VAULT;1.1;AES256
              [...]

use the role like this:

    - name: Basic account and login setup
      hosts: servers
      become: true
      tasks:
        - include_role:
            name: kube-accounts
          vars:
            kube_accounts_userlist: '{{ kube_users }}'

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
