{ config, pkgs, ... }:

let
  pangolinServerIP = "159.195.18.63";  # ← Your Pangolin VPS public IP

  excludeRules = pkgs.writeText "excludeTraffic.rules" ''
    table inet excludeTraffic {
      chain excludeOutgoing {
        type route hook output priority 0; policy accept;
        ip daddr ${pangolinServerIP} ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
      }
    }
  '';
in
{
  networking.nftables.enable = true;

  # Remove the declarative table — we'll manage it via systemd instead
  # (delete the networking.nftables.tables.excludeTraffic block you had before)

  # This service applies the rules AFTER Mullvad is up and running
  systemd.services.mullvad-exclude-traffic = {
    description = "Apply nftables exclusion for Pangolin after Mullvad connects";
    after = [ "mullvad-daemon.service" ];
    wants = [ "mullvad-daemon.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;

      # Delete any existing table first, then re-apply
      ExecStartPre = "${pkgs.bash}/bin/bash -c '${pkgs.nftables}/bin/nft delete table inet excludeTraffic 2>/dev/null || true'";
      ExecStart = "${pkgs.nftables}/bin/nft -f ${excludeRules}";
      ExecStop = "${pkgs.nftables}/bin/nft delete table inet excludeTraffic 2>/dev/null || true";
    };

    # Re-apply whenever Mullvad restarts/reconnects
    partOf = [ "mullvad-daemon.service" ];
    reloadIfChanged = true;
  };
}
