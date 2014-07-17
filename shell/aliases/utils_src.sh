# MAC ONLY
# Copy a file passed as the first parameter to the clipboard
catcopy() {
    cat $1 | pbcopy
}
alias catcopy=catcopy

# Add a new vhost to your vhost file with parameter one as the filename and as servername.
addvhost() {
echo -e "# $1
<VirtualHost *:80>
    DocumentRoot "/Users/gabesullice/development/docroot/$1/site"
    ServerName $1.local
    ServerAlias www.$1.local
    <Directory /Users/gabesullice/development/docroot/$1/site/>
        Options Indexes FollowSymlinks
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>
</VirtualHost>\n" >> /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf
}
alias addvhost=addvhost
