dns {
    nameserver = ["{= env.RSPAMD_DNS_NAMESERVER|default(localhost, true) =}:53:10"];
}