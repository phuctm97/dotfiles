#!/bin/bash

main() {
  local antigen_zsh="/usr/local/share/antigen/antigen.zsh"
  if [ -f "$antigen_zsh" ]; then
    return
  fi

  # Install Antigen.
  local antigen_dir="$(dirname \"$antigen_zsh\")"
  mkdir -p "$antigen_dir"
  sudo chmod -R 755 "$antigen_dir"
  curl -o "$antigen_zsh" -L git.io/antigen
}

main "$@"
