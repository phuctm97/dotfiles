#!/bin/bash

main() {
  # Fix permission issues with ZSH.
  local zsh_dir="/usr/local/share/zsh"
  sudo chmod -R 755 "$zsh_dir"
  sudo chown -R $(whoami) "$zsh_dir"
}

main "$@"
