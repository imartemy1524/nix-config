{ config, pkgs, ... }:
{
  imports = [
    ./helix.nix
  ];

  xdg.enable = true;
  services.macos-remap-keys = {
    enable = true;
    keyboard = {
      "Control" = "ForwardDelete";
      "Capslock" = "Fn";
      "Option" = "Control";
      "Command" = "Option";
      "Eisuu" = "Command";
      "Kana" = "Spacebar";
      "Fn" = "RightOption";
    };
  };
  programs = {
    fish.enable = true;
    ssh.enable = true;
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
      enableFishIntegration = false;
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
    mpv.enable = true;
    micro.enable = true;
    home-manager.enable = true;
  };

  home.packages = [
    pkgs.docker
    pkgs.btop

    pkgs.xonsh
    pkgs.nodejs_23

    pkgs.nixd
    pkgs.nixfmt-rfc-style
  ];

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
