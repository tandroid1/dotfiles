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

# Note: this must be configured to your development docroot
# Add a new vhost to your vhost file with parameter one as the filename and as servername.
addvhost() {
  echo -e "# $1
  <VirtualHost *:80>
      DocumentRoot "$DOCROOT/$1/site"
      ServerName $1.local
      ServerAlias www.$1.local
      <Directory $DOCROOT/$1/site/>
          Options Indexes FollowSymlinks
          AllowOverride All
          Order allow,deny
          Allow from all
      </Directory>
  </VirtualHost>\n" >> /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf
}
alias addvhost=addvhost

# cgrep performs a normal grep, but cuts the output to 120 chars
_cgrep () {
  grep $@ | cut -c1-120
}

alias cgrep="_cgrep"
