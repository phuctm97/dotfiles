#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

set_heading "Install Kitty"

brew_cask_install kitty

mkdir -p "$HOME/.config"
symlink ../cfg/kitty "$HOME/.config/kitty"
