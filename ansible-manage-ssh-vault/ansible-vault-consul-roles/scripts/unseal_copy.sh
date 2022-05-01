#!/bin/sh 
VAULT_ADDR=http://192.168.56.156:8200


echo "vault operator unseal -address=${VAULT_ADDR} $(cat /Users/genesisancheta/repo/ansible-manage-ssh-vault/ansible-vault-consul-roles/roles/vault-unseal/unseal-local/unseal/unseal_key_0)"  >> roles/common/templates/vault_unseal.j2 
echo "vault operator unseal -address=${VAULT_ADDR} $(cat /Users/genesisancheta/repo/ansible-manage-ssh-vault/ansible-vault-consul-roles/roles/vault-unseal/unseal-local/unseal/unseal_key_1)"  >> roles/common/templates/vault_unseal.j2 
echo "vault operator unseal -address=${VAULT_ADDR} $(cat /Users/genesisancheta/repo/ansible-manage-ssh-vault/ansible-vault-consul-roles/roles/vault-unseal/unseal-local/unseal/unseal_key_2)"  >> roles/common/templates/vault_unseal.j2 

