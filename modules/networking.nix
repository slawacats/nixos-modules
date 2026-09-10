{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.zerotierone = {
    enable = true;
    joinNetworks = [ "2873fd00f2260e96" ];
  };

  networking.firewall.enable = false;

  services.openssh.enable = true;
}
