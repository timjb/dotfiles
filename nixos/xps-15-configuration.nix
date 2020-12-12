{ config, pkgs, ... }:
let
  pkgs-unstable = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };
  importFolder = import ./util/import-folder.nix;
  freeplane = pkgs.callPackage ./freeplane.nix {};
in

{
  imports = [
    ./xps-15-hardware-configuration.nix
    ./shared.nix
    #./roles/azure.nix
    ./roles/docker.nix
    ./roles/go.nix
    ./roles/haskell.nix
    ./roles/java.nix
    ./roles/javascript.nix
    ./roles/python.nix
    ./roles/remarkable.nix
    ./roles/rust.nix
    #./roles/video-recording.nix
  ] ++ importFolder ./work-private;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # disable Nvidia to save power
  # see https://github.com/NixOS/nixos-hardware/blob/master/dell/xps/15-9560/intel/default.nix
  boot.blacklistedKernelModules = [ "nouveau" "nvidia" ];

  networking.hostName = "baumannt-tng-nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  console = {
    keyMap = "us";
    font = "latarcyrheb-sun32"; # larger console font for high DPI monitor
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Berlin";

  nixpkgs.config.permittedInsecurePackages = [
    "thunderbird-68.12.0"
  ];

  environment.systemPackages = with pkgs; [
    keepassxc
    openvpn
    thunderbird-68 # TODO: update when Thunderbird 78 supports OpenPGP
    veracrypt
    gnupg
    pkgs-unstable.slack
    libreoffice
    freeplane
  ];

  services.flatpak.enable = true;

  roles.java.haveIntelliJUltimateLicense = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # disable Nvidia to save power
  # see https://github.com/NixOS/nixos-hardware/blob/master/dell/xps/15-9560/intel/default.nix
  hardware.nvidiaOptimus.disable = true;

  virtualisation.virtualbox.host.enable = true;

  services = {

    # Enable the OpenSSH daemon.
    # openssh.enable = true;

    # Enable CUPS to print documents.
    # printing.enable = true;

    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      autorun = true;
      layout = "us";
      videoDrivers = [ "modesetting" ];

      # Enable touchpad support.
      libinput.enable = true;

      #monitorSection = ''
      #  DisplaySize 406 228
      #'';
    };

    # recommended by https://github.com/NixOS/nixos-hardware/blob/master/dell/xps/15-9560/xps-common.nix
    thermald.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tim = {
    isNormalUser = true;
    home = "/home/tim";
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
  system.stateVersion = "19.03"; # Did you read the comment?
  system.autoUpgrade.enable = false;

}
