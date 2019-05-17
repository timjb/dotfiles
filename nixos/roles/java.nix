# C/C++
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    openjdk
  ];
  my-config.vscodeExtensions = [
    pkgs.vscode-extensions.ms-vscode.cpptools
  ];
}