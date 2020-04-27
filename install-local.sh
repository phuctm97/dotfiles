#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . lib/include.sh

run() {
  src/sudo.sh
  src/xcode.sh
  src/brew.sh
  src/fonts.sh
  src/gnupg.sh
  src/zsh.sh
  src/node.sh
  src/go.sh
  src/vim.sh
  src/cli-tools.sh
  src/docker.sh
  src/code.sh
  src/chrome.sh
  src/slack.sh
  src/vlc.sh
  src/screen-savers.sh
}

run "$@"
