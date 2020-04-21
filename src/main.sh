#!/bin/bash

declare -r SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
declare -r CFG="$(cd "$(dirname "$SRC")/cfg" >/dev/null 2>&1 && pwd)"

main() {
  . $SRC/enable-sudo-auth-touch-id.sh

  . $SRC/install-homebrew.sh

  . $SRC/fix-zsh-permissions.sh

  . $SRC/install-antigen.sh

  . $SRC/install-fonts.sh

  . $SRC/install-tools.sh

  . $SRC/create-syslinks.sh
}

main "$@"
