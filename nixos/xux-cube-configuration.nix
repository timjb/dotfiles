{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  pkgs-unstable = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };
  old-pkgs = import (fetchTarball https://github.com/NixOS/nixpkgs/archive/ed111be99a470909ae83962fb213509c8feb9978.tar.gz) {}; # contains version 2.5.3 of Agda
in

{
  imports = [
    ./xux-cube-hardware-configuration.nix
    ./shared.nix
    ./roles/arduino.nix
    ./roles/docker.nix
    ./roles/latex.nix
    ./roles/video-editing.nix
    ./roles/yubikey-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

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

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # CLIs
    pandoc

    (unstable.vscode-with-extensions.override {
      vscodeExtensions =
        with unstable.vscode-extensions; [ ms-vscode.cpptools ] ++
        unstable.vscode-utils.extensionsFromVscodeMarketplace (import ./vscode-extensions.nix);
    })
    #emacs
    pkgs-unstable.seafile-client
    spotify
    tdesktop # Telegram Desktop
    gparted

    # Build tools
    gnumake
    cmake
    pkgs-unstable.bazel

    # Haskell
    pkgs-unstable.stack
    #haskellPackages.intero # needed by Haskelly
    #haskellPackages.stack-run # doesn't work # needed by Haskelly

    # Python
    (python36.withPackages (ps: with ps; [pylint]))
    (python37.withPackages (ps: with ps; [pygments virtualenvwrapper]))

    # C/C++
    gcc
    clang
    valgrind

    # Theorem provers
    (callPackage ./isabelle-2018.nix { java = jre; })
    old-pkgs.haskellPackages.Agda

    # Config
    xbindkeys # xbindkeys-config
    xdotool
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.bash.enableCompletion = true;
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

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

  system.autoUpgrade.enable = true;

}
