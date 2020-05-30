{ pkgs, ... }:

let
  pkgs-unstable = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };
in
{
  environment.systemPackages = with pkgs; [
    nodejs
    pkgs-unstable.azure-cli
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix); [
    azure-account
    vscode-azurefunctions
    vscode-node-azure-pack
  ];
}