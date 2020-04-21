#!/bin/bash

main() {
  local zsh_dir="/usr/local/share/zsh"
  if [ ! -d "$zsh_dir" ]; then
    return
  fi

  # Fix permission issues with ZSH.
  sudo chmod -R 755 "$zsh_dir"
  sudo chown -R $(whoami) "$zsh_dir"
}

main "$@"
