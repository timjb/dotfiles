{ pkgs, ... }:

let
  pkgs-unstable = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };
in
{
  environment.systemPackages = with pkgs; [
    pkgs-unstable.cargo
    pkgs-unstable.rustc
    pkgs-unstable.rls
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix); [
    rust
    better-toml
  ];
}