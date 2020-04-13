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
* if a kernel update was installed during package update, some of the
  steps may fail and you should reboot, then run ```make rubix``` again
  * if this happens after network configuration, you may need to do the 
    next step early to be able to re-run ```make rubix``` 
* as soon as the network configuration has run successfully, 
  do not forget to remove the inventory entry again, instead
  you may have to add rubix to your /etc/hosts with its permanent ip
  (192.168.0.40)

## Full Install of the Kube Node Host Systems

* start them with a blanked disk `/dev/sda` and - if desired - storage disk `/dev/sdb`, e.g. by running 
  ```dd if=/dev/zero of=/dev/sda bs=1M count=100```
* run ```make kubes```
* reboot all kubes so network is available
* run ```make storage```
* for now: On Rubix as root: 
    * TODO could be moved off rubix, but then need pip3 virtual env that does not need root
    * `apt-get install screen git python3-pip`
    * `git clone https://github.com/kubernetes-sigs/kubespray`
    * `cd kubespray`
    * `pip3 install -r requirements.txt`
    * `cp -rfp inventory/sample inventory/mycluster`
    * `declare -a IPS=(192.168.200.41 192.168.200.42 192.168.200.43)`
    * `CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}`
    * `vi inventory/mycluster/group_vars/all/all.yml` &rightarrow; local `all.yml`
    * `vi inventory/mycluster/group_vars/k8s-cluster/k8s-cluster.yml` &rightarrow; local `k8s-cluster.yml`
    * `vi inventory/mycluster/hosts.yaml` &rightarrow; local `hosts.yaml`
    * rename nodes from node1-3 in hosts.yaml DONE
    * configure extras repo DONE
    * make sure SSH agent variables are set (SSH_AUTH_SOCK)
    * `ansible-playbook -u ansible -i inventory/mycluster/hosts.yaml  --become --become-user=root cluster.yml`
