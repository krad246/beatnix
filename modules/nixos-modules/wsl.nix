{lib, ...}: {
  wsl = {
    enable = true; # BUG: Turns out disabling this removes bash (?!)
    wslConf.automount = {
      enabled = true;
      mountFsTab = true;
      root = "/mnt";
    };

    startMenuLaunchers = true;
    interop.register = true; # Windows binfmt compatibility.
    nativeSystemd = true;
  };

  # It might as well be...
  # Disable nonsensical services for it...
  boot.isContainer = true;
  systemd.services = {
    "serial-getty@ttyS0".enable = false;
    "serial-getty@hvc0".enable = false;
    "getty@tty1".enable = false;
    "autovt@".enable = false;
    firewall.enable = false;
    systemd-resolved.enable = false;
    systemd-udevd.enable = false;
  };

  # Doesn't make sense because we don't have a console.
  systemd.enableEmergencyMode = false;
}
