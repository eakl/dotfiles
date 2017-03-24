#!/usr/bin/env bash

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap homebrew/versions
brew tap homebrew/python
brew tap homebrew/science
brew update
brew upgrade

# Install Packages
apps=(
  openssl
  wget
  git
  node
  node@6
  yarn
  mysql
  mongodb
  rmtrash
  python3
  autoenv
  awscli
  tmux
)

brew install "${apps[@]}"
echo "${WHITE}You may need to manually setup some packages${RESET}"
echo "${WHITE}  - autoenv (https://github.com/kennethreitz/autoenv)${RESET}"
