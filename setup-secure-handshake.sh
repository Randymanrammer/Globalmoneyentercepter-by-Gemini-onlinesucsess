#!/bin/bash
# Setup the Secure Handshake

# 1. Generate the 256-bit Key
ssh-keygen -t ed25519 -C "randy-fleet-key" -f ./id_rsa_fleet -N ""

# 2. Add the Public Key to your GitHub Repo Secrets
echo "Copy the text below into your GitHub Secret named 'FLEET_SSH_KEY':"
cat ./id_rsa_fleet.pub

# 3. Connect GCP to GitHub
gcloud source repos create global-interceptor-fleet
gcloud source repos pull global-interceptor-fleet
