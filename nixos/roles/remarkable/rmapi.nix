{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  name = "rmapi-${version}";
  version = "v0.0.12";

  src = fetchFromGitHub {
    owner = "juruen";
    repo = "rmapi";
    rev = "6764c56217ef8718041de280d1b060bad73a2e60";
    sha256 = "049m0p4wbsl822iym8xmc938d4k90iw7wjdzcxfyy8d27hv9mp45";
  };

  vendorSha256 = "077s13pcql5w2m6wzls1q06r7p501kazbwzxgfh6akwza15kb4is";

  goPackagePath = "github.com/juruen/rmapi";
  subPackages = [ "." ];
  modSha256 = "0w2qiafs5gkgv00yz16bx8yis6gnpxbgqliwrhj5k6z8yy9s7b17";

  meta = with lib; {
    description = "Go app that allows you to access your reMarkable tablet files through the Cloud API";
    homepage = https://github.com/juruen/rmapi;
    license = licenses.gpl3;
    maintainers = [ ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}