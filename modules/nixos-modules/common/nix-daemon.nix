{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [config.nixosModules.nix];

  nix = {
    package = pkgs.nixFlakes;
    checkConfig = true;
    settings = {
      auto-optimise-store = true;
      sandbox = true;
      experimental-features = ["nix-command flakes"];
    };

    gc.automatic = true;
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';
  };
}
