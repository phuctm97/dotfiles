#!/bin/bash

# Fix permission issues with ZSH.
CWD=$(pwd)
cd /usr/local/share
sudo chmod -R 755 zsh
cd $CWD

