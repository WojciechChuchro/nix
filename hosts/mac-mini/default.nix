{ self, ... }:
{
  nix.enable = false;
  system = {
    primaryUser = "wojciech";
    configurationRevision = self.rev or self.dirtyRev or null;
    stateVersion = 6;

    defaults = {
      dock = {
        autohide = true;
        mru-spaces = false;
      };
      finder = {
        ShowPathbar = true;
        AppleShowAllExtensions = true;
        CreateDesktop = false;
        FXPreferredViewStyle = "Flwv";
      };
      screencapture.location = "~/Pictures/screenshots";
      screensaver.askForPasswordDelay = 10;
    };
  };

  users.users.wojciech = {
    name = "wojciech";
    home = "/Users/wojciech"; # optional, nix-darwin usually handles this
  };
}
