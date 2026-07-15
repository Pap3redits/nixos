{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../shared/imports.nix
  ];
  /*
    programs.bash.interactiveShellInit = ''
      if ! [ "$TERM" = "dumb" ] && [ -z "$BASH_EXECUTION_STRING" ]; then
        exec nu
      fi
    '';
  */

  fileSystems."/mnt/second" = {
    device = "/dev/disk/by-uuid/255febbc-548f-4161-b05b-946b5844de48";
    fsType = "ext4";
    options = [
      
      "users"
      "nofail"
      "x-gvfs-show"
    ];
  };

  networking.hostName = "ira-domini"; # Define your hostname.

  hardware.amdgpu.opencl.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ 51820 1198 41641];
  # Or disable the firewall altogether.

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
