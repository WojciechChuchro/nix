{ pkgs, ... }:
{
  imports = [ ./home-manager.nix ];

  environment.systemPackages = with pkgs; [
    vim
    statix
    nil
    alejandra
    deadnix
    git
    htop
  ];

  # This makes flakes work on both Mac and Linux
  nix.settings.experimental-features = "nix-command flakes";

  # Set your shell for both systems
  programs.zsh.enable = true;

}
