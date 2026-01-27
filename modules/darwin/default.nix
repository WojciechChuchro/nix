{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vim
    statix
    deadnix
    git
    htop
  ];

  programs.zsh.enable = true;
}
