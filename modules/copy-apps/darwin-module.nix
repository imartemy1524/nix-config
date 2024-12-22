# SPDX-License-Identifier: MIT
# Copyright (c) 2021 Randy Eckenrode

{
  config,
  lib,
  pkgs,
  ...
}:

let
  appsSrc =
    if config ? home then
      "$newGenPath/home-path/Applications"
    else
      config.system.build.applications + /Applications;

  baseDir =
    if config ? home then
      "${config.home.homeDirectory}/Applications/Home Manager Apps"
    else
      "/Applications/Nix Apps";

  copyScript =
    lib.optionalString (config ? system) ''
      echo 'Setting up /Applications/Nix Apps...' >&2
    ''
    + ''
      appsSrc="${appsSrc}"
      if [ -d "$appsSrc" ]; then
        baseDir="${baseDir}"
        rsyncFlags=(
          --archive
          --checksum
          --chmod=-w
          --copy-unsafe-links
          --delete
          --no-group
          --no-owner
          --chown="$USER":admin
          --no-perms
          --executability
        )
        $DRY_RUN_CMD mkdir -p "$baseDir"
        $DRY_RUN_CMD ${lib.getBin pkgs.rsync}/bin/rsync \
          ''${VERBOSE_ARG:+-v} "''${rsyncFlags[@]}" "$appsSrc/" "$baseDir"
      fi
    '';

  isHomeManager = lib.hasAttr "hm" lib;
in
{
  disabledModules = [ "targets/darwin/linkapps.nix" ];

  config = lib.mkIf pkgs.stdenv.isDarwin (
    lib.optionalAttrs isHomeManager {
      home.activation.copyApplications = lib.hm.dag.entryAfter [ "writeBoundary" ] copyScript;
    }
    // lib.optionalAttrs (!isHomeManager) {
      system.activationScripts.applications.text = lib.mkForce copyScript;
    }
  );
}