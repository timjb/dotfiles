{ pkgs, ... }:

{
  imports = [
    ./cpp.nix
  ];
  environment.systemPackages = with pkgs; [
    arduino
  ];
  # http://vid.bina.me/tools/arduino/arduino-on-nixos/
  my-config.userExtraGroups = [ "dialout" ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix); [
    vscode-arduino
  ];
}