{
  description = "flake for baumannt-tng-nixos";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-23.05";
    };
    please = {
      url = "github:TNG/please-cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, ... }@inputs: {
    nixosConfigurations = {
      baumannt-tng-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs.inputs = inputs;
        modules = [
          ./xps-15-configuration.nix
          nixos-hardware.nixosModules.common-cpu-intel
          nixos-hardware.nixosModules.common-gpu-nvidia-disable
          nixos-hardware.nixosModules.common-pc-laptop
        ];
      };
    };
  };
}