#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

set_heading "Install Fonts"

brew_tap homebrew/cask-fonts
brew_cask_install \
  font-saucecodepro-nerd-font \
  font-firacode-nerd-font
