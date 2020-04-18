#!/bin/bash

# Install XCode Command Line Tools and wait til it's finished.
# XCode Command Line Tools are required for all next steps including Git clone, executing Python
# scripts, installing Homebrew, etc.
xcode-select --install &> /dev/null
until $(xcode-select --print-path &> /dev/null); do
  sleep 5;
done

# Where to install dotfiles (clone dotfiles repository) from and to.
readonly DOTFILES_REPO="https://github.com/phuctm97/dotfiles.git"
readonly DOTFILES_DIR="$HOME/dotfiles"

# Clone dotfiles repository.
mkdir -p $DOTFILES_DIR
cd $DOTFILES_DIR
git clone $DOTFILES_REPO .

# Source main.sh.
. src/main.sh
