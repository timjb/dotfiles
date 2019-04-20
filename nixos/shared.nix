{ config, pkgs, ... }:

{
  imports = [
    ./gnome-desktop.nix
    ./my-config.nix
  ];

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
  ];

  fonts.fonts = with pkgs; [
    fira-code fira-code-symbols
    ubuntu_font_family
  ];

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