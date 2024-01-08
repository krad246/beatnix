_: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    crashDump.enable = false;
    hardwareScan = false;

    # EFI loader is gummiboot
    loader = {
      efi.canTouchEfiVariables = false;
      systemd-boot = {
        enable = true;
        editor = false;
        consoleMode = "max";
      };
    };
  };
}
