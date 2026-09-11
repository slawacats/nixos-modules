{ pkgs, ... }:

let
  warthunder = pkgs.writeShellScriptBin "warthunder" ''
    exec ${pkgs.buildFHSEnv {
      name = "warthunder-env";
      targetPkgs = pkgs: (with pkgs; [
        glibc
        glib
        libglvnd
        vulkan-loader
        gtk3
        gtk4
        libx11
        libxcursor
        libxrandr
        libpulseaudio
        alsa-lib
        udev
        wrapGAppsHook3
      ]);
      extraBindMounts = [ "/run/wrappers" ];
      runScript = "steam-run $HOME/extra/Games/WarThunder/launcher";
    }}/bin/warthunder-env
  '';
in {
  environment.systemPackages = [ warthunder ];
}
