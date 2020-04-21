#!/bin/bash

# This script enables authenticating `sudo` commands using Touch ID on macOS by adding a
# line 'auth sufficient pam_tid.so' to '/etc/pam.d/sudo'.

# This uses Python for simpler programming interface, it can be executed by macOS embedded
# Python without any requirement.

# The following Python script checks whether 'auth sufficient pam_tid.so' is already
# configured, if yes, it does nothing, if no, it finds the best place and format to append
# the line to the file.

enable_sudo_auth_touch_id() {
  sudo python <<HEREDOC
import re

pam_cfg = '/etc/pam.d/sudo'
auth_re = re.compile(r'^auth\s+sufficient\s+')
tid_re = re.compile(r'^auth\s+sufficient\s+pam_tid.so')

def main():
  with open(pam_cfg, 'r') as f:
    contents = f.readlines()

  index = -1
  template = 'auth sufficient '
  for i, line in enumerate(contents):
    if tid_re.match(line) != None:
      return
    m = auth_re.match(line)
    if m != None:
      index = i
      template = m.group(0)

  contents.insert(index + 1, template + 'pam_tid.so\n')
  with open(pam_cfg, 'w') as f:
    f.write(''.join(contents))

main()
HEREDOC
}

execute "enable_sudo_auth_touch_id" "Enable authenticating sudo with Touch ID"
