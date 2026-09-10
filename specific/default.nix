{config, pkgs, ...}:

{
  imports = [
    ./${hostname}.nix
  ];
}
