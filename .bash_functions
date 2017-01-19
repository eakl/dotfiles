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

# Activate conda environment
use() {
  if [ "$#" -eq 0 ]; then
    echo "You should specify an environment";
  else
    source activate "$1";
  fi;
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
    conda install "$1";
    conda-env-export;
  fi;
}

# Update conda package
condau() {
  if [ "$#" -eq 0 ]; then
    echo "You should specify a package";
  else
    echo "Updating packages...";
    conda update "$1";
    conda-env-export;
  fi;
}

# Create conda environment.yml file and autoenv activation file
# based on directory name.
conda-create-env() {
  local AUTOENV=".env"
  local CONDAENV="environment.yml"
  local FOLDERNAME=$(basename "$PWD")

  if [ ! -f "$CONDAENV" ]; then
    printf "name: ${FOLDERNAME}\ndependencies:\n- python\n- pip\n" > "$CONDAENV";
    echo "$CONDAENV created.";
  else
    echo "$CONDAENV already exists.";
  fi;

  echo "Creating conda environment...";
  [ -f "$CONDAENV" ] && conda env create;

  echo "Activating the conda environment...";
  source activate "$FOLDERNAME";

  if [ ! -f "$AUTOENV" ]; then
    printf "source activate ${FOLDERNAME}\n" > "$AUTOENV";
    echo "$AUTOENV created.";
  else
    echo "$AUTOENV already exists.";
  fi;
}

conda-env-install() {
  local AUTOENV=".env"
  local CONDAENV="environment.yml"
  local FOLDERNAME=$(basename "$PWD")

  if [ ! -f "$CONDAENV" ]; then
    echo "'$CONDAENV' is missing";
  else
    echo "Installing environment from ${CONDAENV}...";
    conda env create -f "$CONDAENV";
  fi;

  echo "Activating the conda environment...";
  source activate "$FOLDERNAME";

  if [ ! -f "$AUTOENV" ]; then
    printf "source activate ${FOLDERNAME}\n" > "$AUTOENV";
    echo "$AUTOENV created.";
  else
    echo "$AUTOENV already exists.";
  fi;
}

conda-env-export() {
  local CONDAENV="environment.yml"

  echo "Backup: ${CONDAENV} -> ${CONDAENV}.bak.";
  mv "$CONDAENV" "${CONDAENV}.bak";
  echo "Exporting environment...";
  conda env export | sed -E 's|^(prefix:) .*|\1 /path/to/my-env|' > "$CONDAENV";
}