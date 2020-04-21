#!/bin/bash

declare -r SUCCESS_CHAR="✔"
declare -r WARNING_CHAR="!"
declare -r ERROR_CHAR="✖"
declare -r SPINNER_CHARS="/-\|"
declare -r SPINNER_DELAY=0.2
declare -r TMP_DIR="$(mktemp -d)"

print_in_color() {
  printf "%b" "$(tput setaf "$2" 2> /dev/null)" "$1" "$(tput sgr0 2> /dev/null)"
}

print_in_green() {
  print_in_color "$1" 2
}

print_in_purple() {
  print_in_color "$1" 5
}

print_in_red() {
  print_in_color "$1" 1
}

print_in_yellow() {
  print_in_color "$1" 3
}

print_success() {
  print_in_green "[$SUCCESS_CHAR] $1\n"
}

print_warning() {
  print_in_yellow "[$WARNING_CHAR] $1\n"
}

print_error() {
  print_in_red "[$ERROR_CHAR] $1\n"
}

print_result() {
  if [ "$1" -eq 0 ]; then
    print_success "$2"
  else
    print_error "$2"
  fi

  return "$1"
}

print_error_stream() {
  while read -r line; do
    print_in_red " ↳ $line\n"
  done
}

cmd_exists() {
  command -v "$1" &> /dev/null
}

show_spinner() {
  local -r frames=$SPINNER_CHARS
  local -r n_frames=${#frames}
  local -r cmds="$2"
  local -r msg="$3"
  local -r pid="$1"

  local i=0
  local frame=""

  # Provide more space so that the text hopefully doesn't reach the bottom line of the terminal
  # window. This is a workaround for escape sequences not tracking the buffer position (accounting
  # for scrolling).
  # See also: https://unix.stackexchange.com/a/278888.
  printf "\n\n\n"
  tput cuu 3
  tput sc

  # Display spinner while the commands are being executed.
  while kill -0 "$pid" &> /dev/null; do
    # Print frame.
    frame="[${frames:i++%n_frames:1}] $msg"
    printf "%s" "$frame"
    sleep $SPINNER_DELAY

    # Clear frame.
    tput rc
  done
}

execute() {
  local -r cmds="$1"
  local -r msg="${2:-$1}"
  local -r tmp_file="$(mktemp "$TMP_DIR/XXXXXX")"
  local exit_code=0
  local cmds_pid=""

  # Execute commands in background.
  eval "$cmds" \
    &> /dev/null \
    2> "$tmp_file" &
  cmds_pid=$!

  # Show a spinner if the commands require more time to complete.
  show_spinner "$cmds_pid" "$cmds" "$msg"

  # Wait for the commands to no longer be executing in the background, and then get their exit
  # code.
  wait "$cmds_pid" &> /dev/null
  exit_code=$?

  # Print output based on what happened.
  print_result $exit_code "$msg"

  if [ $exit_code -ne 0 ]; then
    print_error_stream < "$tmp_file"
  fi

  # Clean up.
  rm "$tmp_file"
  return $exit_code
}

kill_all_subprocesses() {
  local i=""
  for i in $(jobs -p); do
    kill "$i"
    wait "$i" &> /dev/null
  done
}

cleanup() {
  kill_all_subprocesses
  rm -rf "$TMP_DIR"
}

trap cleanup EXIT
