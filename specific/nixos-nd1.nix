{config, pkgs, lib, ...}: 

{
  networking.hostName = "nixos-nd1";
  
  environment.shellAliases = {
	  reboot = lib.mkForce "pkill brave; su -c \"sleep 0.5 && efibootmgr -n 2 && reboot\"";
	  poweroff = lib.mkForce "pkill brave; su -c \"sleep 0.5 && efibootmgr -n 2 && poweroff\"";
	  swap = lib.mkForce "su -c \"efibootmgr -n 3 && reboot\"";
  };

  systemd.user.services.netstatutil = {
    enable = true;
    description = "Internet Analytics";
    after = [ "network.target" "graphical-session.target" ];
    wants = [ "network.target"];
    requires = [ "network.target" ];
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "/home/nd1/.local/bin/netstatutil";
      Restart = "on-failure";
    };
  };

  services.ratbagd.enable = true;
}
