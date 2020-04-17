#!/bin/bash

fix_zsh_perms() {
  local -r zsh_share_dir="/usr/local/share/zsh"
  if [ -d "$zsh_share_dir" ]; then
    sudo chown -R "$(whoami)" "$zsh_share_dir"
    sudo chmod -R 755 "$zsh_share_dir"
  fi
}
