{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    azure-cli
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix pkgs); [
    azure-account
    vscode-azurefunctions
    vscode-node-azure-pack
  ];
}