{pkgs, ...}: {
  environment = {
    systemPackages = pkgs.callPackage ./package-list.nix {};
  };

  programs = {
    direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };

    git = {
      enable = true;
      lfs.enable = true;
      config = {
      };
    };

    less = {enable = true;};

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
    };

    zsh = {
      enable = true;
      enableLsColors = true;
      enableCompletion = true;
      vteIntegration = true;
      enableGlobalCompInit = true;
      enableBashCompletion = true;
      syntaxHighlighting.enable = true;
    };
  };
}
