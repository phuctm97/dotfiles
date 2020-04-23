#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

fix_zsh_perms() {
  local zsh_dir="/usr/local/share/zsh"
  if [ -d "$zsh_dir" ]; then
    sudo chown -R "$(whoami)" "$zsh_dir"
    sudo chmod -R 755 "$zsh_dir"
  fi
}

set_heading "Setup ZSH"

fix_zsh_perms
brew_install antigen

create_symlink ../cfg/.zshrc ~
create_symlink ../cfg/.antigenrc ~
