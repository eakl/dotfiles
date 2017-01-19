#!/usr/bin/env bash

# Add security

alias sudo="sudo "				# sudo: 	Take into account aliases with 'sudo'
alias del="rmtrash"				# del: 		DO NOT USE 'rm' | 'del' is safer
alias trash="rmtrash"				# trash:	DO NOT USE 'rm' | 'trash' is safer

# Quick typing

alias cd..="cd ../"				# Go back 1 directory level
alias atom.="atom ."				# Opens current directory in Atom editor

# Directory

alias home="cd ~"					                    # Go Home
alias dev="cd $DEV"                           # Got to the dev folder

alias ..="cd ../"				                      # Go back 1 directory level
alias ...="cd ../../"				                  # Go back 2 directory level
alias ....="cd ../../../"			                # Go back 3 directory level
alias -- -="cd -"                             # Go to previous dir with -

alias ll="ls -AFGlhp"				                  # Preferred 'ls' implementation
alias mkdir="mkdir -p"				                # Preferred 'mkdir' implementation

# File

alias cp="cp -iv"				                      # Preferred 'cp' implementation
alias mv="mv -iv"				                      # Preferred 'mv' implementation
alias colcat='pygmentize -g'                  # Syntax highlighting for cat
# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -exec /bin/rm {} \;"

# Console

alias c="clear"					                      # Clear Terminal display

# Application

alias f="open -a Finder ./"			              # Opens current directory in MacOS Finder
alias a="atom ."				                      # Opens current directory in Atom editor
alias ipy='ipython notebook --port=9999'      # Launch IPython Notebook

# Git

alias gs="git status"
alias gl='git log --oneline'
alias gp='git push'

# Conda

alias condal='conda list'
alias condael='conda env list'
alias duse='source deactivate'

# Script

# ------- Script

alias linty="$DEV/dotfiles/eslint/eslint-bootstrap"

# # Empty the Trash on all mounted volumes and the main HDD.
# # Also, clear Apple’s System Logs to improve shell startup speed.
# # Finally, clear download history from quarantine. https://mths.be/bum
# alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"
