{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    azure-cli
    azuredatastudio
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix pkgs); [
    azure-account
    vscode-azurefunctions
    vscode-node-azure-pack
  ];
}