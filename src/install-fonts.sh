#!/bin/bash

brew_tap() {
  HOMEBREW_NO_AUTO_UPDATE=1 brew tap "$1"
}

brew_cask_install() {
  if brew cask ls --versions "$1" &> /dev/null; then
    return
  fi

  HOMEBREW_NO_AUTO_UPDATE=1 brew cask install "$1"
}

# Install Nerd Fonts.
execute "brew_tap \"homebrew/cask-fonts\"" "Tap brew fonts"
execute "brew_cask_install \"font-firacode-nerd-font\"" "Install Font Fira Code Nerd Font"
execute "brew_cask_install \"font-saucecodepro-nerd-font\"" "Install Font Source Code Pro Nerd Font"
execute "brew_cask_install \"font-firacode-nerd-font\"" "Install Font Fira Code Nerd Font"
