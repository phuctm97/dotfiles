#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

set_heading "Setup ZSH"

fix_zsh_perms
brew_install antigen

symlink ../cfg/.zshrc ~
symlink ../cfg/.antigenrc ~
