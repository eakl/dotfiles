#!/usr/bin/env bash

# Install Atom Packages
pkgs=(
  minimap
  file-icons
  linter
  linter-eslint
  language-babel
  # linter-pylint
)

apm install "${pkgs[@]}"
