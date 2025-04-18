{ ... }:
{
  config.programs.ssh = {
    addKeysToAgent = "yes";
    includes = [ "~/.orbstack/ssh/config" ];
    matchBlocks = {
      "*" = {
        extraOptions = {
          UseKeychain = "yes";
        };
      };
      "oskartimeweb" = {
        hostname = "45.132.50.203";
        user = "root";
        identityFile = "~/.ssh/id_rsa";
      };
      "yummynew" = {
        hostname = "94.241.141.207";
        user = "root";
        identityFile = "~/.ssh/id_ed25519";
      };
      "im1corp.github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };
      "git" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_rsa";
      };
      "tonlombard" = {
        hostname = "188.225.27.11";
        user = "root";
        identityFile = "~/.ssh/id_rsa";
      };
      "pepeton" = {
        hostname = "91.198.220.45";
        user = "root";
        identityFile = "~/.ssh/id_ed25519";
      };
      "timewebdb" = {
        hostname = "85.92.110.108";
        user = "root";
        identityFile = "~/.ssh/id_ed25519";
      };
      "aur.archlinux.org" = {
        user = "aur";
        identityFile = "~/.ssh/aur";
      };
      "yummyimages" = {
        hostname = "109.73.194.87";
        user = "root";
        identityFile = "~/.ssh/id_rsa";
      };

      "twebmysql" = {
        hostname = "147.45.148.191";
        user = "root";
        identityFile = "~/.ssh/id_rsa";
      };
      "gitea.catos.io" = {
        user = "git";
        identityFile = "~/.ssh/id_work";
        hostname = "gitea.catos.io";
      };
      "work" = {
        hostname = "45.128.204.251";
        user = "root";
        port = 666;
        identityFile = "~/.ssh/id_work";
      };
      "nixos-vitalik" = {
        hostname = "51.250.47.185";
        user = "root";
        identityFile = "~/.ssh/id_work";
      };
      "aksorcdn1" = {
        hostname = "94.241.140.211";
        user = "root";
        identityFile = "~/.ssh/id_rsa";
      };
      "aksorcdn2" = {
        hostname = "195.133.25.17";
        user = "root";
        identityFile = "~/.ssh/id_rsa";
      };
      "aksorcdn3" = {
        hostname = "194.87.86.223";
        user = "root";
        identityFile = "~/.ssh/id_rsa";
      };
      "aksorcdn4" = {
        hostname = "194.87.215.97";
        user = "root";
        identityFile = "~/.ssh/id_rsa";
      };
      "aksorcdn5" = {
        hostname = "83.147.245.43";
        user = "root";
        identityFile = "~/.ssh/id_rsa";
      };
    };
  };
}
