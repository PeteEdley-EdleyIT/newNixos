{
  config,
  pkgs,
  inputs,
  ...
}:{
  users.users.petere = {
    initialHashedPassword = "$y$j9T$Y1JofeS/5hyNU9Met6oRK.$WEOfM9O.drInBkwwkIfvHrbOHFzd2MYU1jZkuhTijO7";
    isNormalUser = true;
    description = "Peter Edley";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "flatpak"
      "audio"
      "video"
      "plugdev"
      "input"
      "kvm"
      "qemu-libvirtd"
    ];
    openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKnP3JhjeCt4TTmmYqOkLjPWXScrHwcFGENNhi8P6Tp1 petere@peter-laptop" ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.petere = 
    import ../../../home/petere/${config.networking.hostName}.nix;
}