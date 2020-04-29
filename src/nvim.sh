#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

set_heading "Install Neovim"

brew_install neovim

if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
  # Install vim-plug.
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Symlink config.
mkdir -p "$HOME/.config"
symlink ../cfg/nvim "$HOME/.config/nvim"

# Install plugins.
nvim --headless +PlugInstall +qa
