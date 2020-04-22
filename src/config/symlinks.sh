#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . ../lib/include.sh

set_heading "Create Syslinks"

create_symlink ../../cfg/.antigenrc ~
