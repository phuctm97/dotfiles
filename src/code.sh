#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

set_heading "Install VSCode"

brew_cask_install visual-studio-code

readonly VSCODE_USER_SETTINGS_DIR="$HOME/Library/Application Support/Code/User"
create_symlink ../cfg/code/settings.json "$VSCODE_USER_SETTINGS_DIR"
create_symlink ../cfg/code/keybindings.json "$VSCODE_USER_SETTINGS_DIR"
