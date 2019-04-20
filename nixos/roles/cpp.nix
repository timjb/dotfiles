# C/C++
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    clang
    valgrind
  ];
  my-config.vscodeExtensions = [
    pkgs.vscode-extensions.ms-vscode.cpptools
  ];
}