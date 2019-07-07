{ pkgs, ... }:

let
  rmapi = pkgs.callPackage ./remarkable/rmapi.nix {};
  remarkable-cups = pkgs.callPackage ./remarkable/remarkable-cups.nix { inherit rmapi; };
in

{
  environment.systemPackages = with pkgs; [
    rmapi
  ];

  services.printing.enable = true;
  #services.printing.logLevel = "debug";
  services.printing.drivers = [ remarkable-cups ];
}