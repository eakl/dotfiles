#!/usr/bin/env bash

CREDENTIALS_DIR="${DOTFILES_DIR}/credentials"

GOOGLE_CONFIG_DIR="${CONFIG}/google"
GOOGLE_FILE="google-api-credentials.json"

if rsync \
-avh --chmod=a+rw "${CREDENTIALS_DIR}/${GOOGLE_FILE}" "${GOOGLE_CONFIG_DIR}/"; then
  success "'${GOOGLE_FILE}' has been copied and CHMOD applied successfully .";
else
  fail "'${GOOGLE_FILE}' has not been copied."
fi;
