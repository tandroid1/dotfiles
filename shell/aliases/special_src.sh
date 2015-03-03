# These aliases not directly related to the shell, like git, vim, compass etc.

# Git aliases. Note: git command aliases should go in your .gitconfig file.
alias g="git"

# Go related
alias gohome="cd $GOPATH/src/github.com/gabesullice"

# Aliases vim
alias v="vim"

# Creates quick alias to get to cd the dotfiles directory.
alias dotfiles="cd $HOME/.dotfiles"

# compass watch alias
alias cw="compass watch"

# Edit Hosts file
alias vim_hosts="sudo vim /etc/hosts"
# Edit vHosts File
alias vim_vhosts="vim /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf"
# Drupal alias folder
alias vim_alias="vim ~/.drush"

# MAC only
alias dnsmasq_restart="sudo launchctl stop homebrew.mxcl.dnsmasq && sudo launchctl start homebrew.mxcl.dnsmasq"
