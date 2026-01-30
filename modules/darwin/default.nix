{
  pkgs,
  username,
  ...
}: {
  imports = [../base ./homebrew.nix ./configuration.nix];
  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };
}
