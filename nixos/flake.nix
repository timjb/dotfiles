{
  description = "flake for baumannt-tng-nixos";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-23.05";
    };
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      baumannt-tng-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./xps-15-configuration.nix
        ];
      };
    };
  };
}