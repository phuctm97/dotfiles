#!/bin/bash

# Where to install dotfiles (clone dotfiles repository) from and to.
declare -r DOTFILES_REPO="https://github.com/phuctm97/dotfiles.git"
declare -r DOTFILES_DIR="$HOME/.dotfiles"

are_xcode_command_line_tools_installed() {
  xcode-select --print-path &> /dev/null
}

install_xcode_command_line_tools() {
  xcode-select --install &> /dev/null
}

# Install without dotfiles locally: Install necessary tools then download $DOTFILES_REPO into
# $DOTFILES_DIR and run $DOTFILES_DIR/install-local.sh. This should only be executed once and when
# there's no dotfiles locally, when there's dotfiles locally, use install-local.sh instead.
install() {
  if ! are_xcode_command_line_tools_installed; then
    # Install XCode Command Line Tools and wait util it's finished as XCode Command Line Tools are
    # required for all next steps including Git clone, executing Python scripts, installing
    # Homebrew, etc.
    install_xcode_command_line_tools
    until are_xcode_command_line_tools_installed; do
      sleep 5;
    done
  fi

  # Remove existing dotfiles.
  if [ -d "$DOTFILES_DIR" ]; then
    sudo rm -rf "$DOTFILES_DIR"
  elif [ -f "$DOTFILES_DIR" ]; then
    sudo rm "$DOTFILES_DIR"
  fi

  # Clone dotfiles repository.
  mkdir -p "$DOTFILES_DIR"
  cd "$DOTFILES_DIR" || return 1
  git clone "$DOTFILES_REPO" . &> /dev/null

  # Source install-local.sh.
  . install-local.sh
}

install "$@"
