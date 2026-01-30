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
    homebrew,
    home-manager,
    ...
  }: let
    system = "aarch64-darwin";
    username = "wojciech";
  in {
    darwinConfigurations = {
      mac-mini = nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = {inherit inputs self username;};
        modules = [
          ./hosts/mac-mini
          ./modules/darwin

          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs username;};
              backupFileExtension = "backup";
              users.${username} = import ./home;
            };
          }
          homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              user = username;
              autoMigrate = true;
            };
          }
        ];
      };

      mac-book = nix-darwin.lib.darwinSystem {
        specialArgs = {inherit inputs self username;};
        system = "aarch64-darwin";
        modules = [
          ./hosts/mac-book
          ./modules/darwin

          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs username;};
              backupFileExtension = "backup";
              users.${username} = import ./home;
            };
          }

          homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              user = username;
              autoMigrate = true;
            };
          }
        ];
      };
    };
  };
}
