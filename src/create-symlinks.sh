#!/bin/bash

main() {
  # Create symlinks.
  ln -sfn $CFG/.zshrc ~
  ln -sfn $CFG/.antigenrc ~
  ln -sfn $CFG/.gitconfig ~
}

main "$@"
