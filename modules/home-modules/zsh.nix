{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableVteIntegration = true;
    autocd = true;
    history = {
      path = "$HOME/.cache/zsh/history";
      expireDuplicatesFirst = true;
      extended = true;
    };

    historySubstringSearch.enable = true;

    plugins = [];
    syntaxHighlighting = {
      enable = true;
    };
  };
}
