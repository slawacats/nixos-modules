{config, pkgs, ...}:

{
  home.username = "nd1";
  home.homeDirectory = "/home/nd1";

  home.packages = with pkgs; [
    ncmpcpp
    mpc
    euphonica

    # (rust-bin.stable.latest.default.override {
    #   extensions = [ "rust-src" ];
    #   targets = [ "x86_64-unknown-linux-musl" ];
    # })
  ];

  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    extraConfig = ''
      audio_output {
        type    "pipewire"
        name    "PipeWire Sound Server"
      }
      auto_update "yes"
    '';
  };

  programs.ncmpcpp = {
    enable = true;
    settings = {
      mpd_host = "127.0.0.1";
      mpd_port = "6600";
    };
  };

  programs.git = {
    enable = true;
    settings.user.name  = "slawacats";
    settings.user.email = "slawacats@gmail.com";
    settings = {
      alias = {
        tree = "log --oneline --graph --decorate --all";
      };
    };
  };

  home.sessionVariables = {
    PATH = "$HOME/go/bin:$PATH";
  };

  home.stateVersion = "25.11";
}
