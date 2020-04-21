#!/bin/bash

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

  . src/enable-sudo-auth-touch-id.sh

  . src/install-homebrew.sh

  . src/fix-zsh-permissions.sh

  . src/install-antigen.sh

  #. $SRC/install-fonts.sh

  #. $SRC/install-tools.sh

  . src/create-symlinks.sh
}

# Change into dotfiles and install.
cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
install "$@"
