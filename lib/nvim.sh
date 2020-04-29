#!/bin/bash

nvim_symlink_conf() {
  local -r nvim_conf_dir="$HOME/.config/nvim"
  mkdir -p "$nvim_conf_dir"

  symlink "$1" "$nvim_conf_dir"
}
