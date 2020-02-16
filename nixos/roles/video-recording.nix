{ ... }:
let
  pkgs-unstable = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };
in

{
  environment.systemPackages = [
    pkgs-unstable.obs-studio
  ];
}
