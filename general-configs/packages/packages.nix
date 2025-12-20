{ config, lib, pkgs, inputs, ... }: {

# -------- SYSTEM --------

  environment.systemPackages = with pkgs; [
    # coisas úteis
    usbutils
    wget
    kdePackages.qtstyleplugin-kvantum
    gparted
    fastfetch
    gnome-disk-utility

    # non-free
    unrar
    
    # desenvolvimento
    pipenv
    python314
    rustc
    nodejs
    devspace
    sqlitebrowser
    javaPackages.compiler.openjdk25

    # coisas para WMs & DEs
    alacritty
    wl-clipboard
    swaybg
    hyprpaper
    waybar
    labwc
  ];

# -------- FLATPAK --------

  services.flatpak = {
    enable = true; # habilita a flatpak
    # repositórios flatpak
    remotes = [
      { 
        name = "flathub";
        location = "https://flathub.org/repo/flathub.flatpakrepo"; 
      }
      {
        name = "gnome-nightly"; 
        location = "https://nightly.gnome.org/gnome-nightly.flatpakrepo"; 
      } 
      {
        name = "elementaryos"; 
        location = "https://flatpak.elementary.io/repo.flatpakrepo"; 
      }  
      { 
        name = "PureOS"; 
        location = "https://store.puri.sm/repo/stable/pureos.flatpakrepo"; 
      }
    ];
    # aplicativos declarados
    packages = [
      { 
        appId = "app.zen_browser.zen"; 
        origin = "flathub"; 
      }
      { 
        appId = "org.vinegarhq.Sober";
        origin = "flathub";
      }
      {
        appId = "net.newpipe.NewPipe";
        origin = "flathub";
      }
      {
        appId = "org.raspberrypi.rpi-imager";
        origin = "flathub";
      }
      {
        appId = "com.bitwarden.desktop";
        origin = "flathub";
      }
    ];
    # update automatico
    update = {
      onActivation = true;
      auto = {
        enable = true;
        onCalendar = "weekly";
      };
    };
  };
}
