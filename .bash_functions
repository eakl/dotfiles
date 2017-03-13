#!/usr/bin/env bash

##### Makes new dir and jumps inside

# mkdir & cd
mkcd() {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name";
  elif [ -d "$1" ]; then
    echo "'$1' already exists";
  else
    mkdir -pv "$1" && cd "$1";
  fi;
}

##### Search

ff() { find . -type f -iname "*$1*"; }      # Find file
fd() { find . -type d -iname "*$1*"; }      # Find directory

##### File

# Extracts an archive
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)  tar -jxvf "$1"                      ;;
      *.tar.gz)   tar -zxvf "$1"                      ;;
      *.bz2)      bunzip2 "$1"                        ;;
      *.dmg)      hdiutil mount "$1"                  ;;
      *.gz)       gunzip "$1"                         ;;
      *.tar)      tar -xvf "$1"                       ;;
      *.tbz2)     tar -jxvf "$1"                      ;;
      *.tgz)      tar -zxvf "$1"                      ;;
      *.zip)      unzip "$1"                          ;;
      *.ZIP)      unzip "$1"                          ;;
      *.pax)      cat "$1" | pax -r                   ;;
      *.pax.Z)    uncompress "$1" --stdout | pax -r   ;;
      *.Z)        uncompress "$1"                     ;;
      *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file to extract"
  fi
}

##### Git

# Git add
ga() {
  if [ "$#" -eq 0 ]; then
    git add .;
  else
    git add "$@";
  fi;
}

# Git commit
gc() {
  if [ "$#" -eq 0 ]; then
    echo "You should add a 'message'";
  else
    git commit -m "$1";
  fi;
}

##### Conda

# Create conda environement
condac() {
  if [ "$#" -eq 0 ]; then
    echo "You should specify an environment";
  else
    conda create --name "$1" python=3;
  fi;
}

use() {
  source activate "$( basename "$PWD" )" || echo "No environment found.";
}

# Remove conda environement
condar() {
  if [ "$#" -eq 0 ]; then
    echo "You should specify an environment";
  else
    conda remove --name "$1" --all;
  fi;
}

# Install conda package
condai() {
  if [ "$#" -eq 0 ]; then
    echo "You should specify a package";
  else
    echo "Installing packages...";
    if conda install "$@"; then
      conda-env-export;
    else
      echo "Error installing packages.";
    fi;
  fi;
}

# Update conda package
condau() {
  if [ "$#" -eq 0 ]; then
    echo "You should specify a package";
  else
    echo "Updating packages...";
    if conda update "$@"; then
      conda-env-export;
    else
      echo "Error updating packages.";
    fi;
  fi;
}

# Create .autoenv file
autoenv-create() {
  local FOLDER_NAME="$( basename "$PWD" )"
  local AUTOENV=".autoenv"

  if [ -f "$AUTOENV" ] && [[ "$( cat "$AUTOENV" )" =~ ^"source activate $FOLDER_NAME"$ ]]; then
    echo "$AUTOENV already exists";
    return 1;
  else
    printf "source activate ${FOLDER_NAME}" > "$AUTOENV";
    echo "$AUTOENV created for ${FOLDER_NAME}";
  fi;
}

# Create conda environment.yml file based on directory name and python version
conda-env-create() {
  local FOLDER_NAME="$( basename "$PWD" )"
  local CONDA_ENV="environment.yml"
  local PY_VERSION=""

  # Define Python version
  if [ "$#" -gt 1 ]; then
    echo "Only one (optional) argument is accepted (python version number)";
    return 1;
  elif [ "$#" -eq 1 ] && [[ "$1" =~ ^([[:digit:]]+\.)*([[:digit:]]+)$ ]]; then
    PY_VERSION="=$1"
  fi;

  # Create environment file
  printf "name: ${FOLDER_NAME}\ndependencies:\n- python${PY_VERSION}\n- pip\n" > "$CONDA_ENV";
  echo "$CONDA_ENV created. Use conda-env-install to install";
}

# Install conda environment based on environment.yml file and optional pip dependencies
conda-env-install() {
  local FOLDER_NAME="$( basename "$PWD" )"
  local CONDA_ENV="environment.yml"
  local PIP_DEPS="requirements.txt"
  local AUTOENV=".autoenv"

  # Install conda environment
  if [ ! -f "$CONDA_ENV" ]; then
    echo "${CONDA_ENV} is missing. Use conda-env-create first";
    return 1;
  else
    echo "Installing environment from ${CONDA_ENV}...";
    conda env create -f "$CONDA_ENV" || { echo "Failed to install environment"; return 1; }
  fi;

  # Activate environment
  echo "Activating $FOLDER_NAME environment...";
  source activate "$FOLDER_NAME"

  # Install pip dependencies
  if [ ! -f "$PIP_DEPS" ]; then
    echo "$PIP_DEPS not found. No pip dependencies to install";
  else
    echo "Installing pip dependencies from ${PIP_DEPS}...";
    pip install -r "$PIP_DEPS" || { echo "Failed to install pip dependencies"; return 1; }
  fi;

  # Create .autoenv file
  autoenv-create
}

conda-env-export() {
  local CONDA_ENV="environment.yml"
  local PIP_DEPS="requirements.txt"

  read -p "Export environment to ${CONDA_ENV}? (y/n [n]) ";

	if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Backup old environment
    if command mv "$CONDA_ENV" "${CONDA_ENV}.bak"; then
      echo "Backup: ${CONDA_ENV} -> ${CONDA_ENV}.bak";

      # Export conda environment
      if conda env export | sed -E 's|^(prefix:) .*|\1 /path/to/my-env|' > "$CONDA_ENV"; then
        echo "Environment exported";
      else
        echo "Failed to export environment";
      fi;

      # Export pip dependencies
      if conda list | awk 'BEGIN { FS=" "; OFS="=" } $1 !~ /^#/ && $4 !~ /./ { print $1,$2 }' > "$PIP_DEPS"; then
        echo "pip dependencies exported";
      else
        echo "Failed to export pip dependencies";
      fi;

    else
      echo "Failed to backup ${CONDA_ENV}. Export aborted";
    fi;
  fi;
}
