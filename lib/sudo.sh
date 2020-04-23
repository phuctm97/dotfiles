#!/bin/bash

enable_sudo_auth_tid() {
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
