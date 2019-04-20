{ config, lib, pkgs, vscode-utils, ... }:

{
  imports = [
    ./gnome-desktop.nix
    ./my-config.nix
  ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    exfat # support for exfat file system

    # CLIs
    binutils # ld, as, ...
    cowsay
    exa # Rust replacement for ls
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

    # GUI applications
    chromium
    firefox
    gparted
    spotify
    tdesktop # Telegram Desktop
    tilix # Terminal emulator
    vlc
    (vscode-with-extensions.override {
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

  system.autoUpgrade.enable = true;
}