{ pkgs, ... }:

{
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