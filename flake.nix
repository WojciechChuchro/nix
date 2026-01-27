{
  description = "My flake configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    nix-doom-emacs-unstraightened.url = "github:marienz/nix-doom-emacs-unstraightened";
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    home-manager,
    ...
  }: let
    system = "aarch64-darwin";
    username = "paxters";
  in {
    darwinConfigurations = {
      # darwin-rebuild switch --flake .#mac-mini
      mac-mini = nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = {inherit inputs self;};
        modules = [
          ./hosts/mac-mini
          ./modules/darwin
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${username} = import ./home;
            };
          }
        ];
      };

      # TODO:
      mac-book = nix-darwin.lib.darwinSystem {
        specialArgs = {inherit inputs self;};
        modules = [
          ./home/shared
          ./hosts/mac-book
        ];
      };
    };
  };
}
