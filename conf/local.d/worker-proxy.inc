bind_socket = "*:11332";
upstream "local" {
  milter = no;
  self_scan = yes; # Enable self-scan
}
