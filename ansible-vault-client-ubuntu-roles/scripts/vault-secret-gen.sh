#!/bin/sh

export SHA256=$(shasum -a 256 "/etc/vault/plugins/vault-secrets-gen" | cut -d' ' -f1)

vault plugin register \
    -sha256="${SHA256}" \
    -command="vault-secrets-gen" \
    secret secrets-gen

vault secrets enable \
    -path="gen" \
    -plugin-name="secrets-gen" \
    plugin
