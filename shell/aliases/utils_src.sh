# MAC ONLY
# Copy a file passed as the first parameter to the clipboard
catcopy() {
    cat $1 | pbcopy
}
alias catcopy=catcopy

# Note: this must be configured to your development docroot
# Add a new vhost to your vhost file with parameter one as the filename and as servername.
addvhost() {
  echo -e "# $1 
<VirtualHost *:80>
    DocumentRoot "$DOCROOT/$1/site"
    ServerName $2
    ServerAlias www.$2
    <Directory $DOCROOT/$1/site/>
        Options Indexes FollowSymlinks
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>
</VirtualHost>\n" >> /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf
}
alias addvhost=addvhost

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

# $1 = sitename
# $2 = site.local
# $3 = aliasname
setupsite() {
  addhost $2
  addvhost $1 $2
  addsa $3 $2 $1
}

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
