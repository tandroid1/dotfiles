dotfiles
========

#An E3 compilation of common configuration.

##Installation:

####Basic

    git clone --recursive git@github.com:elevatedthird/dotfiles.git $HOME/.dotfiles
    cd $HOME/.dotfiles
    sudo chmod u+x setup.sh
    ./setup.sh

Next, you'll need to configure a thing or two. Open up config.sh and update it according to your local set up. Then, you're ready to source the new .bashrc file.

    cd $HOME/.dotfiles/
    vim config.sh // or your 'other' favorite text editor

Change the DOCROOT path to wherever you plan on keeping all your project repos. 

Finally,

    source $HOME/.bashrc

That's it!

####Colors

OSX only

  1. Open plain jane terminal
  1. Select the gear icon under all the themes.
  1. Import preffered color scheme from $HOME/.dotfiles/terminal/osx-terminal.app-colors-solarized
