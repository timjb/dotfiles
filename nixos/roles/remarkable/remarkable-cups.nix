{ stdenv, cups, coreutils, makeWrapper, rmapi }:

stdenv.mkDerivation rec {
  name = "remarkable-cups-${version}";
  version = "1.1";

  src = ./remarkable-cups;

  nativeBuildInputs = [ cups makeWrapper ];

  installPhase = ''
    ppdc -I ${cups}/share/cups/ppdc $src/remarkable.drv
    mkdir -p $out/share/cups/model $out/lib/cups/backend
    cp $src/remarkable.sh $out/lib/cups/backend/remarkable
    wrapProgram $out/lib/cups/backend/remarkable \
      --prefix PATH : ${coreutils}/bin:${rmapi}/bin
    cp ppd/remarkable.ppd $out/share/cups/model
  '';
}