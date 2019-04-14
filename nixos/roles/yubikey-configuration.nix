{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    yubikey-personalization
    yubikey-personalization-gui
  ];
  services.udev.packages = [ pkgs.yubikey-personalization ];
}