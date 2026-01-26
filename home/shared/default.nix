{pkgs, ...}: {
  imports = [./home-manager.nix];

  environment.systemPackages = with pkgs; [
    vim
    statix
    deadnix
    git
    htop
  ];

  nix.settings.experimental-features = "nix-command flakes";
  programs.zsh.enable = true;
}
