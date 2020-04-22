#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

run() {
  # Fix ZSH permissions.
  local zsh_dir="/usr/local/share/zsh"
  if [ -d "$zsh_dir" ]; then
    sudo chown -R "$(whoami)" "$zsh_dir"
    sudo chmod -R 755 "$zsh_dir"
  fi

  # Install Antigen.
  brew_install antigen
}

run "$@"
