{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  hardware.graphics.enable32Bit = true;
  
  services.displayManager.ly.enable = true;
  
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  # Настройка xdg-desktop-portal для работы в Hyprland
  xdg.portal = {
    enable = true;
    wlr.enable = true; # Если используется wlr протокол (часто в Hyprland)
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland # Порталы для Hyprland
      xdg-desktop-portal-gtk # Для GTK-приложений
    ];
    config.common.default = "*";
  };

  programs.sway = {
    enable = true;
    xwayland.enable = true;
  };

  programs.niri.enable = true;

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us,ru";
      variant = "";
      options = "grp:win_space_toggle";
    };
    windowManager.bspwm.enable = true;
    desktopManager.xfce.enable = true; 
    displayManager.startx.enable = true;
  };
}
