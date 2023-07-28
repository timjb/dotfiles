{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    haskell-language-server
    (haskellPackages.ghcWithPackages (haskellPackages: with haskellPackages; [ stack ]))
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix pkgs); [
    haskell
    language-haskell
  ];
}