#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

set_heading "Enable Authenticating sudo With Touch ID"

enable_sudo_auth_tid
