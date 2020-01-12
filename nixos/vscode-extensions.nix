let
  pkgs = import <nixpkgs-unstable> {};
  inherit (builtins) listToAttrs;
  inherit (pkgs.vscode-utils) extensionFromVscodeMarketplace;
  nameValuePair = name: value: { inherit name value; };
  mkVscodeExtensionsAttrset = vscode-exts:
    listToAttrs (map (ext: nameValuePair ext.name (extensionFromVscodeMarketplace ext)) vscode-exts);
in
mkVscodeExtensionsAttrset [
  {
    name = "agda";
    publisher = "j-mueller";
    version = "0.1.7";
    sha256 = "09ix3pjaagr6aakshc8ybbipgdscr8ymdrqc4xxs6927x552yjsb";
  }
  {
    name = "better-toml";
    publisher = "bungcip";
    version = "0.3.2";
    sha256 = "08lhzhrn6p0xwi0hcyp6lj9bvpfj87vr99klzsiy8ji7621dzql3";
  }
  {
    name = "bracket-pair-colorizer";
    publisher = "CoenraadS";
    version = "1.0.61";
    sha256 = "0r3bfp8kvhf9zpbiil7acx7zain26grk133f0r0syxqgml12i652";
  }
  {
    name = "fish";
    publisher = "TeddyDD";
    version = "0.0.4";
    sha256 = "1wzixi5wx3dj94174fybis0180jk9mw3c7xyr0sa1awqp4xdwkx6";
  }
  {
    name = "ghcide";
    publisher = "DigitalAssetHoldingsLLC";
    version = "0.0.1";
    sha256 = "0riqs95f9a9krbyrvh98z59z3nq39jh5jyfw9nc5kjmkzpwbr17w";
  }
  {
    name = "gitlens";
    publisher = "eamodio";
    version = "10.2.0";
    sha256 = "0qnq9lr4m0j0syaciyv0zbj8rwm45pshpkagpfbf4pqkscsf80nr";
  }
  {
    name = "go";
    publisher = "ms-vscode";
    version = "0.11.2";
    sha256 = "0z4a3fvylzhgnm8sgdwr2h22sf5bjrlc646pb4yimabr828f28vx";
  }
  {
    name = "language-haskell";
    publisher = "justusadam";
    version = "2.5.0";
    sha256 = "10jqj8qw5x6da9l8zhjbra3xcbrwb4cpwc3ygsy29mam5pd8g6b3";
  }
  {
    name = "latex-workshop";
    publisher = "James-Yu";
    version = "5.16.0";
    sha256 = "0cl4nl9yp54xfclm1gnkrig2i9npnf069ca91gcvy6jzbmdza6jj";
  }
  {
    name = "nix";
    publisher = "bbenoist";
    version = "1.0.1";
    sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
  }
  {
    name = "python";
    publisher = "ms-python";
    version = "2019.5.17517";
    sha256 = "1zhm243ycbdpgmyb7jsayvaj7wywpqzxymrpcfvaq9xckcz3ggrs";
  }
  {
    name = "rust";
    publisher = "rust-lang";
    version = "0.6.3";
    sha256 = "1r5q1iclr64wmgglsr3na3sv0fha5di8xyccv7xwcv5jf8w5rz5y";
  }
  {
    name = "vim";
    publisher = "vscodevim";
    version = "0.16.12";
    sha256 = "07j5mm6ghrdbvwnlw3qap7276n74l41ww28xljffkiq0qmbhnr8i";
  }
  {
    name = "vscode-arduino";
    publisher = "vsciot-vscode";
    version = "0.2.24";
    sha256 = "15bardalmrhvly2rr5qisb9b4ay0imxrrxmp97x79lli3msqq5gl";
  }
  {
    name = "vscode-java-pack";
    publisher = "vscjava";
    version = "0.7.1";
    sha256 = "0mrsxgaca0nlgs3j2hvpzx99qiak1dk9sz95bm6ihs0m8ba6zyd4";
  }
]