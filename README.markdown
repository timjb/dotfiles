Because I'm homesick.

Installation
============

Clone the repository:

	git clone https://github.com/timjb/dotfiles.git

Init submodules:

	cd dotfiles
	git submodule init
	git submodule update

Create symlinks:

	ln -s ~/dotfiles/.bashrc ~/.bashrc
	ln -s ~/dotfiles/.conkyrc ~/.conkyrc
	ln -s ~/dotfiles/.gitconfig ~/.gitconfig
	ln -s ~/dotfiles/.gitexcludes ~/.gitexcludes
	ln -s ~/dotfiles/.gvimrc ~/.gvimrc
	ln -s ~/dotfiles/.hgrc ~/.hgrc
	ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
	ln -s ~/dotfiles/.vim ~/.vim
	ln -s ~/dotfiles/.vimrc ~/.vimrc
	ln -s ~/dotfiles/.emacs ~/.emacs
	ln -s ~/dotfiles/.viper ~/.viper

To use my nautilus templates, change the following line in `~/.config/user-dirs.dirs`:

	XDG_TEMPLATES_DIR="$HOME/"

to look like this:

	XDG_TEMPLATES_DIR="$HOME/dotfiles/Templates"
