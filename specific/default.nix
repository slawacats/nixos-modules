{config, pkgs, ...}:

{
  imports = [
    ./${config.networking.hostName}.nix
  ];
}
