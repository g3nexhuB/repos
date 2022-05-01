#!/bin/sh


echo "Unseal script"


echo "Unsealing ..."
vault operator unseal -address=${VAULT_ADDR} upI0CN1YKVAx2Yhc8E4FtgJzZS8ZhA7El3ZP+HQSGKex
vault operator unseal -address=${VAULT_ADDR} l39X6id2QhraoArgPMg9fcpzAf6rxJEDE6Bm19FAXbGd
vault operator unseal -address=${VAULT_ADDR} KdnphucLlcwBerfZCZweG2jZCQoGF/SS2r1rla7426Eb

echo "Completed"

vault status

exit 0