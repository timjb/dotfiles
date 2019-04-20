{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python37.withPackages (ps: with ps; [
      pygments
      pylint # used by the Python VSCode extension
      virtualenvwrapper
    ]))
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix); [
    python
  ];
}