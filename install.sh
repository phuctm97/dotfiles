#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . src/lib/include.sh

run() {
  src/install/sudo.sh
  src/install/xcode.sh
  src/install/brew.sh
  src/install/zsh.sh
  src/install/gpg.sh
  src/install/cli-tools.sh
  src/install/fonts.sh
  src/config/symlinks.sh
}

run "$@"
