{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  name = "rmapi-${version}";
  version = "v0.0.11";

  src = fetchFromGitHub {
    owner = "juruen";
    repo = "rmapi";
    rev = "169534cd94e435cda2d90e79f3838431197abc14";
    sha256 = "0zks1pcj2s2pqkmw0hhm41vgdhfgj2r6dmvpsagbmf64578ww349";
  };

  goPackagePath = "github.com/juruen/rmapi";
  subPackages = [ "." ];
  modSha256 = "066n91h1zkfzmcz4psmc18p7j1kk64pjllv3aqxfgqlij9r8yhfx";

  meta = with lib; {
    description = "Go app that allows you to access your reMarkable tablet files through the Cloud API";
    homepage = https://github.com/juruen/rmapi;
    license = licenses.gpl3;
    maintainers = [ ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}