#!/bin/bash

code_symlink_conf() {
  local -r code_conf_dir="$HOME/Library/Application Support/Code/User"
  mkdir -p "$code_conf_dir"

  symlink "$1" "$code_conf_dir"
}

code_install_extensions() {
  for ext in "$@"
  do
    code --install-extension "$ext"
  done
}
