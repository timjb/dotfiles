{ pkgs, ... }:

{
  # fix issue of missing frei0r plugins,
  # see https://github.com/NixOS/nixpkgs/issues/29614#issuecomment-511118058
  nixpkgs.config.packageOverrides = pkgs: {
    kdenlive = pkgs.kdenlive.overrideAttrs (oldAttrs: rec {
        postInstall = ''
         wrapProgram $out/bin/kdenlive --prefix FREI0R_PATH : ${pkgs.frei0r}/lib/frei0r-1
       '';
       nativeBuildInputs = oldAttrs.nativeBuildInputs or [] ++ [ pkgs.makeWrapper ];
    });
  };

  environment.systemPackages = with pkgs; [
    (ffmpeg-full.override {
      nonfreeLicensing = true;
      nvenc = true;
    })
    kdenlive
    breeze-icons # icon set used in kdenlive
    audacity
  ];
}