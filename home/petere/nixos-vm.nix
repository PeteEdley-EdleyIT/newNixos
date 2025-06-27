{ 
  imports = [ 
    ./home.nix 
    ../features/cli
    ../features/desktop
    ../common 
    ./dotfiles
  ]; 

  features = {
    cli = {
      fish.enable = true;
      fzf.enable = true;
      neofetch.enable = true;
    };
    desktop = {
      wayland.enable = true;
      hyprland.enable = true;
      fonts.enable =true;
    };

  };

  wayland.windowManager.hyprland = {
    settings = {
      device = [
        {
          name = "keyboard";
          kb_layout = "gb";
        }
        {
          name = "mouse";
          sensitivity = -0.5;
        }
      ];
    };
  };
}