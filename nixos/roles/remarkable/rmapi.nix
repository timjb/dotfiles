{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  name = "rmapi-${version}";
  version = "master-70a4fe";

  src = fetchFromGitHub {
    owner = "juruen";
    repo = "rmapi";
    rev = "70a4fef8b0ea6f87f17c3b0af2bb3b6bccaef1e1";
    sha256 = "082h597b4mqfnb567j85mpkffw6q3vfi8d9dla7qf7fhb0327vjg";
  };

  goPackagePath = "github.com/juruen/rmapi";
  subPackages = [ "." ];
  modSha256 = "0a22pfmn733hddayh5xi977gh3abzf70hck6s6gmvxq7i61plhpb";

  meta = with lib; {
    description = "Go app that allows you to access your reMarkable tablet files through the Cloud API";
    homepage = https://github.com/juruen/rmapi;
    license = licenses.gpl3;
    maintainers = [ ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}