{
  config,
  lib,
  pkgs,
  ...
}: {
  imports =
    [
      ./nix-daemon.nix
      ./managed-users.nix
      ./system-settings.nix
      ./version.nix
    ]
    ++ [./system-packages.nix];
}
