[[ $- != *i* ]] && return

# prompt

PS1='[ \u@\h ] [ \W/ ] $ '

# aliases
alias doas="doas "
alias vi="nvim"

# other

function cd() {
	if [[ $1 == "-b" ]]; then
		if [[ $2 != "" && -z $3 ]]; then
			LOCATION=$(cat ~/.config/cdbookmarks | grep -w "$2" | sed 's/[^/]* //')
			if [[ ! -z $LOCATION ]]; then
			command cd "$LOCATION"
		fi
        fi
	elif [[ $1 == "-bc" ]]; then
		if [[ $2 != "" && $3 != "" && -z $4 ]]; then
			echo $2 $3 >> ~/.config/cdbookmarks
		fi
	else
		command cd "$@"
	fi
}
