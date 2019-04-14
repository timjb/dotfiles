{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (texlive.combine { inherit (texlive) scheme-full; })
    biber
  ];
}