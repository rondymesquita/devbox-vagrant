#!/usr/bin/env bash
source ./_variables.sh

HOME="/home/${BOX_USER}"
cd $HOME

# Copy bashrc
cp .bashrc .bashrc-bkp
cp /vagrant/resources/bashrc.sh ./
mv bashrc.sh .bashrc
