#!/usr/bin/env bash

ESLINT_DIR="${DOTFILES_DIR}/eslint"

if cd "$ESLINT_DIR" && chmod a+x eslint-bootstrap; then
  success "CHMOD +x applied to 'eslint-bootstrap'"
else
  echo "CHMOD +x has not been applied to 'eslint-bootstrap'";
fi;
