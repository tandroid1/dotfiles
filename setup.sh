#/usr/bin/bash

setup_dir() {
  if [ ! -d $1 ]
  then
    mkdir $1
    echo "Created $1 directory."
  else
    echo "Creating $1 failed. Directory already exists."
  fi
}

setup_dotfile() {
  dotfile=$1
  target=$2
  if [ -h $target ]
  then 
    rm $target
    ln -s $dotfile $target
    echo "Replaced $target symlink with symlink to $dotfile." 
  elif [ -f $target ]
  then 
    mv $target $HOME/dotfile-bkp/
    ln -s $dotfile $target
    echo "Moved $target to $HOME/dotfile-bkp/ and created new symlink to $dotfile."
  else
    ln -s $dotfile $target
    echo "Created new $target symlink to $dotfile."
  fi
}

# Global configurations
setup_dir $HOME/dotfile-bkp

# Vim configurations
setup_dir $HOME/.vimbackups 
setup_dotfile $HOME/.dotfiles/vim/vim $HOME/.vim 
setup_dotfile $HOME/.dotfiles/vim/vimrc $HOME/.vimrc 


# Git configuration
setup_dotfile $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig 
setup_dotfile $HOME/.dotfiles/git/gitignore $HOME/.gitignore 
setup_dotfile $HOME/.dotfiles/git/git_template $HOME/.git_template 

# Bash configuration
setup_dotfile $HOME/.dotfiles/bash/bashrc $HOME/.bashrc 

# Tmux configuration
setup_dotfile $HOME/.dotfiles/tmux/.tmux.conf $HOME/.tmux.conf

# irssi configuration
setup_dotfile $HOME/.dotfiles/irssi/irssi $HOME/.irssi
