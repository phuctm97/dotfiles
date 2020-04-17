#!/bin/bash

# Install XCode Command Line Tools.
xcode-select --install &> /dev/null

# Wait until XCode Command Line Tools installation finished.
until $(xcode-select --print-path &> /dev/null); do
  sleep 5;
done

