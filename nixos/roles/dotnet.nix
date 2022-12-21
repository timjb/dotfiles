{ config, lib, pkgs, ... }:

{
  config = {

    environment.etc = {
      "dotnet/install_location_x64".text = "${pkgs.dotnet-sdk}";
    };

    environment.systemPackages = with pkgs; [
      dotnet-sdk
      jetbrains.rider
      msbuild
    ];
  };
}