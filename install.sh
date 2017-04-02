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
mkdir -p ~/.config/fish/completions
linkDotfile ".config/fish/config.fish"
linkDotfile ".config/fish/nix.fish"
linkDotfile ".config/fish/completions/ypassword.fish"
linkDotfile ".stylish-haskell.yaml"
linkDotfile "Templates"
linkDotfile ".stack/config.yaml"
linkDotfile ".emacs.d"
linkDotfile ".spacemacs"

VSCODE_DIR="Library/Application Support/Code/User"
if [ -d "$HOME/$VSCODE_DIR" ]; then
  linkDotfilePrime "vscode/snippets" "$VSCODE_DIR/snippets"
  linkDotfilePrime "vscode/settings.json" "$VSCODE_DIR/settings.json"
else
  echo "Not Copying VS Code settings because the directory '~/$VSCODE_DIR' does not exist"
fi
