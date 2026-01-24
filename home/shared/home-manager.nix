{ inputs, ... }:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.wojciech = {
      imports = [
        ../modules
      ];

      home = {
        username = "wojciech";
        homeDirectory = "/Users/wojciech";
        stateVersion = "24.05";
      };
    };
  };
}
