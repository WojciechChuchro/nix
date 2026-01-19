{
  description = "Wojciech's Darwin System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      ...
    }:
    {
      darwinConfigurations."Wojciechs-Mac-mini" = nix-darwin.lib.darwinSystem {
        # This passes 'inputs' and 'self' to all your modules automatically
        specialArgs = { inherit inputs self; };
        modules = [
          ./modules/shared
          ./hosts/mac-mini
        ];
      };
    };
}
