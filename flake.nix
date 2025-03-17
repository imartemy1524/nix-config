{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flakelight = {
      url = "github:nix-community/flakelight";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flakelight-darwin = {
      url = "github:cmacrae/flakelight-darwin";
      inputs.flakelight.follows = "flakelight";
    };
    brew-nix = {
      url = "github:BatteredBunny/brew-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-darwin.follows = "flakelight-darwin/nix-darwin";
      inputs.brew-api.follows = "brew-api";
    };
    brew-api = {
      url = "github:BatteredBunny/brew-api";
      flake = false;
    };
  };
  outputs =
    { flakelight, flakelight-darwin, ... }@inputs:
    flakelight ./. {
      imports = [ flakelight-darwin.flakelightModules.default ];
      darwinConfigurations.universum = {
        system = "aarch64-darwin";
        modules = [
          inputs.home-manager.darwinModules.home-manager
          ./hosts/universum
          ./modules/home-manager/module.nix
          ./modules/copy-apps/darwin-module.nix
          ./modules/macos-jdk/darwin-module.nix
          { config.nixpkgs.overlays = [ inputs.brew-nix.overlays.default ]; }
        ];
        specialArgs = {
          inherit inputs;
          hm-modules = [
            ./modules/macos-remap-keys1/hm-module.nix
            ./modules/fish/hm-module.nix
            ./modules/ssh-config/hm-module.nix
          ];
        };
      };
    };
}
