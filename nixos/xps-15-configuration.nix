{ config, pkgs, ... }:

{
  imports = [
    ./xps-15-hardware-configuration.nix
    ./shared.nix
    ./roles/docker.nix
    ./roles/haskell.nix
    ./roles/python.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.blacklistedKernelModules = [ "nouveau" ];

  networking.hostName = "baumannt-tng-nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  i18n = {
    consoleFont = "latarcyrheb-sun32";
    #consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Berlin";

  environment.systemPackages = with pkgs; [
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  #hardware.bumblebee.enable = true;

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

}
