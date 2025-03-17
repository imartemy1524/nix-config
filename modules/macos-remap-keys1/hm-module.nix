{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services.macos-remap-keys1;
  keytables = import ./keytables.nix { inherit lib; };

  keyToHIDCode = table: key: keytables.${table}.${key};

  # Note: hidutil requires HIDKeyboardModifierMapping values to be in hexadecimal
  # format rather than decimal JSON. Using hex strings instead of numbers will
  # crash macOS.
  makeMapping =
    table: from: to:
    ''{ "HIDKeyboardModifierMappingSrc": ${keyToHIDCode table from}, "HIDKeyboardModifierMappingDst": ${keyToHIDCode table to} }'';

  makeMappingsList =
    table: mappings: lib.mapAttrsToList (from: to: makeMapping table from to) mappings;

  allMappings =
    (makeMappingsList "keyboard" (cfg.keyboard or { }))
    ++ (makeMappingsList "keypad" (cfg.keypad or { }));

  allMappingsString = lib.concatStringsSep ", " allMappings;
  propertyString = ''{ "UserKeyMapping": [ ${allMappingsString} ] }'';
in
{
  options.services.macos-remap-keys1 = {
    enable = lib.mkEnableOption "macOS key remapping service";

    keyboard = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = { };
      example = {
        Capslock = "Escape";
        SquareBracketOpen = "SquareBracketClose";
      };
      description = "Mapping of keyboard keys to remap";
    };

    keypad = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = { };
      example = {
        Enter = "Equal";
        Plus = "Minus";
      };
      description = "Mapping of keypad keys to remap";
    };
  };

  config = lib.mkIf cfg.enable {
    assertions = [
      {
        assertion = (cfg.enable -> pkgs.stdenv.hostPlatform.isDarwin);
        message = "Key remapping only supports macOS";
      }
    ];
    home.activation.macosRemapKeys = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      $DRY_RUN_CMD /usr/bin/hidutil property --set '${propertyString}' &> /dev/null
    '';
    launchd.agents.remap-keys = {
      enable = true;
      config = {
        Label = "org.nixos.remap-keys";
        ProgramArguments = [
          "/usr/bin/hidutil"
          "property"
          "--set"
          propertyString
        ];
        RunAtLoad = true;
      };
    };
  };
}
