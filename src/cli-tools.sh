#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

set_heading "Install Other CLI Tools"

brew_install \
  github/gh/gh \
  neofetch \
  shellcheck \
  fzf \
  fd
