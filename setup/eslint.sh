#!/usr/bin/env bash

ESLINT_DIR="${DOTFILES_DIR}/eslint"

if chmod u+x "${ESLINT_DIR}/eslint-bootstrap"; then
  success "CHMOD a+x applied to 'eslint-bootstrap'"
else
  echo "CHMOD a+x has not been applied to 'eslint-bootstrap'";
fi;
