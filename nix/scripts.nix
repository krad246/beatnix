{
  perSystem = {
    self',
    config,
    lib,
    pkgs,
    ...
  }: {
    mission-control.scripts = {
      # Utils
      fmt = {
        category = "Dev Tools";
        description = "Format the source tree";
        exec = "${lib.getExe config.treefmt.build.wrapper}";
      };

      clean = {
        category = "Utils";
        description = "Cleans any result produced by Nix or associated tools";
        exec = pkgs.writeShellScriptBin "clean" "rm -rf result* *.qcow2";
      };

      run-vm = {
        category = "Utils";
        description = "Executes a VM if output derivation contains one";
        exec = "exec ./result/bin/run-*-vm";
      };
    };
  };
}
