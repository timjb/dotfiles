pkgs:

let
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
    name = "azure-account";
    publisher = "ms-vscode";
    version = "0.11.2";
    sha256 = "01mhw6nv63wj1l2p7jfxim4v691xdf5cww8r82cwq0n3dhsvih1a";
  }
  {
    name = "better-toml";
    publisher = "bungcip";
    version = "0.3.2";
    sha256 = "08lhzhrn6p0xwi0hcyp6lj9bvpfj87vr99klzsiy8ji7621dzql3";
  }
  {
    name = "dendron";
    publisher = "dendron";
    version = "0.123.0";
    sha256 = "1w7nwnpj3k15fxygzqv0xy1p2n79vnhi1sh0iagnw7w5ixbzb73d";
  }
  {
    name = "dendron-markdown-shortcuts";
    publisher = "dendron";
    version = "0.12.1";
    sha256 = "0xnw44xwxy1fhq4wpqcwwzf2x9mvsi14clkky6vdvbig2kbycs1a";
  }
  {
    name = "dendron-paste-image";
    publisher = "dendron";
    version = "1.1.1";
    sha256 = "0qdby08pcjdjprpbr7p59fa81y58l3kwsln74qfgz0c18lqbqmaa";
  }
  {
    name = "vscode-firefox-debug";
    publisher = "firefox-devtools";
    version = "2.9.8";
    sha256 = "1jg49qcysyh02ca0x4f8p2ampc4prj91yjnda3hlg02gc7mzj8ih";
  }
  {
    name = "fish";
    publisher = "TeddyDD";
    version = "0.0.4";
    sha256 = "1wzixi5wx3dj94174fybis0180jk9mw3c7xyr0sa1awqp4xdwkx6";
  }
  {
    name = "haskell";
    publisher = "haskell";
    version = "2.2.4";
    sha256 = "1qsvfb2a2k48gndda92w91z9acis43a151cdwmkmb8qprl311768";
  }
  {
    name = "gitlens";
    publisher = "eamodio";
    version = "2023.7.1805";
    sha256 = "0qjwg52y5ndpdzpnhi1syj2gk73spl7i2il5isgj6ydy7bs04zij";
  }
  {
    name = "Go";
    publisher = "golang";
    version = "0.37.0";
    sha256 = "08xifpvpdbnm3rxzczf30qy9c80b8hxfdjas92n27j384mw7zh22";
  }
  {
    name = "language-haskell";
    publisher = "justusadam";
    version = "3.6.0";
    sha256 = "115y86w6n2bi33g1xh6ipz92jz5797d3d00mr4k8dv5fz76d35dd";
  }
  {
    name = "latex-workshop";
    publisher = "James-Yu";
    version = "9.2.1";
    sha256 = "04jx15zmsi9aaw7rjw7lsnilrrkcch075gldqw9n4rvs3v8akqnk";
  }
  {
    name = "nix";
    publisher = "bbenoist";
    version = "1.0.1";
    sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
  }
  {
    name = "prettier-vscode";
    publisher = "esbenp";
    version = "9.10.3";
    sha256 = "0hvxwcaihkls4azkcj0674sgnn32iiw0pm0brmdinqag95696fq5";
  }
  {
    name = "python";
    publisher = "ms-python";
    version = "2022.21.13601008";
    sha256 = "1a7zfw6gigi27mhca1vmhh94l7zdvgxmg8lgmwh9l24igc0kmhqc";
  }
  {
    name = "rust";
    publisher = "rust-lang";
    version = "0.7.9";
    sha256 = "0asmr7c9jmik1047n359s9zmv2m7d0i8sixki4p02z7qzyrpxrfs";
  }
  {
    name = "svelte-vscode";
    publisher = "svelte";
    version = "106.4.1";
    sha256 = "1sraybjib6yrmsyxwk1n4f2j96m98j694k96ni3gs04ysz738cgm";
  }
  {
    name = "terraform";
    publisher = "hashicorp";
    version = "2.25.2";
    sha256 = "13chmw23fmgxv5z5qcxhxg8gf1b94g3pi3lp25l0chc8i3x6df3x";
  }
  {
    name = "vim";
    publisher = "vscodevim";
    version = "1.24.3";
    sha256 = "02alixryryak80lmn4mxxf43izci5fk3pf3pcwy52nbd3d2fiwz1";
  }
  {
    name = "vscode-arduino";
    publisher = "vsciot-vscode";
    version = "0.4.12";
    sha256 = "0i1kv8xdzzrrrrp9qv9sf4ydjr4k31hg9r9iyy3df63j4pvi6ni3";
  }
  {
    name = "vscode-eslint";
    publisher = "dbaeumer";
    version = "2.3.0";
    sha256 = "0b8rb05alb1xprbflvyp4i58hzy3ycvxrkdshd4vsd60ffaf07vx";
  }
  {
    name = "vscode-java-pack";
    publisher = "vscjava";
    version = "0.25.2022112900";
    sha256 = "0rgassar7f3xbdq23i5vr69pqi72fmcc61y93wgk5pnxrms1k3qd";
  }
  {
    name = "vscode-jest";
    publisher = "orta";
    version = "5.1.0";
    sha256 = "08b3jrwm3rrwkkq8ybiak6r9d7hp4whjnpdji72jy0344xid1nqa";
  }
  {
    name = "vscode-azurefunctions";
    publisher = "ms-azuretools";
    version = "1.9.0";
    sha256 = "0nmym6bbb9pxvkpcwi22gq878s03smy43xi9s6r1s8ihdmpxwq0q";
  }
  {
    name = "vscode-node-azure-pack";
    publisher = "ms-vscode";
    version = "1.1.1";
    sha256 = "02vg846nzg5nz2sva3rmkz4dqi9s72cc9643klai6chq13d9xxbj";
  }
  {
    name = "vscode-wasm";
    publisher = "dtsvet";
    version = "1.4.0";
    sha256 = "0p3a8brwpbg3fkhpq257jp7dnydk5b89ramb5yqpdp4yaksvfry5";
  }
  {
    name = "vscode-yaml";
    publisher = "redhat";
    version = "1.13.0";
    sha256 = "07ayfsxsgb4i2bp3g1wf4chgx09468gy4gj70nlj1198fld1amgh";
  }
]