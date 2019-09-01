{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    stack
    ghc
    #haskellPackages.intero # needed by Haskelly
    #haskellPackages.stack-run # doesn't work # needed by Haskelly
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix); [
    language-haskell
  ];
}