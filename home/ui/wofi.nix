{ config, pkgs, ... }:
{

  programs.wofi = {
    enable = true;
    style = ''
        window {
        margin: 0px;
        border: 1px solid #d3c6aa;
        border-radius: 10px;
        background-color: #2d353b;
      }

      #text {
        margin: 5px;
        color: #d3c6aa
      }

      #entry:selected {
        color: #dbbc7f;
        background-color: #2d353b;
        border: none;
      }

      #input {
        margin: 5px;
        border: none;
        color:
      }
    '';
  };

}
