#!/bin/bash

function createLink {
  if [ -e "$2" ]; then
    if [ "$(readlink "$2")" != "$1" ]; then
      echo "Could not create link $2: File already exists"
    fi
  else
    ln -s "$1" "$2"
    echo "Created link $2"
  fi
}

function linkDotfile {
  createLink "$HOME/dotfiles/$1" "$HOME/$1"
}

linkDotfile ".bashrc"
linkDotfile ".gitconfig"
linkDotfile ".gitexcludes"
linkDotfile ".gvimrc"
linkDotfile ".hgrc"
linkDotfile ".tmux.conf"
linkDotfile ".emacs"
linkDotfile ".emacs.d"
linkDotfile ".vim"
linkDotfile ".vimrc"
linkDotfile "bin"
linkDotfile ".xmonad"
mkdir -p ~/.config/fish/completions
linkDotfile ".config/fish/config.fish"
linkDotfile ".config/fish/nix.fish"
linkDotfile ".config/fish/completions/ypassword.fish"
linkDotfile ".stylish-haskell.yaml"
linkDotfile ".atom"

if [ -d "~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/" ]; then
  createLink ~/dotfiles/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings
fi
