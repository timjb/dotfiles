Because I'm homesick.

Installation
============

Clone the repository:

	git clone https://github.com/timjb/dotfiles.git

Init submodules:

	cd dotfiles
	git submodule init
	git submodule update

1. Create symlinks. `./install.sh` does that for you.
2. You may need to run `xrdb ~/.Xresources` to get the solarized colorscheme working.
3. To use my nautilus templates, change the following line in
   `~/.config/user-dirs.dirs`:

	XDG_TEMPLATES_DIR="$HOME/"

to look like this:

	XDG_TEMPLATES_DIR="$HOME/dotfiles/Templates"
