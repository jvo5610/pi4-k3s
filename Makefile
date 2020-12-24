help:
	@echo "First check Environment vars"
	@echo "make env"
	
env:
	./make_env.sh $(FIXED_IP) $(ZEROTIER_VPC_ID) $(ZEROTIER_TOKEN) $(GITHUB_USERNAME) $(HOSTNAME)

ENV=./Environment
SHELL := /bin/bash
include $(ENV)