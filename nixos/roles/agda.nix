{ pkgs, ... }:
let
  old-pkgs = import (fetchTarball https://github.com/NixOS/nixpkgs/archive/ed111be99a470909ae83962fb213509c8feb9978.tar.gz) {}; # contains version 2.5.3 of Agda
in

{
  environment.systemPackages = [
    old-pkgs.haskellPackages.Agda
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix pkgs); [
    agda
  ];
}