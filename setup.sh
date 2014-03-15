#/usr/bin/bash

if [ -h ~/.vim ]
then 
  rm ~/.vim
  ln -s ~/.dotfiles/vim/.vim ~/.vim
  echo "Replaced ~/.vim symlink with symlink to the .dotfiles .vim directory."
elif [ -f ~/.vim ]
then 
  mv ~/.vim ~/.vim-bkp
  ln -s ~/.dotfiles/vim/.vim ~/.vim
  echo "Moved ~/.vim to .vim-bkp and created new ~/.vim symlink to the .dotfiles .vim directory."
else
  ln -s ~/.dotfiles/vim/.vim ~/.vim
  echo "Created new ~/.vim symlink to the .dotfiles .vim directory."
fi

if [ -h ~/.vimrc ]
then 
  rm ~/.vimrc
  ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
  echo "Replaced ~/.vimrc symlink with symlink to the .dotfiles .vimrc file."
elif [ -f ~/.vimrc ]
then 
  mv ~/.vimrc ~/.vimrc-bkp
  ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
  echo "Moved ~/.vimrc to .vimrc-bkp and created new ~/.vimrc symlink to the .dotfiles .vimrc file."
else
  ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
  echo "Created new ~/.vimrc symlink to the .dotfiles .vimrc file."
fi

if [ -h ~/.gitconfig ]
then 
  rm ~/.gitconfig
  ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
  echo "Replaced ~/.gitconfig symlink with symlink to the .dotfiles .gitconfig file."
elif [ -f ~/.gitconfig ]
then 
  mv ~/.gitconfig ~/.gitconfig-bkp
  ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
  echo "Moved ~/.gitconfig to .gitconfig-bkp and created new ~/.gitconfig symlink to the .dotfiles .gitconfig file."
else
  ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
  echo "Created new ~/.gitconfig symlink to the .dotfiles .gitconfig file."
fi

if [ -h ~/.bashrc ]
then 
  rm ~/.bashrc
  ln -s ~/.dotfiles/bash/bashrc ~/.bashrc
  echo "Replaced ~/.bashrc symlink with symlink to the .dotfiles .bashrc file."
elif [ -f ~/.bashrc ]
then 
  mv ~/.bashrc ~/.bashrc-bkp
  ln -s ~/.dotfiles/bash/bashrc ~/.bashrc
  echo "Moved ~/.bashrc to .bashrc-bkp and created new ~/.bashrc symlink to the .dotfiles .bashrc file."
else
  ln -s ~/.dotfiles/bash/bashrc ~/.bashrc
  echo "Created new ~/.bashrc symlink to the .dotfiles .bashrc file."
fi
