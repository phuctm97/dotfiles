#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

set_heading "Install Neovim"

brew_install neovim

nvim_symlink_conf ../cfg/nvim/init.vim
nvim --headless +PlugInstall +qa
