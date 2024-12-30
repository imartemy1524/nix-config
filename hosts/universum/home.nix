{ config, ... }:
{
  imports = [
    ./anime4k.nix
    ./helix.nix
  ];

  xdg.enable = true;
  programs = {
    fish.enable = true;
    git = {
      enable = true;
      userEmail = "imartemy1524@gmail.com";
      userName = "imartemy1524";
      extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
      };
      delta = {
        enable = true;
        options = {
          side-by-side = true;
          line-numbers = true;
        };
      };
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
    };

    bat = {
      enable = true;
      config.theme = "TwoDark";
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    lsd = {
      enable = true;
      enableAliases = true;
    };

    mpv = {
      enable = true;
    };

    home-manager.enable = true;
  };

  home = {
    sessionVariables = {
      EDITOR = "hx";

      GHCUP_USE_XDG_DIRS = "true";
      CABAL_CONFIG = "${config.xdg.configHome}/cabal/config";
      CABAL_DIR = "${config.xdg.dataHome}/cabal";

      PSQL_HISTORY = "${config.xdg.dataHome}/psql_history";
      GRADLE_USER_HOME = "${config.xdg.dataHome}/gradle";
      ANDROID_USER_HOME = "${config.xdg.dataHome}/android";
      GOPATH = "${config.xdg.dataHome}/go";
    };
  };

  programs.fish.userPaths = [
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.homeDirectory}/Library/Python/3.9/bin"
    "${config.home.homeDirectory}/.local/share/cargo/bin"
    "/opt/homebrew/bin"
  ];

  home.stateVersion = "23.11";
}
