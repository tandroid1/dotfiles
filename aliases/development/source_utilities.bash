#Go to passed site folder   
goto() {
        cd ~/development/docroot/$1
	if [[ -a site ]]; then
		cd site
	elif [[ -a docroot ]]; then
		cd docroot
	fi
}

_goto() {
	local cur opts
	cur="${COMP_WORDS[COMP_CWORD]}"
	opts=$(cd ~/development/docroot; ls -d */. | sed 's|/./||')
	COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
}
complete -F _goto goto

# Edit Hosts file
alias vim_hosts="sudo vim /etc/hosts"
# Edit vHosts File
alias vim_vhosts="vim /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf"
# Drupal alias folder
alias vim_alias="vim ~/.drush"

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

# Copy a file passed as the first parameter to the clipboard
catcopy() {
    cat $1 | pbcopy
}
alias catcopy=catcopy
