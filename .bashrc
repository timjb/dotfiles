#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

ls --color=auto >/dev/null 2>&1 && alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


#
# Environment
#

PATH=$PATH:$HOME/.cabal/bin:$HOME/bin:$HOME/.gem/ruby/1.9.1/bin
# Use $HOME/dotfiles/bin
[[ -d "$HOME/dotfiles/bin" ]] && PATH=$PATH:$HOME/dotfiles/bin

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
alias x='startx'
alias ..='cd ..'

# I can't memorize this line!
alias untargz='tar xvf'

# Open vim and NERDTree
alias vimt='vim -c "NERDTree"'


#
# Yeah!
#

fortune -s | cowsay
echo "" # empty line
