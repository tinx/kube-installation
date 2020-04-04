default: synopsis

synopsis:
	@echo "See https://github.com/tinx/kube-installation ..."
	@echo
	@echo "make init-rubix      - first installation post steps"
	@echo "make rubix           - full configuration for rubix, the control server" 
	@echo "make kubes           - full configuration for the nodes"
	@echo "make storage[-kubeN] - run storage configuration on one node or all of them"
	@echo
	@echo "You will be asked for the vault password when you run these commands."
	@echo

init-rubix:
	ansible-playbook init_rubix.yml -i inventory/kubernetes_nodes --ask-vault-pass

rubix:
	ansible-playbook configure_rubix.yml -i inventory/kubernetes_nodes --ask-vault-pass

rubix-apache-only:
	ansible-playbook configure_rubix.yml -i inventory/kubernetes_nodes --tags "pxe_setup" --skip-tags "kube_boot_server_dnsmasq,kube_boot_server_download_centos_pxe" --ask-vault-pass

kube1:
	ansible-playbook configure_kubes.yml -i inventory/kubernetes_nodes --limit "kube1" --ask-vault-pass

kube2:
	ansible-playbook configure_kubes.yml -i inventory/kubernetes_nodes --limit "kube2" --ask-vault-pass

kube3:
	ansible-playbook configure_kubes.yml -i inventory/kubernetes_nodes --limit "kube3" --ask-vault-pass

kubes:
	ansible-playbook configure_kubes.yml -i inventory/kubernetes_nodes --ask-vault-pass

storage-kube1:
	ansible-playbook configure_storage.yml -i inventory/kubernetes_nodes --limit "kube1" --ask-vault-pass

storage-kube2:
	ansible-playbook configure_storage.yml -i inventory/kubernetes_nodes --limit "kube2" --ask-vault-pass

storage-kube3:
	ansible-playbook configure_storage.yml -i inventory/kubernetes_nodes --limit "kube3" --ask-vault-pass

storage:
	ansible-playbook configure_storage.yml -i inventory/kubernetes_nodes --ask-vault-pass

