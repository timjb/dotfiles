if test -n "$HOME" -a -z "$NIX_PATH"
  set -x NIX_LINK "$HOME/.nix-profile"

  # Set the default profile.
  if not [ -L "$NIX_LINK" ]
    echo "creating $NIX_LINK" >&2
    set _NIX_DEF_LINK /nix/var/nix/profiles/default
    /nix/store/cdybb3hbbxf6k84c165075y7vkv24vm2-coreutils-8.23/bin/ln -s "$_NIX_DEF_LINK" "$NIX_LINK"
  end

  add-to-path $NIX_LINK/bin $NIX_LINK/sbin

  # Subscribe the root user to the Nixpkgs channel by default.
  if [ ! -e $HOME/.nix-channels ]
    echo "http://nixos.org/channels/nixpkgs-unstable nixpkgs" > $HOME/.nix-channels
  end

  # Append ~/.nix-defexpr/channels/nixpkgs to $NIX_PATH so that
  # <nixpkgs> paths work when the user has fetched the Nixpkgs
  # channel.
  set -x NIX_PATH nixpkgs=$HOME/.nix-defexpr/channels/nixpkgs
end

