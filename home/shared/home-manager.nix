{inputs, ...}: {
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
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
