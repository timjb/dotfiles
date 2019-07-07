{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    go
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix); [
    go
  ];
}