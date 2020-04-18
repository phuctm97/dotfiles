#!/bin/bash

readonly DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

. $DIR/enable-sudo-auth-touch-id.sh

. $DIR/install-homebrew.sh

. $DIR/fix-zsh-permissions.sh

. $DIR/install-antigen.sh

. $DIR/install-fonts.sh

. $DIR/create-syslinks.sh
