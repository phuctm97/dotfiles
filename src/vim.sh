#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

set_heading "Install Vim"

symlink ../cfg/.vimrc ~
vim +"PlugInstall --sync" +qa
