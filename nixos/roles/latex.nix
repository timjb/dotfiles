{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (texlive.combine { inherit (texlive) scheme-full; })
    biber
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix); [
    latex-workshop
  ];
}