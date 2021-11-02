bind_socket = "*:11334";
secure_ip = "0.0.0.0/0";

{% if env.PASSWORD %}
password = "{= env.PASSWORD|pbkdf =}";
{% endif %}