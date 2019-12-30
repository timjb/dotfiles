{ config, lib, pkgs, vscode-utils, ... }:
let
  pkgs-unstable = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };
in

{
  imports = [
    ./gnome-desktop.nix
    ./my-config.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;

    chromium = {
      enablePepperFlash = true;
    };
  };

  environment.systemPackages = with pkgs; [
    exfat # support for exfat file system

    # CLIs
    binutils # ld, as, ...
    cowsay
    exa # Rust replacement for ls
    file # tells you the format/kind of some file
    fish
    fortune
    git
    gnumake
    pciutils # lspci, setpci, update-pciids
    psmisc # fuser, killall, pstree, peekfd
    ripgrep # Rust replacement for grep
    vim
    wget
    xsel # get/set contents of X clipboard
    cloc # count lines of code

    # GUI applications
    chromium
    firefox
    gimp
    gparted
    inkscape
    spotify
    tdesktop # Telegram Desktop
    tilix # Terminal emulator
    seafile-client
    vlc
    (pkgs-unstable.vscode-with-extensions.override {
      vscodeExtensions = config.my-config.vscodeExtensions;
    })
  ];

  my-config.vscodeExtensions = with (import ./vscode-extensions.nix); [
    bracket-pair-colorizer
    fish
    nix
    vim
  ];

  fonts.fonts = with pkgs; [
    fira-code fira-code-symbols
    source-code-pro
    ubuntu_font_family
  ];

  programs.bash.enableCompletion = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  networking.extraHosts =
    let
      block = host: ''
        127.0.0.1 ${host}
        127.0.0.1 www.${host}
        ::1 ${host}
        ::1 www.${host}
      '';
      blacklist = import ./blacklist.nix;
    in
      pkgs.lib.concatMapStrings block blacklist;
}