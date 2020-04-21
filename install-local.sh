#!/bin/bash

# Modules' aliases.
declare -r DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
declare -r SRC="$DIR/src"
declare -r CFG="$DIR/cfg"

are_xcode_command_line_tools_installed() {
  xcode-select --print-path &> /dev/null
}

install_xcode_command_line_tools() {
  xcode-select --install &> /dev/null
}

# Install with dotfiles locally, can be executed multiple times, only necessary actions will be
# re-played.
install() {
  if ! are_xcode_command_line_tools_installed; then
    # Install XCode Command Line Tools and wait util it's finished as XCode Command Line Tools are
    # required for all next steps including executing Python scripts, installing Homebrew, etc.
    install_xcode_command_line_tools
    until are_xcode_command_line_tools_installed; do
      sleep 5;
    done
  fi

  . $SRC/enable-sudo-auth-touch-id.sh

  . $SRC/install-homebrew.sh

  . $SRC/fix-zsh-permissions.sh

  . $SRC/install-antigen.sh

  . $SRC/install-fonts.sh

  . $SRC/install-tools.sh

  . $SRC/create-syslinks.sh
}

install "$@"
