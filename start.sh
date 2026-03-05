#!/bin/bash

# Setup Git with your new account info
git config --global user.email "cutestar.panda@gmail.com"
git config --global user.name "CuteNiru"

# Clone your new memory repo (Ensure GITHUB_TOKEN is in Hugging Face Secrets)
git clone https://${GITHUB_TOKEN}@github.com/CuteNiru/openclaw-memory /.openclaw/workspace

# Web security override for Hugging Face
node openclaw.mjs config set gateway.controlUi.dangerouslyAllowHostHeaderOriginFallback true --strict-json

# Start on Hugging Face port 7860
node openclaw.mjs gateway --bind lan --port 7860 --allow-unconfigured --auth token --token "${GITHUB_TOKEN}"
