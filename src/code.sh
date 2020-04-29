#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

set_heading "Install VSCode"

# Install VSCode.
brew_cask_install visual-studio-code

# Symlink configs.
code_symlink_conf ../cfg/code/settings.json
code_symlink_conf ../cfg/code/keybindings.json

# Install extensions.
code_install_extensions \
  jdinhlife.gruvbox \
  PKief.material-icon-theme \
  vscodevim.vim \
  ms-azuretools.vscode-docker \
  timonwong.shellcheck \
  dbaeumer.vscode-eslint \
  esbenp.prettier-vscode

# Enable key-repeating for VSCode Vim.
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false &> /dev/null || true
defaults delete -g ApplePressAndHoldEnabled &> /dev/null || true
