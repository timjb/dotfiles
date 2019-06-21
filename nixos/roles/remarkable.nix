{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (callPackage ./remarkable/rmapi.nix {})
  ];
}