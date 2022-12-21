{ config, lib, pkgs, vscode-utils, ... }:
let
  unstable-channel = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };
  unstable-git = import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixos-unstable)
    { config = config.nixpkgs.config; };
in

{
  imports = [
    ./gnome-desktop.nix
    ./my-config.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    exfat # support for exfat file system

    # CLIs
    binutils # ld, as, ...
    cloc # count lines of code
    unstable-channel.comma # unstable because not yet available in stable
    cowsay
    direnv
    exa # Rust replacement for ls
    file # tells you the format/kind of some file
    fish
    fortune
    git
    gitAndTools.gh
    gnumake
    htop
    jq
    niv
    nix-du
    pciutils # lspci, setpci, update-pciids
    psmisc # fuser, killall, pstree, peekfd
    restic
    ripgrep # Rust replacement for grep
    starship # shell prompt
    tldr # better man
    vim
    wget
    xsel # get/set contents of X clipboard

    # GUI applications
    chromium
    evolution # used for calendar in Gnome Shell
    unstable-git.firefox # need v99 for security reasons
    gimp
    gparted
    inkscape
    joplin-desktop
    postman
    signal-desktop
    spotify
    unstable-channel.teams
    tdesktop # Telegram Desktop
    tilix # Terminal emulator
    seafile-client
    vlc
    (vscode-with-extensions.override {
      vscodeExtensions = config.my-config.vscodeExtensions;
    })
  ];

  my-config.vscodeExtensions = with (import ./vscode-extensions.nix pkgs); [
    bracket-pair-colorizer
    fish
    gitlens
    nix
    terraform
    vim
  ];

  fonts.fonts = with pkgs; [
    fira-code fira-code-symbols
    source-code-pro
    ubuntu_font_family
  ];

  nix.settings.auto-optimise-store = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 45d";
  };

  programs.bash.enableCompletion = true;

  services.lorri.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
