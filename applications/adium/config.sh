#/usr/bin/bash

if [ -d "$HOME/Library/Application Support/Adium 2.0" ]; then
  mkdir -p "$HOME/Library/Application Support/Adium 2.0/Message Styles"
  ln -s $HOME/.dotfiles/applications/adium/adium-solarized "$HOME/Library/Application Support/Adium 2.0/Message Styles/Solarized.AdiumMessageStyle"
fi
