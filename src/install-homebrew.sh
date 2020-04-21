#!/bin/bash

install_homebrew() {
  if cmd_exists "brew"; then
    return
  fi

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

execute "install_homebrew" "Install Homebrew"
