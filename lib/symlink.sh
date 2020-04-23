#!/bin/bash

symlink() {
  local -r target_abs_path="$(cd "$(dirname "$1")" >/dev/null 2>&1 && pwd)/$(basename "$1")"
  ln -sfn "$target_abs_path" "$2"
}
