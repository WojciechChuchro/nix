{ pkgs, ... }:
{
  home = {
    file.".ideavimrc" = {
      source = ../configs/ideavimrc;
    };
  };
}
