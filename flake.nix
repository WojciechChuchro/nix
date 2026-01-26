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
    nixpkgs,
    ...
  }: {
    darwinConfigurations = {
      # darwin-rebuild switch --flake .#mac-mini
      mac-mini = nix-darwin.lib.darwinSystem {
        # This passes 'inputs' and 'self' to all your modules automatically
        system = "aarch64-darwin";
        specialArgs = {inherit inputs self;};
        modules = [
          ./home/shared
          ./hosts/mac-mini
        ];
      };
      mac-book = nix-darwin.lib.darwinSystem {
        # This passes 'inputs' and 'self' to all your modules automatically
        specialArgs = {inherit inputs self;};
        modules = [
          ./home/shared
          ./hosts/mac-book
        ];
      };
    };
  };
}
