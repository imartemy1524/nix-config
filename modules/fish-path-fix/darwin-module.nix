{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf (pkgs.stdenv.isDarwin && config.programs.fish.enable) {
    programs.fish.interactiveShellInit = ''
      set tmp_paths $fish_user_paths

      set -x fish_user_paths

      for p in (string split ":" $PATH)
        if string match -q '/nix/store/*/bin' $p
          set -a fish_user_paths $p
        end
      end

      for p in (string split " " $NIX_PROFILES)
        set -a fish_user_paths $p/bin
      end

      for p in $tmp_paths
        if not contains $p $fish_user_paths
          set -a fish_user_paths $p
        end
      end
    '';
  };
}