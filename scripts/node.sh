#!/usr/bin/env bash
source ./_variables.sh

curl -sL https://deb.nodesource.com/setup_${BOX_NODE_VERSION}.x | sudo -E bash -
sudo apt-get install -y nodejs

# Configuration
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
