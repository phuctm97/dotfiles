#!/bin/bash

readonly START_CHAR=">"
readonly SUCCESS_CHAR="✔"
readonly ERROR_CHAR="✖"

print_heading_color() {
  local -ir width=${#1}+2
  printf "%b" "$(tput bold 2> /dev/null)" "$(tput setaf "$2" 2> /dev/null)"
  printf "┌"
  printf "%${width}s" | tr " " "─"
  printf "┐\n"
  printf "%b" "│ " "$1" " │\n"
  printf "└"
  printf "%${width}s" | tr " " "─"
  printf "┘"
  printf "%b" "$(tput sgr0 2> /dev/null)" "\n"
}

print_heading_purple() {
  print_heading_color "$1" 5
}

print_heading_green() {
  print_heading_color "$1" 2
}

print_heading_red() {
  print_heading_color "$1" 1
}

print_heading_yellow() {
  print_heading_color "$1" 3
}

print_result() {
  if [ "$1" == 0 ]; then
    print_heading_green "$SUCCESS_CHAR $2"
  else
    print_heading_red "$ERROR_CHAR $2"
  fi
}

cmd_exists() {
  command -v "$1" &> /dev/null
}

set_heading() {
  HEADING="$1"
  print_heading_purple "$START_CHAR $HEADING"
}

quit() {
  exit_code="$?"
  if [ -n "${HEADING+x}" ]; then
    print_result "$exit_code" "$HEADING"
  fi

  exit "$exit_code"
}

trap quit EXIT
