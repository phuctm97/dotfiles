#!/bin/bash

main() {
  local cwd="$(pwd)"

  # Fix permission issues with ZSH.
  cd /usr/local/share
  sudo chmod -R 755 zsh

  cd $cwd
}

main "$@"
