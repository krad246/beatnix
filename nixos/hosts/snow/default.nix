{pkgs, ...}: {
  imports = [
    ./boot.nix
    ./disko.nix
    ./hardware.nix
    ./system.nix
    ./users.nix
  ];
}
