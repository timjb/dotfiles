Because I'm homesick.

Installation
============

Clone the repository:

```bash
$ cd ~/Projects
$ git clone https://github.com/timjb/dotfiles.git
```

Init submodules:

```bash
$ cd dotfiles
$ git submodule init
$ git submodule update
```

Create symlinks. `./install.sh` does that for you.

On NixOS, when installing on a new machine:

```bash
$ cd /path/to/this/repo/nixos
$ sudo mv /etc/nixos/configuration.nix my-new-machine-configuration.nix
$ sudo mv /etc/nixos/hardware-configuration.nix my-new-machine-hardware-configuration.nix
$ ln -s my-new-machine-configuration.nix configuration.nix
# edit my-new-machine-configuration.nix
$ sudo rm /etc/nixos
$ ln -s /path/to/this/repo/nixos /etc/nixos
```