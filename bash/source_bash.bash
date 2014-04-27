# Set vi editing mode
set -o vi

# Set simple terminal prompt
PS1='[$?] \u : \W $(parse_git_branch)\$ '
