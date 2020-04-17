#!/bin/bash

gnupg_symlink_conf() {
  local -r gnupg_conf_dir="$HOME/.gnupg"
  mkdir -p "$gnupg_conf_dir"
  chmod 700 "$gnupg_conf_dir"

  symlink "$1" "$gnupg_conf_dir"
}
