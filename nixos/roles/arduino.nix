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
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix pkgs); [
    #vscode-arduino # commented out because currently building fails with error 'unpacker produced multiple directories'
  ];
}