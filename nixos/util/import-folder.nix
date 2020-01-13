path:
  if builtins.pathExists path then
    let
      pathContents = builtins.attrNames (builtins.readDir path);
      toFullPath = p: path + ("/" + p);
      isImportable = p: builtins.match ".*\\.nix" p != null || builtins.pathExists ((toFullPath p) + "/default.nix");
    in
      map toFullPath (builtins.filter isImportable pathContents)
  else
    []