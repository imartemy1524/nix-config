{
  config,
  lib,
  pkgs,
  ...
}:

let
  isHomeManager = lib.hasAttr "hm" lib;

  javaDirectory =
    if isHomeManager then
      "${config.home.homeDirectory}/Library/Java/JavaVirtualMachines"
    else
      "/Library/Java/JavaVirtualMachines";

  linkScript =
    ''
      echo 'Setting up ${javaDirectory}...' >&2
      mkdir -p "${javaDirectory}"
      echo 'Removing existing Nix store symlinks...' >&2
      find ${javaDirectory} -type l -lname '/nix/store/*' -delete
    ''
    + lib.concatMapStrings (package: ''
      ln -sf "${package}"/*.jdk "${javaDirectory}/"
    '') config.enableJDKs;
in
{
  options.enableJDKs = lib.mkOption {
    description = "Enabled JDKs";
    type = lib.types.listOf lib.types.package;
    default = [ ];
  };

  config = lib.mkIf pkgs.stdenv.isDarwin (
    lib.optionalAttrs isHomeManager {
      home.activation.linkJDKs = lib.hm.dag.entryAfter [ "writeBoundary" ] linkScript;
    }
    // lib.optionalAttrs (!isHomeManager) {
      system.activationScripts.applications.text = lib.mkForce linkScript;
    }
  );
}