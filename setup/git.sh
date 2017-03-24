#!/usr/bin/env bash

GIT_DIR="${DOTFILES_DIR}/git"

if [ ! -f "${GIT_DIR}/gitconfig_template" ]; then
  fail "No gitconfig_template file found in ${GIT_DIR}/";
elif [ -f "${DOTFILES_DIR}/.gitconfig" ]; then
  fail ".gitconfig already exists. Delete the file and retry.";
else
  echo "Setting up .gitconfig";

  GIT_CREDENTIAL="cache"

  [ "$(uname -s)" == "Darwin" ] && GIT_CREDENTIAL="osxkeychain";

  user "- GitHub author name: ";
  read GIT_AUTHORNAME;
  user "- GitHub author email: ";
  read GIT_AUTHOREMAIL;
  user "- GitHub username: ";
  read GIT_USERNAME;

  if sed -e "s/AUTHORNAME/${GIT_AUTHORNAME}/g" \
  -e "s/AUTHOREMAIL/${GIT_AUTHOREMAIL}/g" \
  -e "s/USERNAME/${GIT_USERNAME}/g" \
  -e "s/GIT_CREDENTIAL_HELPER/${GIT_CREDENTIAL}/g" \
  "${GIT_DIR}/gitconfig_template" > "${DOTFILES_DIR}/.gitconfig"; then
    success ".gitconfig has been setup";
  else
    fail ".gitconfig has not been setup";
  fi;
fi;
