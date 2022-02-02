# --------------------------------------------------
# ENVIRONMENT VARIABLES
# --------------------------------------------------

# Locales
export LC_ALL="en_US.UTF-8"       # Prefer US English
export LANG="en_US"               # Use UTF-8

# Folders
export DEV="$HOME/dev"
export CONFIG="$HOME/.config"

# --------------------------------------------------
# PROMPT MANIFICATION
# --------------------------------------------------

# Reorders and Colors the PS1 variable (prompt)

# RESET="\033[0m"
# WHITE="\033[38;5;15m"
# VIOLET="\033[38;5;5m"
# RED="\033[38;5;1m"
# YELLOW="\033[38;5;11m"

# PS1="\[${RESET}\]"
# PS1+="\[${VIOLET}\]\u"          # Username
# PS1+="\[${WHITE}\] @ "
# PS1+="\[${RED}\]\h"             # Hostname
# PS1+="\[${WHITE}\] : "
# PS1+="\[${YELLOW}\]\w"          # Directory
# PS1+="\[${WHITE}\] \\$ "        # Permission $/#
# PS1+="\[${RESET}\]"

# F{5} = purple
# F{15} = white
# F{1} = red
# F{11} = yellow

# %n = username
# %m = hostname
# %~ = directory
# %# = permission
PS1="%F{5}%n%f %F{15}@%f %F{1}%m%f %F{5}in%f %F{11}%~%f %F{15}%#%f "

export PS1

# unset RESET
# unset BOLD
# unset TRANSPARENT
# unset VIOLET
# unset RED
# unset YELLOW

# --------------------------------------------------
# SOURCE ZSH CONFIG FILES
# --------------------------------------------------

setopt SHARE_HISTORY            # share history across multiple zsh sessions
setopt APPEND_HISTORY           # append to history
setopt INC_APPEND_HISTORY       # adds commands as they are typed, not at shell exist
setopt HIST_EXPIRE_DUPS_FIRST   # expire duplicates first
setopt HIST_IGNORE_DUPS         # do not store duplications
setopt HIST_FIND_NO_DUPS        # ignore duplicates when searching
setopt HIST_REDUCE_BLANKS       # removes blank lines from history

# Source files
FILES=(
  "zsh_aliases"
  "zsh_functions"
)

for FILE in ${FILES[@]}; do
	[ -r "${HOME}/.${FILE}" ] && [ -f "${HOME}/.${FILE}" ] && source "${HOME}/.${FILE}";
done;

unset FILE

# --------------------------------------------------
# SOURCE THIRD-PARTY SCRIPTS
# --------------------------------------------------

# Source NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# # Source Autoenv
# export AUTOENV_ENV_FILENAME=".autoenv"
# source "$(brew --prefix autoenv)/activate.sh"

# --------------------------------------------------
# SOURCE ENV CREDENTIALS
# --------------------------------------------------

CREDENTIALS="env"
[ -r "${HOME}/.${CREDENTIALS}" ] && [ -f "${HOME}/.${CREDENTIALS}" ] && source "${HOME}/.${CREDENTIALS}";

unset FILE
