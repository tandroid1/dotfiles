dotfiles
========

###An E3 compilation of common configuration.

###Installation:


    git clone git@github.com:elevatedthird/dotfiles.git $HOME/.dotfiles
    cd $HOME/.dotfiles
    git submodile init
    git submodule update
    sudo chmod u+x setup.sh
    ./setup.sh

Next, you'll need to actually source the files we just set up. Before that, you'll need to configure things though. Open up config.sh and update it according to your local set up. Then, you're ready to source the new .bashrc file.

    source $HOME/.bashrc

That's it!
