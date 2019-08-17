# Java
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    openjdk

    # Build tools
    maven
    gradle

    # IDEs
    eclipses.eclipse-java
    idea.idea-community
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix); [
    vscode-java-pack
  ];
}