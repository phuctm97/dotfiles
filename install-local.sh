#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . lib/include.sh

run() {
  src/sudo.sh
  src/xcode.sh
  src/brew.sh
  src/zsh.sh
  src/gnupg.sh
  src/go.sh
  src/node.sh
  src/cli-tools.sh
  src/chrome.sh
  src/code.sh
  src/docker.sh
  src/fonts.sh
  src/screen-savers.sh
  src/slack.sh
}

run "$@"
