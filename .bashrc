#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

ls --color=auto >/dev/null 2>&1 && alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#
# Nix
#

if [ -f ~/.nix-profile/etc/profile.d/nix.sh ]; then
  . ~/.nix-profile/etc/profile.d/nix.sh
fi

#
# Environment
#

function addToPath {
  [[ -d $1 ]] && PATH=$PATH:$1
}

addToPath $HOME/.cabal/bin
addToPath $HOME/bin
addToPath $HOME/dotfiles/bin

PS1="\[\033[1;34m\]\w\[\033[0m\] \$ "

# Don't show these commands in the history
export HISTIGNORE=ls:fg:q


#
# Aliases
#

# Git Aliases
alias gst='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'

# One letter aliases
alias q='exit'
alias g='git'
alias v='vim'
alias l='less'
alias ..='cd ..'

# I can't memorize this line!
alias untargz='tar xvf'


#
# Yeah!
#

fortune -s | cowsay
echo "" # empty line
