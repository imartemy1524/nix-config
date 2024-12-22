{ config, lib, ... }:
let
  inherit (config.xdg)
    dataHome
    configHome
    cacheHome
    stateHome
    ;
in
{
  config = lib.mkIf config.xdg.enable {
    home.sessionVariables = {
      HISTFILE = "${stateHome}/bash/history";
      LESSHISTFILE = "${cacheHome}/less/history";
      TERMINFO = "${dataHome}/terminfo";

      DOCKER_CONFIG = "${configHome}/docker";

      IPYTHONDIR = "${configHome}/ipython";
      JUPYTER_CONFIG_DIR = "${configHome}/jupyter";
      MPLCONFIGDIR = "${configHome}/matplotlib";

      BUNDLE_USER_CONFIG = "${configHome}/bundle";
      BUNDLE_USER_CACHE = "${cacheHome}/bundle";
      BUNDLE_USER_PLUGIN = "${dataHome}/bundle";

      RUSTUP_HOME = "${dataHome}/rustup";
      CARGO_HOME = "${dataHome}/cargo";

      NPM_CONFIG_USERCONFIG = "${configHome}/npm/npmrc";
    };
    xdg.configFile."npm/npmrc" = {
      text = ''
        cache=${config.xdg.cacheHome}/npm
        init-module=${config.xdg.configHome}/npm/init.js
      '';
    };
  };
}
