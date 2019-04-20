{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    stack
    #haskellPackages.intero # needed by Haskelly
    #haskellPackages.stack-run # doesn't work # needed by Haskelly
  ];
}