#!/bin/bash

install_antigen() {
  local antigen_zsh="/usr/local/share/antigen/antigen.zsh"
  if [ -f "$antigen_zsh" ]; then
    return
  fi

  # Install Antigen.
  local antigen_dir="$(dirname "$antigen_zsh")"
  sudo mkdir -p "$antigen_dir"
  sudo chmod -R 755 "$antigen_dir"
  sudo chown -R "$(whoami)" "$antigen_dir"
  curl -o "$antigen_zsh" -L https://git.io/antigen
}

execute "install_antigen" "Install Antigen"
