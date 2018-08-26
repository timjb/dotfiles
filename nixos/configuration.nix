# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  pkgs-unstable = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };
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

    tilix # Terminal emulator
    firefox
    chromium
    (unstable.vscode-with-extensions.override {
      vscodeExtensions =
        with unstable.vscode-extensions; [ ms-vscode.cpptools ] ++
        unstable.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "vim";
            publisher = "vscodevim";
            version = "0.16.0";
            sha256 = "0rwipcjy8gyf98nskxg7i2hlj96h8djk0838b1fjmc31pv7kbr6x";
          }
          {
            name = "latex-workshop";
            publisher = "James-Yu";
            version = "5.8.2";
            sha256 = "1qx48g73sz1pnl74a1y64hy9pv74qbz431ghpdskcayvhjnngyak";
          }
          {
            name = "fish";
            publisher = "TeddyDD";
            version = "0.0.4";
            sha256 = "1wzixi5wx3dj94174fybis0180jk9mw3c7xyr0sa1awqp4xdwkx6";
          }
          {
            name = "bracket-pair-colorizer";
            publisher = "CoenraadS";
            version = "1.0.59";
            sha256 = "0ljnrbyigch2ih427lbgpz9rjy218nrphzmjx4l9jasc3pqkz2zm";
          }
          {
            name = "agda";
            publisher = "j-mueller";
            version = "0.1.7";
            sha256 = "09ix3pjaagr6aakshc8ybbipgdscr8ymdrqc4xxs6927x552yjsb";
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
    stack
    haskellPackages.intero # needed by Haskelly
    #haskellPackages.stack-run # doesn't work # needed by Haskelly

    # Python
    (python36.withPackages (ps: with ps; [pylint virtualenvwrapper pygments]))

    # C/C++
    gcc
    clang
    valgrind

    # LaTeX
    (texlive.combine { inherit (texlive) scheme-full; })

    # Theorem provers
    isabelle
    haskellPackages.Agda

    # Android development
    pkgs-unstable.android-studio
    pkgs-unstable.androidenv.platformTools
    gradle

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
  ];

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
      blacklist = [
        "zeit.de"
        "spiegel.de"
        "sueddeutsche.de"
        "kicker.de"
        "blog.fefe.de"
        "tagesschau.de"
        "sportschau.de"
        "twitter.com"
        #"reddit.com"
        "heise.de"
        "sportschau.de"
        "electrek.co"
        "nytimes.com"
        "news.ycombinator.com"
        "fivethirtyeight.com"
      ];
    in
      pkgs.lib.concatMapStrings block blacklist;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  environment.variables.QT_QPA_PLATFORMTHEME = "qt5ct";

  services = {

    udev.packages = [ pkgs.yubikey-personalization pkgs.android-udev-rules ];

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
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.03"; # Did you read the comment?

  system.autoUpgrade.enable = true;

}
