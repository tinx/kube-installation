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

* install a fresh Raspbian (stretch-lite) on the Raspberry Pi (rubix)
* add ssh key to "pi" account, so that Ansible can log in
* set non-default password for account "pi"
* sudo systemctl start ssh
* sudo systemctl enable ssh
* find out the ip address assigned to the pi via ifconfig
* temporarily enter its ip address into the inventory
```
rubix    ansible_host=192.168.0.118 ...
```
* run ```make init-rubix```
* run ```make rubix```
  * this will also clone the [kubespray](https://github.com/kubernetes-sigs/kubespray) repo 
    into /home/ansible/kubespray and configure everything in it
* if a kernel update was installed during package update, some of the
  steps may fail and you should reboot, then run ```make rubix``` again
  * if this happens after network configuration, you may need to do the 
    next step early to be able to re-run ```make rubix``` 
* as soon as the network configuration has run successfully, 
  do not forget to remove the inventory entry again, instead
  you may have to add rubix to your /etc/hosts with its permanent ip
  (192.168.0.40)


## Full Install of the Kube Node Host Systems

* boot them with a blanked disk `/dev/sda`
    * run `dd if=/dev/zero of=/dev/sda bs=1M count=100` to blank the disk 
    * this will perform a pxe boot and kickstart centos installation.
* run ```make kubes```
* reboot all kubes so network is available
* if you wish to completely wipe storage. now is the time to blank disk `/dev/sdb` on all three kubes
    * run `dd if=/dev/zero of=/dev/sdb bs=1M count=100` to blank the storage disks
* run ```make storage```
* for now: On Rubix as root:
    * make sure SSH agent variables are set (SSH_AUTH_SOCK) and auth forwarding was on when you connected (ssh -A)
    * `ansible-playbook -u ansible -i inventory/mycluster/hosts.yaml  --become --become-user=root cluster.yml`
