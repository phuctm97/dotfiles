#!/bin/bash

main() {
  local cwd="$(pwd)"

  # Install Antigen.
  cd /usr/local/share
  mkdir antigen
  sudo chmod -R 755 antigen
  cd antigen
  curl -L git.io/antigen > antigen.zsh

  cd $cwd
}

main "$@"
