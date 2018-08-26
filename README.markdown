Because I'm homesick.

Installation
============

Clone the repository:

```bash
cd ~/Projects
git clone https://github.com/timjb/dotfiles.git
```

Init submodules:

```bash
cd dotfiles
git submodule init
git submodule update
```

Create symlinks. `./install.sh` does that for you.

On NixOS:

```bash
sudo rm /etc/nixos
ln -s /path/to/this/repo/nixos /etc/nixos
```