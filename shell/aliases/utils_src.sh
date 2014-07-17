# MAC ONLY
# Copy a file passed as the first parameter to the clipboard
catcopy() {
    cat $1 | pbcopy
}
alias catcopy=catcopy
