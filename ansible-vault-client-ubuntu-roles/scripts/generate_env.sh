#!/bin/sh 
VAULT_ADDR=http://192.168.56.154:8200


echo "export LANG=en_US.utf-8" >> roles/common/templates/environment_client.j2
echo "export LC_ALL=en_US.utf-8" >> roles/common/templates/environment_client.j2
echo "export VAULT_ADDR=http://{{ vault_addr }}:8200" >> roles/common/templates/environment_client.j2
echo "export VAULT_TOKEN=$(cat /Users/genesisancheta/repo/ansible-vault-client-roles/roles/vault-unseal/root_token/rootkey)" >> roles/common/templates/environment_client.j2

