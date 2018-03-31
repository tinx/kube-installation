default: synopsis

synopsis:
	@echo "See https://github.com/tinx/kube-installation ..."
	@echo
	@echo "make init-rubix - first installation post steps"
	@echo "make rubix      - full configuration for rubix, the control server" 
	@echo "make kubes      - full configuration for the nodes"
	@echo
	@echo "You will be asked for the vault password when you run these commands."
	@echo

init-rubix:
	ansible-playbook init_rubix.yml -i inventory/kubernetes_nodes --ask-vault-pass

rubix:
	ansible-playbook configure_rubix.yml -i inventory/kubernetes_nodes --ask-vault-pass

kubes:
	ansible-playbook configure_kubes.yml -i inventory/kubernetes_nodes --ask-vault-pass

