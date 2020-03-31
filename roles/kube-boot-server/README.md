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
            kube_boot_server_pxe_files:
              - url: 'http://mirror.centos.org/centos/7.7.1908/os/x86_64/EFI/BOOT/BOOTX64.EFI'
                filename: bootx64.efi
                checksum: 'sha256:62c6affbee1ba9a0435562db6e092a5018effeed0bd0f1d0494f34ce6cd403e9'
              - url: 'http://mirror.centos.org/centos/7.7.1908/os/x86_64/EFI/BOOT/grubx64.efi'
                filename: grubx64.efi
                checksum: 'sha256:90008a4584a1afe1f7ee6ecba463b48a50911f792512c54f8fa9c5f06e40f383'
              - url: 'http://mirror.centos.org/centos/7.7.1908/os/x86_64/images/efiboot.img'
                filename: efiboot.img
                checksum: 'sha256:568b80e3bdbc6dd8652c1a7cbd039bc3736a0ecf35f042c383338ab487310785'
              - url: 'http://mirror.centos.org/centos/7.7.1908/os/x86_64/images/pxeboot/initrd.img'
                filename: pxeboot/initrd.img
                checksum: 'sha256:8c97a6f32ae8ab59425bdff8321eb8d99827313fb51e5498e2fcb438befa3d83'
              - url: 'http://mirror.centos.org/centos/7.7.1908/os/x86_64/images/pxeboot/vmlinuz'
                filename: pxeboot/vmlinuz
                checksum: 'sha256:156ddeaccea0ee51eb9af42b2551f393f84d6adaf7d257fa5b174657d38cead6'

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx

