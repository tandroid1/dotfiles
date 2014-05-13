# Creates quick alias to get to cd the dotfiles directory.
alias dotfiles="cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ~/.dotfiles/aliases/source_aliases.bash
source ~/.dotfiles/bash/source_bash.bash
source ~/.dotfiles/drupal/source_drupal.bash
source ~/.dotfiles/git/source_git.bash
source ~/.dotfiles/terminal/source_terminal.bash
source ~/.dotfiles/vim/source_vim.bash
