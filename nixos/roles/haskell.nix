{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cabal2nix
    ghc
    haskellPackages.haskell-language-server
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix pkgs); [
    haskell
    language-haskell
  ];
}