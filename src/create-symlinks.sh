#!/bin/bash

create_symlinks() {
  local -r cwd="$(pwd)"

  ln -sfn "$cwd/cfg/.zshrc" ~
  ln -sfn "$cwd/cfg/.antigenrc" ~
  ln -sfn "$cwd/cfg/.gitconfig" ~
}

execute "create_symlinks" "Create symlinks"
