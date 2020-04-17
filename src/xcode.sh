#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

set_heading "Install XCode Command Line Tools"

install_xcode_command_line_tools
