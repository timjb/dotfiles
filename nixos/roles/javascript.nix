{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (nodejs-14_x.override { enableNpm = false; })
    # can't install 'npm' version 7 via nix, must be done manually using 'yarn global install npm@7'
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