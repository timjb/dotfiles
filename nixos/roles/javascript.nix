{ ... }:

let
  pkgs-unstable = import <nixpkgs-unstable> {};
in
{
  environment.systemPackages = [
    pkgs-unstable.nodejs
    pkgs-unstable.yarn
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix); [
    prettier-vscode
    vscode-eslint
    vscode-jest
  ];
}