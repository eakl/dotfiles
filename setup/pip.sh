#!/usr/bin/env bash

PIP_DIR="${HOME}/.pip"
PIP_FILE="pip.conf"

info "This will create a configuration file (${PIP_FILE}) in ${PIP_DIR}/";
user "Are you sure? (y/n [n]) ";
read;
if [[ $REPLY =~ ^[Yy]$ ]]; then
  [ ! -d "$PIP_DIR" ] && echo "Creating ${PIP_DIR}..." && mkdir -p "$PIP_DIR";

  if [ ! -f $PIP_FILE ]; then
    printf "[list]\n\tformat=columns" > "${PIP_DIR}/${PIP_FILE}";
    success "${PIP_DIR}/${PIP_FILE} created.";
  else
    fail "${PIP_DIR}/${PIP_FILE} already exists.";
  fi;
fi;
