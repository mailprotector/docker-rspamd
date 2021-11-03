dns {
    nameserver = ["{= env.DNS_NAMESERVER|default(localhost, true) =}:53:10"];
}