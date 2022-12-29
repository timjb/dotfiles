{ pkgs, ... }:

let
  unstable-channel = import <nixpkgs-unstable> {}; # use unstable because it contains v0.23, which has a fix for https://github.com/juruen/rmapi/issues/283
  remarkable-cups = pkgs.callPackage ./remarkable/remarkable-cups.nix { rmapi = unstable-channel.rmapi; };
in

{
  environment.systemPackages = with pkgs; [
    unstable-channel.rmapi
  ];

  services.printing.enable = true;
  #services.printing.logLevel = "debug";
  services.printing.drivers = [ remarkable-cups ];
}