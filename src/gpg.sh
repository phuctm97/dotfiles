#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

set_heading "Install GnuPG"

brew_install \
  gnupg \
  pinentry-mac

symlink ../cfg/gpg-agent.conf ~
