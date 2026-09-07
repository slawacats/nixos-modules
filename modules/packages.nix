{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.npm.enable = true;
  programs.steam.enable = true;
  services.flatpak.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "qtwebengine-5.15.19"
  ];
  
  environment.systemPackages = with pkgs; [
  
    # --------- kdePackages
    kdePackages.dolphin
    kdePackages.ark
    kdePackages.kolourpaint
    kdePackages.kdeconnect-kde
    kdePackages.kdenlive

    # --------- TextEditors
    obsidian
    vim
    neovim
    helix

    # --------- Utils
    fastfetch
    htop
    gparted
    wine64
    ntfs3g
    exfatprogs
    cava
    eza
    rar
    unrar
    zip
    unzip
    bat
    stow
    fzf
    mission-center
    crosspipe
    
    # --------- Screenshoters
    hyprshot
    flameshot
    grim
    slurp

    # --------- Hyprland
    waybar
    wofi
    hyprpaper
    hyprpolkitagent
    hyprlock
    hypridle
    nwg-drawer
    wlogout
    swaynotificationcenter
    xdg-desktop-portal-hyprland

    # --------- Programms
    discord
    vscode
    pgadmin4
    bottles
    yandex-music
    spotify
    alacritty
    tmux
    telegram-desktop
    onlyoffice-desktopeditors
    libreoffice
    # teamspeak6-client
    element-desktop
    obs-studio
    virt-manager
    qemu 
    brave
    drawing
    # figma-linux
    pipes-rs
    krita

    # --------- Dev
    rustc
    cargo
    # rustup
    rust-analyzer
    cargo-dist
    zig
    gcc
    clang
    gnumake
    git
    jdk21
    maven
    # pkgsCross.mingwW64.stdenv.cc
    figlet
    python314
    python314Packages.pip
    python314Packages.virtualenv
    python314Packages.numpy
    hyperfine
    binutils
    go
    lua5_5
    lua-language-server

    # --------- Viewers
    vlc
    sxiv
    loupe

    # --------- Others
    wget
    curl
    jq
    pavucontrol
    networkmanager
    libnotify
    pipewire
    postgresql
    clinfo
    vulkan-tools
    cmatrix

    # --------- Testing
    libsecret
    cinny-desktop
    cool-retro-term
    superfile
    mapscii
    genact
    wtfutil
    clock-rs
    cpu-x
    arp-scan
    nmap
    easyeffects
    inkscape
    firefox
    qutebrowser
    jetbrains-mono
    lmms
    glow
    element-desktop
    vesktop
    printrun
    litemdview
    orca-slicer
    drawio
    # repath-studio
    # graphite
    slint-lsp
    # vivaldi
    lm_sensors
    stress-ng
    chess-tui
    gambit-chess
    uchess
    stockfish
    gnuchess
    efibootmgr
    blender
    kicad
  ] ++ (with pkgs-unstable; [
    amnezia-vpn
    # graphite
  ]);
}
