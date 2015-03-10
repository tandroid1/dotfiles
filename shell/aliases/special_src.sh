# These aliases not directly related to the shell, like git, vim, compass etc.

# Git aliases. Note: git command aliases should go in your .gitconfig file.
alias g="git"

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

# Start screensaver
alias ss='date && open -a /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app'

# Edit Hosts file
alias subl_hosts="subl /etc/hosts"

# Edit Drush local aliases file
alias subl_sa="subl ~/.drush/local.aliases.drushrc.php"

# Internet
alias gcal='open https://www.google.com/calendar/'

# Drush
alias ds='drush status'
alias drcc='drush cache-clear all'
alias drdu='drush sql-dump --ordered-dump --result-file=~/tmp/sql-dumps/dump.sql'
alias drdrop='drush sql-dump --ordered-dump --result-file=~/tmp/sql-dumps/dump.sql && drush sql-drop --yes'
alias dren='drush pm-enable'
alias drdis='drush pm-disable'
alias drsp='cp sites/default/default.settings.php sites/default/settings.php'
alias dr='drush'
alias sqlsync='drush sql-sync --no-cache'
alias drsync='drush rsync -rv'

alias js_on="drush vset preprocess_js 1 --yes"
alias js_off="drush vset preprocess_js 0 --yes"
alias css_on="drush vset preprocess_css 1 --yes"
alias css_off="drush vset preprocess_css 0 --yes"
alias agg_off="js_off && css_off"
alias agg_on="js_on && css_on"
alias clear_theme="drush cc css+js"

# MAC only
alias dnsmasq_restart="sudo launchctl stop homebrew.mxcl.dnsmasq && sudo launchctl start homebrew.mxcl.dnsmasq"
