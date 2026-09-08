{config, pkgs, ...}: 

{
  environment.shellAliases = {
	  reboot = "pkill brave; sleep 0.5 && reboot";
	  poweroff = "pkill brave; sleep 0.5 && poweroff";
  };
}
