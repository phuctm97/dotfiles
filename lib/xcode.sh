#!/bin/bash

are_xcode_command_line_tools_installed() {
  xcode-select --print-path &> /dev/null
}

install_xcode_command_line_tools() {
  if are_xcode_command_line_tools_installed; then
    return
  fi

  xcode-select --install &> /dev/null
  until are_xcode_command_line_tools_installed; do
    sleep 5;
  done
}
