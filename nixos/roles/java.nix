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
    # add symlinks /etc/openjdk{8,11} to /nix/store
    environment.etc = {
      "openjdk8".source = "${pkgs.openjdk8}/lib/openjdk";
      "openjdk11".source = "${pkgs.openjdk11}/lib/openjdk";
    };

    environment.systemPackages = with pkgs; [
      openjdk11

      # Build tools
      maven
      gradle

      # IDEs
      eclipses.eclipse-java
      (if config.roles.java.haveIntelliJUltimateLicense then pkgs.jetbrains.idea-ultimate else pkgs.jetbrains.idea-community)
    ];

    my-config.vscodeExtensions = with (import ../vscode-extensions.nix pkgs); [
      vscode-java-pack
    ];
  };
}