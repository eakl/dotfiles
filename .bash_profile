FILES="bash_path"
FILES+=" bash_prompt"
FILES+=" bash_env"
FILES+=" env"
FILES+=" bash_aliases"
FILES+=" bash_functions"

for FILE in ${FILES}; do
	[ -r "${HOME}/.${FILE}" ] && [ -f "${HOME}/.${FILE}" ] && . "${HOME}/.${FILE}";
done;

# Source files
source $(brew --prefix autoenv)/activate.sh

unset FILE
