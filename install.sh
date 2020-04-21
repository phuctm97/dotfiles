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

install() {
  if ! are_xcode_command_line_tools_installed; then
    # Install XCode Command Line Tools and wait til it's finished.
    # XCode Command Line Tools are required for all next steps including Git clone, executing
    # Python scripts, installing Homebrew, etc.
    install_xcode_command_line_tools
    until are_xcode_command_line_tools_installed; do
      sleep 5;
    done
  fi

  # Clone dotfiles repository.
  mkdir -p $DOTFILES_DIR
  cd $DOTFILES_DIR
  git clone $DOTFILES_REPO .

  # Source main.sh.
  . src/main.sh
}

install "$@"
