{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      neovim
      gcc
      ripgrep
      fd
      unzip
      nixd
      alejandra
    ];

    sessionVariables.EDITOR = "nvim";

    file.".config/nvim" = {
      source = ../configs/nvim;
    };
  };
}
