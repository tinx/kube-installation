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

* install a fresh Raspbian (buster-lite) on the Raspberry Pi (rubix)
  * updated from stretch-lite to Raspbian buster-lite following 
    [these instructions](https://pimylifeup.com/upgrade-raspbian-stretch-to-raspbian-buster/)
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
* run ```make kubes``` again to make sure all configs were fully applied
* if you wish to completely wipe storage. now is the time to blank disk `/dev/sdb` on all three kubes
    * run `dd if=/dev/zero of=/dev/sdb bs=1M count=100` to blank the storage disks
* run ```make storage``` - this will mount storage if already initialized, or initialize it if not
* Roll out kubernetes using kubespray:
    * make sure SSH agent variables are set (SSH_AUTH_SOCK)
    * connect to rubix with auth forwarding as user ansible: `ssh -A ansible@rubix`
    * `cd /home/ansible/kubespray`
    * `ansible-playbook -u ansible -i inventory/mycluster/hosts.yaml  --become --become-user=root cluster.yml`
    * after installation has finished you should have a running k8s cluster, and root should have
      a working api config file on the nodes. Try `kubectl get pods`

## Deploy Infrastructure in Kubernetes

* run ```make payloads```

## Remount Storage after Node Reboot

* run ```make storage``` (for all 3 nodes) or e.g. ```make storage-kube1```.

