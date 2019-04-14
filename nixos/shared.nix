{ config, pkgs, ... }:

{
  imports = [
    ./gnome-desktop.nix
    ./my-config.nix
  ];

  environment.systemPackages = with pkgs; [
    exfat # support for exfat file system

    # CLIs
    fish
    wget
    vim
    git
    pciutils # lspci, setpci, update-pciids
    cowsay
    fortune
    psmisc # fuser, killall, pstree, peekfd
    xsel # get/set contents of X clipboard
    binutils # ld, as, ...
    ripgrep
    exa

    # GUI applications
    tilix # Terminal emulator
    firefox
    chromium
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