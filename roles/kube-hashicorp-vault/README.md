kube-hashicorp-vault
====================

Install [hashicorp vault](https://www.vaultproject.io/) on a raspberry pi.

Limitations
-----------

Only supports 32-bit arm architecture for now. Requires systemd.

Role Variables
--------------

* kube_hashicorp_vault_account_name (creates both a user account and a group with the same name)

Example Playbook
----------------

Use as follows:

    - name: Install hasicorp vault
      hosts: servers
      become: true
      tasks:
        - include_role:
            name: kube-hashicorp-vault
          vars:
            kube_hashicorp_vault_account_name: vault
            kube_hashicorp_vault_distribution_url: 'https://releases.hashicorp.com/vault/1.4.1/vault_1.4.1_linux_arm.zip'
            kube_hashicorp_vault_distribution_checksum: 'sha256:cb9ef2be0d81e1d102801cd9dc747a1df9a0fd104465a4bf697244929947a494'

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
