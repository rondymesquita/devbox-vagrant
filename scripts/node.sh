#!/usr/bin/env bash
source ./_variables.sh

curl -sL https://deb.nodesource.com/setup_${BOX_NODE_VERSION}.x | sudo -E bash -
sudo apt-get install -y nodejs
