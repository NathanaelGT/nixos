{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    dufs
  ];

  services.vnstat.enable = true;

  services.tailscale.enable = true;

  networking = {
    nftables.enable = true;

    networkmanager.enable = true;

    nameservers = [
      "1.1.1.2"
      "1.0.0.2"
      "2606:4700:4700::1112"
      "2606:4700:4700::1002"
    ];

    firewall = {
      checkReversePath = "loose";

      trustedInterfaces = [ "tailscale0" ];
    };
  };

  boot.kernel.sysctl = {
    "net.core.default_qdisc" = "fq";
    "net.core.rmem_max" = 16777216;
    "net.core.wmem_max" = 16777216;
    "net.ipv4.tcp_rmem" = "4096 87380 16777216";
    "net.ipv4.tcp_wmem" = "4096 65536 16777216";
    "net.ipv4.tcp_congestion_control" = "bbr";

    "net.ipv4.tcp_ecn" = 1;
    "net.ipv4.tcp_fastopen" = 3;
    "net.ipv4.tcp_mtu_probing" = 1;
    "net.ipv4.tcp_slow_start_after_idle" = 0;

    "net.ipv4.tcp_keepalive_intvl" = 10;
    "net.ipv4.tcp_keepalive_probes" = 6;
    "net.ipv4.tcp_keepalive_time" = 60;

    "net.ipv4.conf.all.rp_filter" = 1;
    "net.ipv4.conf.default.rp_filter" = 1;
    "net.ipv4.tcp_syncookies" = 1;

    "net.ipv6.flowlabel_consistency" = 1;

    "net.ipv6.conf.all.accept_ra" = 2;
    "net.ipv6.conf.all.accept_ra_defrtr" = 1;
    "net.ipv6.conf.default.accept_ra" = 2;

    "net.ipv6.neigh.default.gc_thresh1" = 128;
    "net.ipv6.neigh.default.gc_thresh2" = 512;
    "net.ipv6.neigh.default.gc_thresh3" = 1024;

    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;

    "net.ipv6.conf.all.use_tempaddr" = 2;
    "net.ipv6.conf.default.use_tempaddr" = lib.mkForce 2;
  };

  systemd.services = {
    NetworkManager-wait-online.enable = false;
    systemd-user-sessions.after = lib.mkForce [ "basic.target" ];
  };

  services.cloudflare-warp.enable = true;
}
