{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (callPackage ../isabelle-2018.nix { java = jre; })
  ];
}