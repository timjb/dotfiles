{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cargo
    rustc
    rls
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix pkgs); [
    rust
    better-toml
  ];
}