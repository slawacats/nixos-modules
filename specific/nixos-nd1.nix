{config, pkgs, lib, ...}: 

{
  networking.hostName = "nixos-nd1";
  
  environment.shellAliases = lib.mkForce {
	  reboot = "pkill brave; su -c \"sleep 0.5 && efibootmgr -n 2 && reboot\"";
	  poweroff = "pkill brave; su -c \"sleep 0.5 && efibootmgr -n 2 && poweroff\"";
	  swap = "su -c \"efibootmgr -n 3 && reboot\"";
  };

  systemd.user.services.netstatutil = {
    enable = true;
    description = "Internet Analytics";
    after = [ "network-online.target" "graphical-session.target" ];
    wants = [ "network-online.target"];
    requires = [ "network-online.target" ];
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "/home/nd1/.local/bin/netstatutil";
      Restart = "on-failure";
    };
  };

  services.ratbagd.enable = true;
}
