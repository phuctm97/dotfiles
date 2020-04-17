#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

set_heading "Install Google Chrome"

brew_cask_install google-chrome
