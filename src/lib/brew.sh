#!/bin/bash

is_homebrew_installed() {
  cmd_exists brew
}

install_homebrew() {
  if is_homebrew_installed; then
    return
  fi

  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

is_brew_formula_installed() {
  brew list --versions "$1" &> /dev/null
}

brew_install() {
  for formula in "$@"
  do
    if is_brew_formula_installed "$formula"; then
      continue
    fi

    HOMEBREW_NO_AUTO_UPDATE=1 \
    brew install "$formula"
  done
}

brew_tap() {
  HOMEBREW_NO_AUTO_UPDATE=1 \
  brew tap "$1"
}

is_brew_cask_installed() {
  brew cask list --versions "$1" &> /dev/null
}

brew_cask_install() {
  for cask in "$@"
    do
    if is_brew_cask_installed "$cask"; then
      continue
    fi

    HOMEBREW_NO_AUTO_UPDATE=1 \
    brew cask install "$cask"
  done
}
