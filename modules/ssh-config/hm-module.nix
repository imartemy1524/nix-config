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
      "yummy" = {
        hostname = "yummy";
        user = "root";
        identityFile = "~/.ssh/id_rsa";
      };
      "tonlotto" = {
        hostname = "81.200.153.75";
        user = "root";
        identityFile = "/proj/NodeJs/TonLotto/ssh.key";
      };
      "oskartimeweb" = {
        hostname = "45.132.50.203";
        user = "root";
      };
      "im1corp.github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_rsa";
      };
      "tonlombard" = {
        hostname = "188.225.27.11";
        user = "root";
        identityFile = "~/.ssh/id_rsa";
      };
      "videoservice-api" = {
        hostname = "80.90.185.22";
        user = "root";
        identityFile = "~/.ssh/id_rsa";
      };
      "torproxy" = {
        hostname = "212.22.70.113";
        user = "ubuntu";
        identityFile = "~/.ssh/id_rsa";
      };
      "hetzner-first" = {
        hostname = "95.216.24.149";
        user = "root";
        identityFile = "~/.ssh/id_rsa";
      };
      "videoplayer-api" = {
        hostname = "109.172.89.27";
        user = "root";
        identityFile = "~/.ssh/id_rsa";
      };
      "gitlab.yummyani.local" = {
        hostname = "46.174.53.218";
        user = "root";
        identityFile = "~/.ssh/id_yummy";
      };
      "tonclicker" = {
        hostname = "109.172.83.37";
        user = "root";
        identityFile = "~/.ssh/id_ed25519";
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
        hostname = "46.174.53.195";
        user = "root";
        identityFile = "~/.ssh/id_rsa";
      };
      "yummyproxy1" = {
        hostname = "46.174.48.54";
        user = "root";
        identityFile = "~/.ssh/id_rsa";
      };
      "yummyproxy2" = {
        hostname = "46.174.53.158";
        user = "root";
        identityFile = "~/.ssh/id_rsa";
      };
      "yummyproxy3" = {
        hostname = "46.174.53.62";
        user = "root";
        identityFile = "~/.ssh/id_rsa";
      };
      "yummyvpn" = {
        hostname = "94.131.113.12";
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
