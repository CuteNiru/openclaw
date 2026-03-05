#!/bin/bash

# Configure Git for CuteNiru
git config --global user.email "cutestar.panda@gmail.com"
git config --global user.name "CuteNiru"

# Clone from your new private memory repo
git clone https://${GITHUB_TOKEN}@github.com/CuteNiru/openclaw-memory /.openclaw/workspace

# Allow web access on Hugging Face
node openclaw.mjs config set gateway.controlUi.dangerouslyAllowHostHeaderOriginFallback true --strict-json

# Start on port 7860 for Hugging Face
node openclaw.mjs gateway --bind lan --port 7860 --allow-unconfigured --auth token --token "${GITHUB_TOKEN}"
