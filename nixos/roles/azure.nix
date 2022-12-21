{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs-16_x
    azure-cli
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix pkgs); [
    azure-account
    vscode-azurefunctions
    vscode-node-azure-pack
  ];
}