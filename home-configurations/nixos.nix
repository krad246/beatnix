{
  pkgs,
  ezModules,
  osConfig,
  ...
}: {
  imports = [
    ezModules.nvim
    ezModules.zsh
  ];

  home = {
    username = osConfig.users.users.nixos.name or "nixos";
    stateVersion = "23.11";
    homeDirectory =
      osConfig.users.users.nixos.home
      or (
        if pkgs.stdenv.isDarwin
        then "/Users/nixos"
        else "/home/nixos"
      );
  };
}
