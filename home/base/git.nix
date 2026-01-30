{pkgs, ...}: {
  programs = {
    git = {
      enable = true;

      settings = {
        user = {
          name = "Wojciech Chuchro";
          email = "wojciech.chuchro@icloud.com";
        };

        init.defaultBranch = "main";
        pull.rebase = false;
        push.autoSetupRemote = true;
        core.editor = "vim";
        credential.helper = "osxkeychain";

        alias = {
          st = "status";
          co = "checkout";
          br = "branch";
          ci = "commit";
          unstage = "reset HEAD --";
          lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        };

        # TODO: read about these options
        diff.algorithm = "histogram";
        rerere.enabled = true;
        color.ui = true;
      };
    };

    # TODO: read about these options
    delta = {
      enable = true;
      options = {
        navigate = true;
        light = false;
        side-by-side = true;
      };
    };
  };
}
