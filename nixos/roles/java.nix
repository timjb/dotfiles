# Java
{ config, lib, pkgs, ... }:

{
  options = {
    roles.java.haveIntelliJUltimateLicense = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = {
    environment.systemPackages = with pkgs; [
      openjdk

      # Build tools
      maven
      gradle

      # IDEs
      eclipses.eclipse-java
      (if config.roles.java.haveIntelliJUltimateLicense then idea.idea-ultimate else idea.idea-community)
    ];
    my-config.vscodeExtensions = with (import ../vscode-extensions.nix); [
      vscode-java-pack
    ];
  };
}