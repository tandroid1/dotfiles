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