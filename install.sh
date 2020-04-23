#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . lib/include.sh

run() {
  src/sudo.sh
  src/xcode.sh
  src/brew.sh
  src/zsh.sh
  src/gpg.sh
  src/cli-tools.sh
  src/chrome.sh
  src/code.sh
  src/fonts.sh
  src/screen-savers.sh
}

run "$@"
