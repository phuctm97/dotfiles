#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

set_heading "Install Neovim"

brew_install neovim

mkdir -p "$HOME/.config"
symlink ../cfg/nvim "$HOME/.config/nvim"
nvim --headless +PlugInstall +qa
