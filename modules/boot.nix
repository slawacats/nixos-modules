{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelParams = [ "kvm.enable_virt_at_load=0" ];
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
}
