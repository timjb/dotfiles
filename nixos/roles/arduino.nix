{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    arduino
  ];
  # http://vid.bina.me/tools/arduino/arduino-on-nixos/
  my-config.userExtraGroups = [ "dialout" ];
}