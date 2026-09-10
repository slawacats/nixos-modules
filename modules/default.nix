{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  imports = [
    ./boot.nix
    ./users.nix
    ./networking.nix
    ./audio.nix
    ./packages.nix
    ./graphical.nix
    ./locale.nix
    ./virtualization.nix
    ./environment.nix
  ];
}
