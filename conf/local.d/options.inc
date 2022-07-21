{% if env.DNS_NAMESERVER %}
dns {
    nameserver = ["{= env.DNS_NAMESERVER =}:53:10"];
}
{% endif %}