{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      neovim
      gcc
      ripgrep
      fd
      unzip
    ];

    sessionVariables.EDITOR = "nvim";

    file.".config/nvim" = {
      source = ../configs/nvim;
      recursive = true;
    };
  };
}
