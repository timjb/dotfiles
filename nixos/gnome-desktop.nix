{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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

  services.xserver = {
    displayManager.gdm = {
      enable = true;
      wayland = false;
    };
    desktopManager = {
      gnome3.enable = true;
      default = "gnome3";
    };
  };

}