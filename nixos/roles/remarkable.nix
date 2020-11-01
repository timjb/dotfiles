{ pkgs, ... }:

let
  remarkable-cups = pkgs.callPackage ./remarkable/remarkable-cups.nix { rmapi = pkgs.rmapi; };
in

{
  environment.systemPackages = with pkgs; [
    rmapi
  ];

  services.printing.enable = true;
  #services.printing.logLevel = "debug";
  services.printing.drivers = [ remarkable-cups ];
}