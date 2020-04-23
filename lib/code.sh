#!/bin/bash

symlink_code_settings() {
  local -r code_settings_dir="$HOME/Library/Application Support/Code/User"
  mkdir -p "$code_settings_dir"

  symlink "$1" "$code_settings_dir"
}
