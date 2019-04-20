{ config, pkgs, ... }:
let
  pkgs-unstable = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };
in

{
  imports = [
    ./xux-cube-hardware-configuration.nix
    ./shared.nix
    ./roles/agda.nix
    ./roles/arduino.nix
    ./roles/cpp.nix
    ./roles/docker.nix
    ./roles/haskell.nix
    ./roles/isabelle.nix
    ./roles/latex.nix
    ./roles/python.nix
    ./roles/video-editing.nix
    ./roles/yubikey-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "timjb-nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Berlin";

  environment.systemPackages = with pkgs; [
    # CLIs
    pandoc

    emacs
    pkgs-unstable.seafile-client
  ];

  services = {

    udev.packages = [ pkgs.yubikey-personalization ];

    # Enable the OpenSSH daemon.
    # openssh.enable = true;

    # Enable CUPS to print documents.
    # printing.enable = true;

    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "eurosign:e";
      videoDrivers = [ "nvidia" ];
    };

  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tim = {
    isNormalUser = true;
    home = "/home";
    description = "Tim Baumann";
    extraGroups = [
      "wheel"
    ] ++ config.my-config.userExtraGroups;
    shell = pkgs.fish;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.03"; # Did you read the comment?

}
