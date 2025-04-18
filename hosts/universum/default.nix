{
  pkgs,
  hm-modules,
  inputs,
  ...
}:
{
  users.users."im" = {
    name = "im";
    home = "/Users/im";
    description = "The main User of The System";
  };

  home-manager.users."im".imports = hm-modules ++ [ ./home.nix ];

  nixpkgs.config.allowUnfree = true;
  security.pam.services.sudo_local.touchIdAuth = true;

  nix.enable = true;
  programs.fish.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  fonts.packages = [
    pkgs.nerd-fonts.fira-code
    pkgs.iosevka
    pkgs.open-sans
  ];

  environment.systemPackages = [
    pkgs.spotify
    pkgs.vlc-bin
    pkgs.vscode

    pkgs.zoom-us
    pkgs.qbittorrent
    pkgs.brewCasks.maccy
    pkgs.brewCasks.obs

    pkgs.brewCasks.webstorm
    pkgs.jetbrains.pycharm-professional
    pkgs.jetbrains.idea-ultimate
    # pkgs.teams

    pkgs.iterm2
    pkgs.zed-editor

    # pkgs.brewCasks.orbstack
    pkgs.brewCasks.firefox
    pkgs.brewCasks.middleclick

    # pkgs.brewCasks.telegram-desktop

    pkgs.yandex-cloud
    pkgs.libavif
    pkgs.libwebp
    pkgs.imagemagick
    pkgs.speedtest-go
    pkgs.socat

    pkgs.aldente
    inputs.stellar.packages.${pkgs.system}.default

    pkgs.zstd

  ];

  homebrew = {
    enable = true;
    casks = [
      "discord"
      "google-chrome"
      "warp"
      "orbstack"
    ];
    brews = [
      "stellar-cli"
    ];
  };

  enableJDKs = [
    pkgs.jdk21
  ];

  nix = {
    channel.enable = false;
    gc.automatic = true;
    optimise.automatic = true;
    settings = {
      sandbox = "relaxed";
      use-xdg-base-directories = true;
      experimental-features = "nix-command flakes";
      trusted-users = [
        "staff"
        "root"
      ];
    };
    registry = {
      local.flake = inputs.self;
      nixpkgs.to = {
        owner = "NixOS";
        repo = "nixpkgs";
        rev = inputs.nixpkgs.rev;
        type = "github";
      };
    };
  };

  networking = {
    hostName = "universum";
    computerName = "Ivan's MacBook";
    localHostName = "universum";

    # extraHosts = [
    #   { ip = "127.0.0.1"; hostnames = [ "test.yummy-anime.ru" ]; }
    # ];
  };

  system.stateVersion = 5;
}
