# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Autocompletes folder names in development docroot. Set development_root accoridngly.
goto() {
  cd $DOCROOT/$1
	if [[ -a site ]]; then
		cd site
	elif [[ -a docroot ]]; then
		cd docroot
	fi
}

_goto() {
	local cur opts
	cur="${COMP_WORDS[COMP_CWORD]}"
	opts=$(cd ~/development/docroot; ls -d */. | sed 's|/./||')
	COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
}
complete -F _goto goto

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
