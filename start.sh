#!/bin/bash

# 1. Setup Git configuration
git config --global user.email "cutestar.panda@gmail.com"
git config --global user.name "Nirupam Gayen"

# 2. Clone memory into the correct home directory for this environment
git clone https://${GITHUB_TOKEN}@github.com/nirupamdev/openclaw-memory /.openclaw/workspace

# 3. Apply security bypass for Hugging Face's proxy
node openclaw.mjs config set gateway.controlUi.dangerouslyAllowHostHeaderOriginFallback true --strict-json

# 4. Start the Gateway on the mandatory Hugging Face port (7860)
# Use --bind lan so the Hugging Face proxy can reach the application
node openclaw.mjs gateway --bind lan --port 7860 --allow-unconfigured --auth token --token "${GITHUB_TOKEN}"
