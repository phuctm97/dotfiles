#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

set_heading "Install VSCode"

brew_cask_install visual-studio-code

symlink_code_settings ../cfg/code/settings.json
symlink_code_settings ../cfg/code/keybindings.json
