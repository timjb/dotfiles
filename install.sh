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

function linkDotfilePrime {
  createLink "$HOME/dotfiles/$1" "$HOME/$2"
}

function linkDotfile {
  linkDotfilePrime "$1" "$1"
}

linkDotfile ".bashrc"
linkDotfile "bitbar-plugins"
linkDotfile ".gitconfig"
linkDotfile ".gitexcludes"
linkDotfile ".gvimrc"
linkDotfile ".hgrc"
linkDotfile ".tmux.conf"
linkDotfile ".vim"
linkDotfile ".vimrc"
linkDotfilePrime ".vim" ".nvim" # Neovim
linkDotfilePrime ".vimrc" ".nvimrc" # Neovim
linkDotfile "bin"
linkDotfile ".xmonad"
mkdir -p ~/.config/fish/completions
linkDotfile ".config/fish/config.fish"
linkDotfile ".config/fish/nix.fish"
linkDotfile ".config/fish/completions/ypassword.fish"
linkDotfile ".stylish-haskell.yaml"
linkDotfile ".atom"
linkDotfile "Templates"
linkDotfile ".stack/config.yaml"
