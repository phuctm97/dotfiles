#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

set_heading "Setup ZSH"

fix_zsh_perms
brew_install antigen

create_symlink ../cfg/.zshrc ~
create_symlink ../cfg/.antigenrc ~
