# Kubernetes Cluster Setup

## Preparations

* clone this repo
* create an ssh keypair (or several)
* adjust group\_vars/all.yml:
  * list of accounts to create (vault string\_encrypted)
  * comment per account (vault string\_encrypted)
  * ssh public key per account (vault string\_encrypted)
* start a shell with an ssh-agent available
* add at least one of your keys to the agent

## Bootstrapping Rubix

* install a fresh Raspbian on the Raspberry Pi. (rubix)
* add ssh key to "pi" account, so that Ansible can log in
* set non-default password for account "pi"
* sudo systemctl start openssh-server
* sudo systemctl enable openssh-server
* run the ```init_rubix.yml``` playbook

