{ config, lib, pkgs, vscode-utils, inputs, ... }:

{
  imports = [
    ./gnome-desktop.nix
    ./my-config.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    exfat # support for exfat file system

    # CLIs
    binutils # ld, as, ...
    cloc # count lines of code
    comma
    cowsay
    direnv
    dos2unix
    exa # Rust replacement for ls
    file # tells you the format/kind of some file
    fortune
    git
    gitAndTools.gh
    gnumake
    graphviz
    htop
    jq
    niv
    nix-du
    nix-index
    pciutils # lspci, setpci, update-pciids
    inputs.please.packages."${pkgs.system}".please
    psmisc # fuser, killall, pstree, peekfd
    restic
    ripgrep # Rust replacement for grep
    starship # shell prompt
    terraform
    tldr # better man
    vim
    wget
    xsel # get/set contents of X clipboard

    # GUI applications
    chromium
    cypress
    evolution # used for calendar in Gnome Shell
    firefox
    gimp
    gparted
    inkscape
    joplin-desktop
    microsoft-edge # for webdev
    postman
    signal-desktop
    spotify
    tdesktop # Telegram Desktop
    tilix # Terminal emulator
    seafile-client
    vlc
    (vscode-with-extensions.override {
      vscodeExtensions = config.my-config.vscodeExtensions;
    })
    zoom-us
  ];

  my-config.vscodeExtensions = with (import ./vscode-extensions.nix pkgs); [
    dendron
    dendron-markdown-shortcuts
    dendron-paste-image
    vscode-yaml
    fish
    gitlens
    nix
    terraform
    vim
  ];

  fonts.fonts = with pkgs; [
    fira-code fira-code-symbols
    source-code-pro
    ubuntu_font_family
  ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 45d";
    };
  };

  programs.bash.enableCompletion = true;

  services.lorri.enable = true;

  # enable antivirus clamav and
  # keep the signatures' database updated
  services.clamav.daemon.enable = true;
  services.clamav.updater.enable = true;

  # Enable sound.
  sound.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
