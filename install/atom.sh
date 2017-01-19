#!/usr/bin/env bash

# Install Atom Packages
pkgs=(
  minimap
  file-icons
  linter
  linter-eslint
  language-babel
)

apm install "${pkgs[@]}"
