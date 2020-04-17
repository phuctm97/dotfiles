#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

. enable-sudo-auth-touch-id.sh

. install-xcode-command-line-tools.sh

. install-homebrew.sh

. fix-zsh-permissions.sh

. install-antigen.sh

. install-fonts.sh

. create-syslinks.sh

