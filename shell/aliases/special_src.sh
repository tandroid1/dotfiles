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

# Capistrano
alias cdd="cap develop deploy"

# Edit Hosts file
alias subl_hosts="subl /etc/hosts"

# Edit MAMP vHosts File
alias subl_vhosts="subl /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf"

# Edit Drush local aliases file
alias subl_sa="subl ~/.drush/local.aliases.drushrc.php"

# Open hosts, vhosts, and drush alias files.
alias subl_start="subl_hosts && subl_vhosts && subl_sa"

# Restart MAMP
alias mamp_restart="/Applications/MAMP/bin/apache2/bin/apachectl restart"

# Internet
alias gcal='open https://www.google.com/calendar/'

# Drush
alias drush='~/drupal/drush/drush'
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