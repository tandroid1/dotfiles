#cd aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Fucking sudo
alias fucking="sudo"

# prints the full path to a file, like pwd, for files
function _pwf () {
dir=$(echo $(cd $(dirname "$1"); pwd))
base=$(echo $(basename "$1"))
echo "$dir/$base"
}
alias pwf=_pwf
