#cd aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Shortcuts
alias sites="cd ~/Sites"

# Show Directory tree
alias tree="tree -C --dirsfirst --filelimit 50"
alias 2tree="tree -CL 2 --dirsfirst --filelimit 50"
alias 3tree="tree -CL 3 --dirsfirst --filelimit 50"
alias 4tree="tree -CL 4 --dirsfirst --filelimit 50"

# Fucking sudo
alias fucking="sudo"

# prints the full path to a file, like pwd, for files
function _pwf () {
dir=$(echo $(cd $(dirname "$1"); pwd))
base=$(echo $(basename "$1"))
echo "$dir/$base"
}
alias pwf=_pwf
