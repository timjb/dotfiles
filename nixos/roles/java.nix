# Java
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    openjdk
    eclipses.eclipse-java
    gradle
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix); [
    vscode-java-pack
  ];
}