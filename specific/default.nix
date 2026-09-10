{config, pkgs, ...}:

{
  imports = [
    ./${builtins.getEnv "HOSTNAME"}.nix
  ];
}
