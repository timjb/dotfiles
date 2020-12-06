{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ghc
    haskellPackages.haskell-language-server
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix); [
    haskell
    language-haskell
  ];
}