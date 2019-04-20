# C/C++
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    clang
    valgrind
  ];
}