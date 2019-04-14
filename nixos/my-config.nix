{ lib, ... }:

{
  options = {
    my-config.userExtraGroups = lib.mkOption {
      type = with lib.types; listOf string;
      default = [];
    };
  };
}