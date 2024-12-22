{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) types concatMapStringsSep;
  cfg = config.programs.fish;
  withStarship = config.programs.starship.enable;
  fishAsyncPrompt = {
    name = "fish-async-propmt";
    src = pkgs.fishPlugins.async-prompt.src;
  };
  toQuotedPath = lib.flip lib.pipe [
    (lib.replaceStrings [ "'" ] [ "\\'" ])
    (path: "'${path}'")
  ];
  toFishList = concatMapStringsSep " " toQuotedPath;
in
{
  options.programs.fish = {
    asyncPrompt = lib.mkOption {
      description = "Enable async prompt";
      type = types.bool;
      default = true;
    };
    userPaths = lib.mkOption {
      description = "User paths to add to $fish_user_paths";
      type = types.listOf types.str;
      default = [ ];
    };
  };

  config.programs.fish = {
    plugins = lib.optional cfg.asyncPrompt fishAsyncPrompt;
    interactiveShellInit = ''
      fish_config theme choose "ayu Mirage"
      set fish_greeting

      set -a fish_user_paths ${toFishList cfg.userPaths}
    '';
    shellInitLast = lib.optionalString withStarship "${pkgs.starship}/bin/starship init fish | source";
  };
}