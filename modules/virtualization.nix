{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  systemd.services.create-libvirt-default-net = {
    description = "Create libvirt default network";
    after = [ "libvirtd.service" "network-pre.target" ];
    wantedBy = [ "libvirtd.service" ];
    serviceConfig.Type = "oneshot";
    script = ''
      ${pkgs.libvirt}/bin/virsh net-define /nix/store/.../default.xml || true
      ${pkgs.libvirt}/bin/virsh net-start default || true
      ${pkgs.libvirt}/bin/virsh net-autostart default || true
    '';
  };

  virtualisation.libvirtd.enable = true;
  # virtualisation.libvirtd.qemuOvmf = true;  # для UEFI
  virtualisation.libvirtd.extraConfig = ''
    unix_sock_group = "libvirtd";
    unix_sock_rw_perms = "0770";
  '';

  virtualisation.docker.enable = true;
}
