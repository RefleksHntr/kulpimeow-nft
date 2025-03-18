#!/bin/bash
# Load environment variables
source .env

# Loop untuk mint NFT dari token ID 0 sampai MAX_SUPPLY
for ((i=0; i<5555; i++)); do
    cast send $NFT_CONTRACT "safeMint(address)" $OWNER_ADDRESS \
        --rpc-url $RPC_URL \
        --private-key $PRIVATE_KEY
    sleep 1  # Beri jeda agar tidak terkena rate limit
done
