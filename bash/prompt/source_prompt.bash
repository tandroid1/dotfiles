function parse_git_branch {
  branch=`git branch 2> /dev/null | grep '^*' | awk '{print $2}' | cut -c 1-3`
  if [ ! -z $branch ]; then
    echo ":$branch"
  fi
}

# Set simple terminal prompt
PS1='[$?] \u \W$(parse_git_branch) \$ '
