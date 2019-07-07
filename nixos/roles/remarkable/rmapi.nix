{ buildGoPackage, fetchFromGitHub, lib }:

buildGoPackage rec {
  name = "rmapi-${version}";
  version = "config-file-env-var-c01d07";

  src = fetchFromGitHub {
    owner = "timjb";
    repo = "rmapi";
    rev = "c01d070d2c8fd438c143d3af9a2ea52c2c952a45";
    sha256 = "0959gc284q5mm70yi0m7jd5pb1bb6hk47wija40nrqcz6gq4ll62";
  };

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