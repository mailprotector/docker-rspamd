bind_socket = "*:11334";
secure_ip = {= env.WEBUI_SECURE_IP|default("127.0.0.1/32", true) =};

{% if env.WEBUI_PASSWORD %}
password = "{= env.WEBUI_PASSWORD|pbkdf =}";
{% endif %}