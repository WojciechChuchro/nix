{ ... }:
{
  imports = [ ../../modules/darwin ];

  # Host-specific settings
  nixpkgs.hostPlatform = "aarch64-darwin";

  # You could also put user-specific info here if it changes per machine
  system.primaryUser = "wojciech";
}
