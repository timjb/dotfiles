{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    docker
  ];
  virtualisation.docker.enable = true;
  my-config.userExtraGroups = [ "docker" ];
}