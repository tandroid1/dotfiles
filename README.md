dotfiles
========

##An E3 compilation of common configuration.

###Installation:

__If you want to customize your dotfiles, you might consider [forking this repo first](#forking).__

####Basic

Run these 4 commands; don't forget the `--recursive`.

    git clone --recursive <clone URL from your cloned repo> $HOME/.dotfiles
    cd $HOME/.dotfiles
    sudo chmod u+x setup.sh
    ./setup.sh

Next, you'll need to configure a thing or two. Open up config.sh and update it according to your local set up. Then, you're ready to source the new .bashrc file.

    cd $HOME/.dotfiles/
    vim config.sh # or you can use your 'other' favorite text editor

Change the DOCROOT path to wherever you plan on keeping all your project repos. 

Finally,

    source $HOME/.bashrc

That's it!

####Colors

OSX only

  1. Open plain jane terminal
  1. Select the gear icon under all the themes.
  1. Import preffered color scheme from $HOME/.dotfiles/terminal/osx-terminal.app-colors-solarized

###Forking

In order to personalize your dotfiles and version control them in Git, it's highly recommended that you fork this repository instead of cloning it directly. To do that, scroll to the top of this page and click the fork button in the top right corner. This will allow you to create clone this repo directly to your GitHub account. Now, you can clone directly from that new repo to your local machine.

If you'd like to contribute back to the E3 repo, go ahead and create an E3 branch in your own repo.

    git checkout -b e3

Now push the new branch to your remote repo.

    git push -u origin e3

Finally, add the original E3 repo as a new remote. This will allow you to keep up to date with changes and updates to made by others on the team. 

    git remote add e3 git@github.com:elevatedthird/dotfiles.git

From now on, do personal customizations on your `master` branch and shareable contributions on your `e3` branch.

To stay up to date with the `e3` repo run:

    git checkout e3
    git fetch e3
    git rebase e3/master

You can merge these changes into your `master` branch. Your `e3` branch should always act as an intermediary between your dotfiles and the `e3` repo. Take care to make sure you don't merge personal custimizations from your `master` branch into your `e3` branch.
