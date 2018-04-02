kube-ntp-client
===============

Configure the host to automatically update its time using ntpdate.

Role Variables
--------------

* kube_ntp_client_ntp_servers - a list of ntp servers

Example Playbook
----------------

    - name: Configure NTP client
      hosts: servers
      become: true
      tasks:
        - include_role:
            name: kube-ntp-client
          vars:
            kube_ntp_client_ntp_servers:
              - pool.ntp.org

License
-------

Apache 2.0

Author Information
------------------

https://github.com/tinx
