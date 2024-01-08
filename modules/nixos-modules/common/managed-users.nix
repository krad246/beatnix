{lib, ...}: let
  extraGroups = ["wheel"];
in
  lib.mkDefault {
    users.users.root = {
      inherit extraGroups;
    };

    users.users.nixos = {
      isNormalUser = true;
      uid = 1000;
      inherit extraGroups;
    };
  }
