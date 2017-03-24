#!/usr/bin/env bash

MONGO_DIR="${CONFIG}/mongodb"
MONGO_FILE='mongod.conf'

info "This will create a symlink for $MONGO_FILE in ${MONGO_DIR}/";
user "Are you sure? (y/n [n]) ";
read
if [[ $REPLY =~ ^[Yy]$ ]]; then
  [ ! -d "$MONGO_DIR" ] && mkdir -p "$MONGO_DIR";

  if ln -sfv "/usr/local/etc/${MONGO_FILE}" "${MONGO_DIR}/${MONGO_FILE}"; then
    success "'$MONGO_FILE' symlink has been created in '$MONGO_DIR'";
  else
    fail "'$MONGO_FILE' symlink has not been created";
  fi;
fi;
