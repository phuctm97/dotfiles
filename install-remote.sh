#!/bin/bash

# Where to install dotfiles (clone dotfiles repository) from and to.
readonly DOTFILES_REPO="https://github.com/phuctm97/dotfiles.git"
readonly DOTFILES_DIR="$HOME/.dotfiles"

are_xcode_command_line_tools_installed() {
  xcode-select --print-path &> /dev/null
}

install_xcode_command_line_tools() {
  if are_xcode_command_line_tools_installed; then
    return
  fi

  xcode-select --install &> /dev/null
  until are_xcode_command_line_tools_installed; do
    sleep 5;
  done
}

# Install without dotfiles locally: Install necessary tools then download
# $DOTFILES_REPO into $DOTFILES_DIR and run $DOTFILES_DIR/install-local.sh.
# This should only be executed once and when there's no dotfiles locally, when
# there's dotfiles locally, use install-local.sh instead.
run() {
  set -e

  # Install XCode Command Line Tools and wait util it's finished as XCode Command
  # Line Tools are required for all next steps including Git clone, executing
  # Python scripts, installing Homebrew, etc.
  install_xcode_command_line_tools

  # Remove existing dotfiles.
  if [ -d "$DOTFILES_DIR" ]; then
    rm -rf "$DOTFILES_DIR"
  elif [ -f "$DOTFILES_DIR" ]; then
    rm "$DOTFILES_DIR"
  fi

  # Clone dotfiles repository.
  mkdir -p "$DOTFILES_DIR"
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR" &> /dev/null

  # Run install-local.sh.
  "$DOTFILES_DIR/install-local.sh" "$@"
}

run "$@"
