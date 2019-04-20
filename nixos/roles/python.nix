{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python37.withPackages (ps: with ps; [pygments pylint virtualenvwrapper]))
  ];
}