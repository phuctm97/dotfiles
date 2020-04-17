#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

set_heading "Install GnuPG"

brew_install \
  gnupg \
  pinentry-mac

gnupg_symlink_conf ../cfg/gpg-agent.conf
