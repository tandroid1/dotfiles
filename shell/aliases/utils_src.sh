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

   if [ -d $basepath$e3 ] ; then
     cd "$basepath$e3"
   elif [ -d $basepath$e5 ] ; then
     cd "$basepath$e5"
   else
     echo "Could not find a zen subtheme."
   fi
}

alias cdt="_theme_root"

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
