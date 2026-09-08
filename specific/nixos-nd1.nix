{config, pkgs, ...}: 

{
  networking.hostName = "nixos-nd1";
  
  environment.shellAliases = {
	  reboot = "pkill brave; su -c \"sleep 0.5 && efibootmgr -n 2 && reboot\"";
	  poweroff = "pkill brave; su -c \"sleep 0.5 && efibootmgr -n 2 && poweroff\"";
	  swap = "su -c \"efibootmgr -n 3 && reboot\"";
  };
}
