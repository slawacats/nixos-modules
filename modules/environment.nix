{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  environment.localBinInPath = true;
  environment.shellAliases = {
    s = "sudo";
	  ls = "eza --color=always --icons=auto";
	  ll = "eza -l --color=always --icons=auto";
	  la = "eza -la --color=always --icons=auto";
	  lt = "eza --tree --color=always --icons=auto";
	  wttr = "curl wttr.in";
	  # h = "hyprland";
	  # sh = "start-hyprland";
	  f = "fastfetch";
	  cr = "cargo run";
	  crr = "cargo run --release";
	  cb = "cargo build";
	  cbr = "cargo build --release";
	  t = "tmux new-session -A -D -s main";
	  nr-switch = "sudo nixos-rebuild switch --flake /etc/nixos";
	  nr-boot = "sudo nixos-rebuild boot --flake /etc/nixos";
	  ncg = "sudo nix-collect-garbage -d";
	  nfu = "sudo nix flake update --flake /etc/nixos";
	  nce = "sudo hx /etc/nixos/configuration.nix --config ~/.config/helix/config.toml";
	  hce = "sudo hx /etc/nixos/home.nix --config ~/.config/helix/config.toml";
	  fce = "sudo hx /etc/nixos/flake.nix --config ~/.config/helix/config.toml";
	  ce = "sudo hx --config ~/.config/helix/config.toml";
	  ns = "nix-shell";
	  c = "clear";
	  cls-alpha-main = "ssh main@clorine.ru";
	  cls-alpha-nd1 = "ssh nd1@clorine.ru";
	  cls-beta-main = "ssh main@10.34.10.94";
	  # reboot = "pkill brave; sleep 0.5 && reboot";
	  # poweroff = "pkill brave; sleep 0.5 && poweroff";
	  timer = "bettertimer";
	  power = "upower -b | grep %";
	  reboot = "pkill brave; su -c \"sleep 0.5 && efibootmgr -n 2 && reboot\"";
	  poweroff = "pkill brave; su -c \"sleep 0.5 && efibootmgr -n 2 && poweroff\"";
	  swap = "su -c \"efibootmgr -n 3 && reboot\"";
  };
  # Переменная окружения, которая может помочь некоторым X11-приложениям
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Подсказка для Electron-приложений использовать Wayland
  };
}
