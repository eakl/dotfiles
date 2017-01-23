FILES=("bash_path"
  "bash_prompt"
  "bash_env"
  "env"
  "bash_aliases"
  "bash_functions"
)

for FILE in ${FILES[@]}; do
	[ -r "${HOME}/.${FILE}" ] && [ -f "${HOME}/.${FILE}" ] && . "${HOME}/.${FILE}";
done;

# Source files Autoenv
export AUTOENV_ENV_FILENAME=".autoenv"
source "$(brew --prefix autoenv)/activate.sh"

unset FILE
unset AUTOENV_ENV_FILENAME
