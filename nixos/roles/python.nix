{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python39.withPackages (ps: with ps; [
      pip
      pygments
      pylint # used by the Python VSCode extension
      virtualenvwrapper
    ]))
  ];
  my-config.vscodeExtensions = with (import ../vscode-extensions.nix pkgs); [
    python
  ];
}