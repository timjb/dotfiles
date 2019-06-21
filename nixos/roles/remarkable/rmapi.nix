{ buildGoPackage, fetchFromGitHub, lib }:

buildGoPackage rec {
  name = "rmapi-${version}";
  version = "master-1718c6";

  src = fetchFromGitHub {
    owner = "juruen";
    repo = "rmapi";
    rev = "1718c624be8fc6cec01b295a8a5f2a30ec6a9107";
    sha256 = "179qiy1vqy9kcp8jjwkzkq9pb02k97idkljqzzj78v42cj0lprlk";
  };

  modSha256 = "17x9ifmfydq17m4by6sx8pp7np03vjqj7m380gv7h269crffblgd";

  goPackagePath = "github.com/juruen/rmapi";
  subPackages = [ "." ];

  meta = with lib; {
    description = "Go app that allows you to access your reMarkable tablet files through the Cloud API";
    homepage = https://github.com/juruen/rmapi;
    license = licenses.gpl3;
    maintainers = [ ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}