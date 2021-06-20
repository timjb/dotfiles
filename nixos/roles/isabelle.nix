{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    isabelle
  ];
}