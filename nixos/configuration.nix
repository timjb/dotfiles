# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  pkgs-unstable = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };
  old-pkgs = import (fetchTarball https://github.com/NixOS/nixpkgs/archive/ed111be99a470909ae83962fb213509c8feb9978.tar.gz) {}; # contains version 2.5.3 of Agda
in

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs.config.allowUnfree = true;

  #nixpkgs.config.packageOverrides = pkgs: {
  #  haskellPackages = pkgs.haskellPackages.override {
  #    overrides = self: super: {
  #      async = super.async_2_2_1;
  #      fsnotify = super.fsnotify_0_3_0_1;
  #      hinotify = super.hinotify_0_3_10;
  #      lifted-async = super.lifted-async_0_10_0_2;
  #    };
  #  };
  #};

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
    exfat

    # CLIs
    fish
    wget
    vim
    git
    pciutils
    cowsay
    fortune
    pandoc
    (ffmpeg-full.override {
      nonfreeLicensing = true;
      nvenc = true;
    })
    psmisc
    xsel # get/set contents of X clipboard
    binutils
    ripgrep
    tree
    docker

    tilix # Terminal emulator
    firefox
    chromium
    (unstable.vscode-with-extensions.override {
      vscodeExtensions =
        with unstable.vscode-extensions; [ ms-vscode.cpptools ] ++
        unstable.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "agda";
            publisher = "j-mueller";
            version = "0.1.7";
            sha256 = "09ix3pjaagr6aakshc8ybbipgdscr8ymdrqc4xxs6927x552yjsb";
          }
          {
            name = "bracket-pair-colorizer";
            publisher = "CoenraadS";
            version = "1.0.61";
            sha256 = "0r3bfp8kvhf9zpbiil7acx7zain26grk133f0r0syxqgml12i652";
          }
          {
            name = "fish";
            publisher = "TeddyDD";
            version = "0.0.4";
            sha256 = "1wzixi5wx3dj94174fybis0180jk9mw3c7xyr0sa1awqp4xdwkx6";
          }
          {
            name = "language-haskell";
            publisher = "justusadam";
            version = "2.5.0";
            sha256 = "10jqj8qw5x6da9l8zhjbra3xcbrwb4cpwc3ygsy29mam5pd8g6b3";
          }
          {
            name = "latex-workshop";
            publisher = "James-Yu";
            version = "5.16.0";
            sha256 = "0cl4nl9yp54xfclm1gnkrig2i9npnf069ca91gcvy6jzbmdza6jj";
          }
          {
            name = "nix";
            publisher = "bbenoist";
            version = "1.0.1";
            sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
          }
          {
            name = "python";
            publisher = "ms-python";
            version = "2019.1.0";
            sha256 = "1jp9i0qxdbrw3jk4in9za9cmfyrd6ii1ilgyg2van3mkq6xpp92w";
          }
          {
            name = "vim";
            publisher = "vscodevim";
            version = "0.16.12";
            sha256 = "07j5mm6ghrdbvwnlw3qap7276n74l41ww28xljffkiq0qmbhnr8i";
          }
          {
            name = "vscode-arduino";
            publisher = "vsciot-vscode";
            version = "0.2.24";
            sha256 = "15bardalmrhvly2rr5qisb9b4ay0imxrrxmp97x79lli3msqq5gl";
          }
        ];
    })
    #emacs
    pkgs-unstable.seafile-client
    spotify
    tdesktop # Telegram Desktop
    vlc
    gparted
    kdenlive
    yubikey-personalization
    yubikey-personalization-gui
    gnome3.geary
    #qt5ct
    breeze-icons
    audacity

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

    # LaTeX
    (texlive.combine { inherit (texlive) scheme-full; })
    biber

    # Theorem provers
    isabelle
    old-pkgs.haskellPackages.Agda

    # Gnome 3
    gnome3.gnome-tweak-tool
    gnome3.dconf-editor
    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.remove-dropdown-arrows
    gnomeExtensions.nohotcorner
    #gnomeExtensions.system-monitor
    arc-icon-theme

    # Config
    xbindkeys # xbindkeys-config
    xdotool

    # Keyboard.io
    arduino
  ];

  virtualisation.docker.enable = true;

  fonts.fonts = with pkgs; [
    fira-code fira-code-symbols
    ubuntu_font_family
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.bash.enableCompletion = true;
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };
  # programs.qt5ct.enable = true;

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

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  environment.variables.QT_QPA_PLATFORMTHEME = "qt5ct";

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

      # Enable touchpad support.
      # libinput.enable = true;

      displayManager.lightdm.enable = true;
      desktopManager = {
        gnome3.enable = true;
        default = "gnome3";
      };
    };

  };

  # doesn't work for some reason
  #systemd.user.services.xbindkeys = {
  #  description = "XBindKeys";
  #  serviceConfig = {
  #    #Type = "simple";
  #    ExecStart = "${pkgs.xbindkeys}/bin/xbindkeys --nodaemon --file /home/.xbindkeysrc";
  #    ExecStop = "${pkgs.procps}/bin/pkill xbindkeys";
  #    Restart = "on-abort";
  #  };
  #  wantedBy = [ "graphical.target" ];
  #};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tim = {
    isNormalUser = true;
    home = "/home";
    description = "Tim Baumann";
    extraGroups = [
      "wheel"
      "dialout" # http://vid.bina.me/tools/arduino/arduino-on-nixos/
      "docker"
    ];
    shell = pkgs.fish;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.03"; # Did you read the comment?

  system.autoUpgrade.enable = true;

}
