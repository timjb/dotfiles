{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    yarn
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix); [
    prettier-vscode
    vscode-eslint
    vscode-firefox-debug
    vscode-jest
    vscode-wasm
  ];
}