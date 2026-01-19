{ self, ... }:
{
  nix.enable = false;

  system = {
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

  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.cleanup = "zap"; # Removes apps not listed here

    taps = [
      "homebrew/cask"
      "homebrew/core"
    ];

    brews = [ "mas" ]; # Mac App Store CLI

    casks = [
      "obs"
      "discord"
    ];
  };
}
