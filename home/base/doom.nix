{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [inputs.nix-doom-emacs-unstraightened.hmModule];

  programs.doom-emacs = {
    enable = true;
    doomDir = ../configs/doom;
  };

  # Manually link the config folder to ~/.doom.d as well
  # Many Doom functions look for this specific folder by default
  home.file.".doom.d".source = ../configs/doom;
}
