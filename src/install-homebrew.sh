#!/bin/bash

main() {
  if command -v "brew" &> /dev/null; then
    return
  fi

  # Install Homebrew.
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

main "$@"
