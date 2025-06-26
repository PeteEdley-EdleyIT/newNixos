{
  config,
  lib,
  pkgs,
  ...
} :
with lib; let
  cfg = config.features.cli.fish;
  in {
    options.features.cli.fish.enable = mkEnableOption "enable extended fish configuretion";

    config = mkIf cfg.enable {
      programs.fish = {
        enable =true;
        loginShellInit = ''
        set -x NIX_PATH nixpkgs=channel:nixos-unstable
        set -x NIX_LOG info
        set -x TERMINAL kitty

        if test (tty) = "/dev/tty1"
          exec Hyprland &> /dev/null
        end
        '';
        shellAbbrs = {
          ".." = "cd ..";
          "..." = "cd ../..";
          ls = "eza";
          grep = "rg";
          ps = "procs";
        };  
      };
    };
  }