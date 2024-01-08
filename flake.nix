{
  nixConfig = {};
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-23.11";
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };    

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    systems.url = "github:nix-systems/default";
    flake-utils = {
      url = "github:zimbatm/flake-utils";
      inputs.systems.follows = "systems";
    };

    ez-configs = {
      url = "github:ehllie/ez-configs";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };
  };

  outputs = inputs @ {
    nixpkgs,
    ez-configs,
    flake-parts,
    flake-utils,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports =
        [
          ez-configs.flakeModule
        ]
        ++ [./modules];

      systems = flake-utils.lib.defaultSystems;
      flake = {
      };

      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: {
      };

      ezConfigs = {
        root = ./.;
        globalArgs = {inherit inputs;};

	darwin.modulesDirectory = ./modules/darwin-modules;
        nixos.modulesDirectory = ./modules/nixos-modules;
      };
    };
}
