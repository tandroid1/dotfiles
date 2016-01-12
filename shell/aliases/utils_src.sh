# mkcd makes a dir and immediately cd's into it
_mkcd() {
  mkdir $1
  cd $1
}
alias mkcd=_mkcd

# MAC ONLY
# Copy a file passed as the first parameter to the clipboard
catcopy() {
    cat $1 | pbcopy
}
alias catcopy=catcopy

addhost() {
  sudo -- sh -c "echo  \ \ >> /etc/hosts" # print line above entry.
  sudo -- sh -c "echo 127.0.0.1   $1 www.$1 >> /etc/hosts"
}
alias addhost=addhost

addsa() {
  echo -e "\$aliases['$1'] = array(
  'parent' => '@local.defaults',
  'uri' => 'http://"$2"',
  'root' => '"$DOCROOT/$3/site"'
);" >> $DRUSHSA
}
alias addsa=addsa

_sql-slurp () {
  printf "This will overwrite the $2 database with the $1 database.\n"
  printf "\n\t\t*** $1 -> $2 ***\n\n"
  sleep 3s
  read -p "Are you sure [Y/n]? " -n 1 -r
  if [[ $REPLY  =~ ^[Yy]$ ]]; then
    drush $2 sql-drop -y
    printf "\n"
    drush $1 sql-dump | pv -br | drush $2 sql-cli -A
  fi
  printf "\n"
}

alias sql-slurp="_sql-slurp"

# git commit shortcut
_gcm () {
  if [ -z "$1" ]; then
    git commit
  else
    git commit -m "$1"
  fi
}

alias gcm="_gcm"

_drupal_root() {
  # Go up until we find index.php
  current_dir=`pwd`;
  while [ ${current_dir} != "/" -a -d "${current_dir}" -a \
          ! -f "${current_dir}/index.php" ] ; 
  do
    current_dir=$(dirname "${current_dir}") ;
  done
  if [ "$current_dir" == "/" ] ; then
    exit 1 ;
  else
    cd "$current_dir" ;
  fi 
}

alias cdd="_drupal_root"

_theme_root() {
   _drupal_root
   basepath="sites/all/themes/"
   e3="e3_zen"
   e5="e5_zen"
   tk="themekit"

   if [ -d $basepath$e3 ] ; then
     cd "$basepath$e3"
   elif [ -d $basepath$e5 ] ; then
     cd "$basepath$e5"
   elif [ -d $basepath$tk ] ; then
     cd "$basepath$tk"
   else
     echo "Could not find any predefined themes."
   fi
}

alias cdt="_theme_root"

_vlad_root() {
   _drupal_root
   cd "../vlad"
}

alias cdv="_vlad_root"

# cgrep performs a normal grep, but cuts the output to 120 chars
function _cgrep () {
  grep "$@" | cut -c1-120
}

alias cgrep="_cgrep"

# Clear specific drupal cache table with drush
# $1 - Cache table or "theme" for css-js.
# $2 - Environment drush alias. Ex: @mysite.dev
_drcc() {
  # alias "css-js" to "theme" because I can never remember which comes first.
  if [ "$1" == "theme" ] ; then
    table="css-js"
  else
    table=$1
  fi

  if [ -z "$2" ]; then
    # Redirect the output to /dev/null so we can do a custom message.
    drush cc "$table" &> /dev/null 
    echo "Cleared $table cache on the current environment."
  else
    # Redirect the output to /dev/null so we can do a custom message.
    drush "$2" cc "$table" &> /dev/null
    echo "Cleared $table cache on $2." 
  fi
}

alias drcc="_drcc"

# Quick copy a file from the templates directory.
_cpt() {
  if [ "$1" == "settings" ] ; then
    template="local-settings.inc"
  elif [ "$1" == "robots" ] ; then 
    template="robots_noindex.txt"
  else
    echo "Cound not find any templates named \"$1\"."
  fi

  if [ -z "$2" ] ; then
    destination="./"
  else
    destination="$2"
  fi

  cp ~/templates/"$template" "$destination"
  vim "$destination"/"$template"

}

alias cpt="_cpt"

# _dragg() {
#   set -e
# 
#   env=""
#   if [[ $1 == @* ]] ; then
#     env=$1
#     prestate=$2
#   else
#     env=$1
#   fi
# 
#   if [ $prestate == "on" ] || [ $prestate == "1" ] ; then
#     state=1
#   elif [ $prestate == "off" ] || [ $prestate == "0" ] ; then
#     state=0
#   else 
#     echo "Invalid value."; exit 1
#   fi
# 
#   preprocess_js="drush $env vset preprocess_js $state --yes"
#   preprocess_css="drush $env vset preprocess_css $state --yes"
# }

_mysql_use_brew() {
 brew services stop mysql
 brew unlink mysql
 mv /usr/local/bin/mysql /usr/local/bin/xmysql
 brew link mysql
 brew services start mysql
 echo "Using homebrew mysql. Use 'bundle exec script/server' to start server."
}

alias mysql_use_brew="_mysql_use_brew"

_mysql_use_mamp() {
   brew services stop mysql
   brew unlink mysql
   mv /usr/local/bin/xmysql /usr/local/bin/mysql
   echo "Using MAMP mysql. Remember to start servers."
}
alias mysql_use_mamp="_mysql_use_mamp"

_switch_drush() {
  composer global require drush/drush:"$1"
}

alias switch_drush="_switch_drush"

_sql_self() {
 drush sql-sync "$1" @self
}
alias sql-self="_sql_self"

_rsync_self() {
   drush rsync -rv "$1" :%files
}
alias rsync-self="_rsync_self"
