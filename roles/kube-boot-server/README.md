kube-boot-server
================

Install everything that is needed to boot and automatically install the kube nodes:
* dnsmasq as
  * dhcp server on the private vlan, with fixed mac-to-ip mappings for all nodes
  * pxe boot server on the private vlan
* apache as web server on the private vlan, serving
  * anaconda kickstart files
  * centos packages from the centos 7 minimal dvd (loopback mounted)
  
Also downloads the relevant files for centos 7 pxe boot and the centos 7 minimal dvd
if needed.

Requirements
------------

This role assumes a very specific setup of your networking infrastructure.

In order to allow the kube nodes to perform dhcp configuration and do a pxe boot,
they share a vlan with the kube install host, rubix.

Correspondingly, it assumes a very specific setup of your inventory. See inventory/kubernetes_nodes for details.

Dependencies
------------

kube-repo-mirror

Role Variables
--------------

* kube_boot_server_centos_version - the full version number of the ISO and pxe files to provide (e.g. "7.4.1708")
* kube_boot_server_ssh_keys - a list of ssh public keys to add to the authorized_keys of the "ansible" account on installed nodes

Note: also see the Requirements section.

Example Playbook
----------------

    - name: Configure PXE boot services
      hosts: kube_install_hosts
      become: true
      tasks:
        - name: Configure boot server
          include_role:
            name: kube-boot-server
          vars:
            kube_boot_server_ssh_keys:
                - ssh_key_1
                - ssh_key_2
            kube_boot_server_centos_version: '7.7.1908'
            kube_boot_centos_iso_download_url_path: 'http://mirror.eu.oneandone.net/linux/distributions/centos/7/isos/x86_64/'
            kube_boot_centos_iso_filename: 'CentOS-7-x86_64-Minimal-1908.iso'
            kube_boot_centos_iso_checksum: 'sha256:9a2c47d97b9975452f7d582264e9fc16d108ed8252ac6816239a3b58cef5c53d'

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx

