{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Christian Schmidt";
        email = "pap3redits2@pm.me";
      };
      gpg.format = "ssh";
    };
    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMwsEcikYi824aeYfDPxRTVYoGryz1enDkafRO2AagWS paperedits2@pm.me";
      signByDefault = true;
    };

  };

}
