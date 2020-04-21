#!/bin/bash

fix_zsh_permission() {
  local zsh_dir="/usr/local/share/zsh"
  if [ ! -d "$zsh_dir" ]; then
    return
  fi

  sudo chmod -R 755 "$zsh_dir"
  sudo chown -R "$(whoami)" "$zsh_dir"
}

execute "fix_zsh_permission" "Fix ZSH Permissions"
