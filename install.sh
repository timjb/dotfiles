#!/usr/bin/env bash

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
  createLink "$HOME/Projects/dotfiles/$1" "$HOME/$2"
}

function linkDotfile {
  linkDotfilePrime "$1" "$1"
}

linkDotfile ".bashrc"
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
linkDotfile ".config/fish/config.fish"
linkDotfile ".config/fish/nix.fish"
linkDotfile ".stylish-haskell.yaml"
linkDotfile "Templates"
mkdir -p ~/.stack
linkDotfile ".stack/config.yaml"
linkDotfile ".emacs.d"
linkDotfile ".spacemacs"
linkDotfile ".xbindkeysrc"
linkDotfile ".xprofile"

VSCODE_DIR_MACOS="Library/Application Support/Code/User"
VSCODE_DIR_LINUX=".config/Code/User"
if [ -d "$HOME/$VSCODE_DIR_MACOS" -o -d "$HOME/$VSCODE_DIR_LINUX" ]; then
  if [ -d "$HOME/$VSCODE_DIR_MACOS" ]; then
    VSCODE_DIR="$VSCODE_DIR_MACOS"
  else
    VSCODE_DIR="$VSCODE_DIR_LINUX"
  fi
  linkDotfilePrime "vscode/snippets" "$VSCODE_DIR/snippets"
  linkDotfilePrime "vscode/settings.json" "$VSCODE_DIR/settings.json"
else
  echo "Not copying VS Code settings because neither directory '~/$VSCODE_DIR_MACOS' nor '~/$VSCODE_DIR_LINUX' exists."
fi
