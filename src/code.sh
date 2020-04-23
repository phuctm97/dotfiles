#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

set_heading "Install VSCode"

brew_cask_install visual-studio-code

code_symlink_conf ../cfg/code/settings.json
code_symlink_conf ../cfg/code/keybindings.json

# Install extensions.
code_install_extensions \
  Equinusocio.vsc-material-theme \
  Equinusocio.vsc-community-material-theme \
  equinusocio.vsc-material-theme-icons \
  vscodevim.vim \
  ms-azuretools.vscode-docker \
  timonwong.shellcheck

# Enable key-repeating for VSCode Vim.
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false &> /dev/null || true
defaults delete -g ApplePressAndHoldEnabled &> /dev/null || true
