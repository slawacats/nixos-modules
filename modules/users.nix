{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  users.users.nd1 = {
    isNormalUser = true;
    description = "nd1";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "kvm" "video" "pipewire" "dialout" "docker" ];
    packages = with pkgs; [];
    linger = true;
  };
}
