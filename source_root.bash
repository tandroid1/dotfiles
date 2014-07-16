# Creates quick alias to get to cd the dotfiles directory.
alias dotfiles="cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $HOME/.dotfiles/aliases/source_aliases.bash
source $HOME/.dotfiles/bash/source_bash.bash
source $HOME/.dotfiles/drupal/source_drupal.bash
source $HOME/.dotfiles/git/source_git.bash
source $HOME/.dotfiles/terminal/source_terminal.bash
source $HOME/.dotfiles/vim/source_vim.bash
