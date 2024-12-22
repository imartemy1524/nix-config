{
  lib,
  options,
  inputs,
  ...
}:
{
  config = lib.optionalAttrs (lib.hasAttr "home-manager" options) {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "bak";
      extraSpecialArgs = inputs;
    };
  };
}
