{ pkgs, hm-modules, ... }:
{
  users.users."im" = {
    name = "im";
    home = "/Users/im";
    description = "The main User of The System";
  };

  home-manager.users."im".imports = hm-modules ++ [ ./home.nix ];

  nixpkgs.config.allowUnfree = true;

  services.nix-daemon.enable = true;
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

    pkgs.zoom-us
    pkgs.qbittorrent
    pkgs.brewCasks.maccy

    pkgs.brewCasks.webstorm
    pkgs.jetbrains.pycharm-professional
    pkgs.iterm2
    pkgs.zed-editor
    pkgs.micro

    # pkgs.kotatogram-desktop

    pkgs.brewCasks.orbstack
    pkgs.brewCasks.firefox
    pkgs.docker
    pkgs.kotatogram-desktop
    pkgs.mpv

    pkgs.nodejs_23
    pkgs.xonsh

    pkgs.nixd
    pkgs.nixfmt-rfc-style

    pkgs.yandex-cloud
    pkgs.btop
    pkgs.libavif
    pkgs.imagemagick
    pkgs.speedtest-go

    pkgs.zstd
  ];

  homebrew = {
    enable = true;
    casks = [
      "discord"
      "google-chrome"
      "warp"
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
  };

  networking = {
    hostName = "universum";
    computerName = "Ivan's MacBook";
    localHostName = "universum";
  };

  system.stateVersion = 4;
}
