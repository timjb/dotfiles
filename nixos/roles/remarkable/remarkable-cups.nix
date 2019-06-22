{ stdenv, fetchFromGitHub, cups, rmapi }:

stdenv.mkDerivation rec {
  name = "remarkable-cups-${version}";
  version = "master-be5979";

  src = fetchFromGitHub {
    owner = "ofosos";
    repo = "scratch";
    rev = "883d89408557ee0fa22b56deb6348f756b78abf6";
    sha256 = "0lgamfzk23aa3szm27cxnx792k074nb3d6clq6f8j0y3drzjiggj";
  };

  nativeBuildInputs = [ cups ];

  installPhase = ''
    ppdc -I ${cups}/share/cups/ppdc $src/remarkable-cups/remarkable.drv
    mkdir -p $out/share/cups/model $out/lib/cups/backend
    cp $src/remarkable-cups/remarkable.sh $out/lib/cups/backend/remarkable
    substituteInPlace $out/lib/cups/backend/remarkable \
      --replace "/home/mark/gosrc/bin/rmapi" "${rmapi}/bin/rmapi"
    cp ppd/remarkable.ppd $out/share/cups/model
  '';
}