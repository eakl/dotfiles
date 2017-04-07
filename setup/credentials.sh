#!/usr/bin/env bash

CREDENTIALS_DIR="${DOTFILES_DIR}/credentials"

google() {
  # Google
  local GOOGLE_CONFIG_DIR="$CONFIG/google"
  local GOOGLE_FILE="google-api-credentials.json"

  info "This will copy '${GOOGLE_FILE}' to '${GOOGLE_CONFIG_DIR}/'";
  user "Are you sure? (y/n [n]) ";
  read;
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    if rsync \
    --include="google*" \
    --exclude="*" \
    -avh --chmod=u=rwX,go= "${CREDENTIALS_DIR}/" "${GOOGLE_CONFIG_DIR}/"; then
      success "'${GOOGLE_FILE}' has been copied and CHMODed successfully";
    else
      fail "'${GOOGLE_FILE}' has not been copied";
    fi;
  fi;
}

aws() {
  # AWS
  local AWS_CONFIG_DIR="$CONFIG/aws"
  local AWS_CONFIG_FILE="aws-config"
  local AWS_CREDENTIALS_FILE="aws-credentials"

  info "This will copy '${AWS_CONFIG_FILE}' and '${AWS_CREDENTIALS_FILE}' to '${AWS_CONFIG_DIR}/'";
  user "Are you sure? (y/n [n]) ";
  read;
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    if rsync \
    --include="aws*" \
    --exclude="*" \
    -avh --chmod=u=rwX,go= "${CREDENTIALS_DIR}/" "${AWS_CONFIG_DIR}/"; then
      success "AWS credentials have been copied and CHMODed successfully";
    else
      fail "AWS credentials have not been copied";
    fi;
  fi;
}

user "Available credentials setup:\n"
echo -e "        ${WHITE} google ${RESET}"
echo -e "        ${WHITE} aws ${RESET}"
echo
echo -n "Apply: "
read CRED;
echo

case $CRED in
  google)
    google;
    ;;
  aws)
    aws;
    ;;
  *)
    fail "'$CRED' is not a known credential script";
    ;;
esac;
