source ~/.dotfiles/git/git-flow-completion/git-flow-completion.bash
source ~/.dotfiles/git/git-completion/git-completion.bash

function parse_git_branch {
  branch=`git branch 2> /dev/null | awk '{print $2}' | cut -c 1-3`
  if [ ! -z $branch ]; then
    echo ": $branch "
  fi
}
