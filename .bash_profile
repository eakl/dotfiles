# --------------------------------------------------
# BASH ENVIRONMENT VARIABLES
# --------------------------------------------------

# Locales
export LC_ALL="en_US.UTF-8"       # Prefer US English
export LANG="en_US"               # Use UTF-8

# Folders
export DEV="$HOME/dev"
export CONFIG="$HOME/.config"

# added by Miniconda3 4.3.11 installer
export PATH="$HOME/miniconda3/bin:$PATH"

# --------------------------------------------------
# PROMPT MANIFICATION
# --------------------------------------------------

# Reorders and Colors the PS1 variable (prompt)

RESET="\033[0m"
WHITE="\033[38;5;15m"
VIOLET="\033[38;5;5m"
RED="\033[38;5;1m"
YELLOW="\033[38;5;11m"

PS1="\[${RESET}\]"
PS1+="\[${VIOLET}\]\u" # Username
PS1+="\[${WHITE}\] @ "
PS1+="\[${RED}\]\h" # Hostname
PS1+="\[${WHITE}\] : "
PS1+="\[${YELLOW}\]\w" # Directory
PS1+="\[${WHITE}\] \\$ " # Permission $/#
PS1+="\[${RESET}\]"

export PS1

unset RESET
unset BOLD
unset TRANSPARENT
unset VIOLET
unset RED
unset YELLOW

# --------------------------------------------------
# SOURCE EXTRA FILES
# --------------------------------------------------

# Source files
FILES=(
  "bash_aliases"
  "bash_functions"
)

for FILE in ${FILES[@]}; do
	[ -r "${HOME}/.${FILE}" ] && [ -f "${HOME}/.${FILE}" ] && source "${HOME}/.${FILE}";
done;

unset FILE

# Source Autoenv
export AUTOENV_ENV_FILENAME=".autoenv"
source "$(brew --prefix autoenv)/activate.sh"

# --------------------------------------------------
# SOURCE CREDENTIALS
# --------------------------------------------------

CREDENTIALS="env"

[ -r "${HOME}/.${CREDENTIALS}" ] && [ -f "${HOME}/.${CREDENTIALS}" ] && source "${HOME}/.${CREDENTIALS}";

unset FILE
