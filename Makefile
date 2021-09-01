help:
	@echo "First check Environment vars"
	@echo "make env"
	
config_dataend:
	ansible-playbook config_dataend.yaml

config_nodes:
	ansible-playbook config_nodes.yaml

deploy:
	ansible-playbook deploy_dataend.yaml
	ansible-playbook deploy_nodes.yaml
