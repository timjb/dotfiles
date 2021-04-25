# Java
{ config, lib, pkgs, ... }:

let
  pkgs-unstable = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };
in
{
  options = {
    roles.java.haveIntelliJUltimateLicense = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = {
    # add symlinks /etc/openjdk8 to /nix/store
    environment.etc = {
      "openjdk8".source = "${pkgs.openjdk8}/lib/openjdk";
    };

    environment.systemPackages = with pkgs; [
      openjdk8

      # Build tools
      maven
      gradle

      # IDEs
      eclipses.eclipse-java
      (if config.roles.java.haveIntelliJUltimateLicense then pkgs-unstable.idea.idea-ultimate else pkgs-unstable.idea.idea-community)
    ];

    my-config.vscodeExtensions = with (import ../vscode-extensions.nix); [
      vscode-java-pack
    ];
  };
}