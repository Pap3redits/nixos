{ config, pkgs, ... }:
{

  programs.bash = {

    enable = true;
    shellAliases = {
      # System
      nrs = "nh os switch";
      nixconfig = "sudo -E nvim /etc/nixos/";
      sr = "sudo reboot now";
      ssn = "sudo shutdown now";
      # File system
      ls = "eza -lh --group-directories-first --icons=auto";
      lsa = "ls -a:";
      lt = "eza --tree --level=2 --long --icons --git";
      lta = "lt -a";
      ff = "fzf --preview 'bat --style=numbers --color=always {}'";
      cd = "z";
      cp = "cpx";
    };
    bashrcExtra = ''
      PS1=$'\uf0a9 '
      PS1="\[\e]0;\w\a\]$PS1"
    '';
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

}
