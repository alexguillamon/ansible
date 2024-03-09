#!/usr/bin/env bash

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make sure we’re using the latest Homebrew
brew update

# Install Ansible
brew install ansible

# Optionally, pull your ansible configurations. Uncomment the next line to enable it.
# ansible-pull -U https://github.com/alexguillamon/ansible.git
