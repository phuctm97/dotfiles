#!/bin/bash

run() {
  # Keep track of current working directory.
  local -r cwd="$(pwd)"

  # Source modules.
  cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . common.sh \
    && . sudo.sh \
    && . xcode.sh \
    && . brew.sh \
    && . zsh.sh \
    && . symlink.sh

  # Go back to where it came from.
  cd "$cwd" || exit 1
}

run "$@"
