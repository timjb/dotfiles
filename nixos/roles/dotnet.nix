{ config, lib, pkgs, ... }:

{
  config = {

    environment.etc = {
      "dotnet/install_location_x64".text = "${pkgs.dotnet-sdk_7}";
      # stable locations for configuring SDK in IDE
      "dotnet6".source = "${pkgs.dotnet-sdk}";
      "dotnet7".source = "${pkgs.dotnet-sdk_7}";
    };

    environment.systemPackages = with pkgs; [
      dotnet-sdk_7
      jetbrains.rider
      msbuild
    ];
  };
}