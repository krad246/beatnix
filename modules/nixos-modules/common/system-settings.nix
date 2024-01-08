{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = with config.nixosModules; [fs-trim i18n minimal-docs nix openssh tcp-hardening tcp-optimizations zram];
}
