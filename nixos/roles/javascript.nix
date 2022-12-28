{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs-16_x
    yarn
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix pkgs); [
    prettier-vscode
    svelte-vscode
    vscode-eslint
    vscode-firefox-debug
    vscode-jest
    vscode-wasm
  ];
}