# docker-rspamd
Dockerized rspamd on alpine linux

## Configuration
This configuration runs an rspamd controller (port 11334) and worker (port 11332) on with basic configurations. Additional configuration files can be mapped with a volume mapping to the `override.d` folder or pushed into the container via Dockerfile using this image as the base image. It is recommended to refer to the official [rspamd documentation](https://rspamd.com/doc/configuration/index.html) for detailed configuration options.

### Mapping override.d
mapping override.d folder in compose:
```
   volumes:
     - conf/override.d:/etc/rspamd/override.d
```

mapping override.d folder with docker run:
```bash
docker run -v $(pwd)/conf/override.d:/etc/rspamd/override.d mailprotector/rspamd:latest
```

## Environment Variables

| Parameter                         | Description                                                                   | Type    | Default Value |
| --------------------------------- | ----------------------------------------------------------------------------- | ------- | ------------- |
| RSPAMD_REJECT_SCORE               | max score for reject disposition                                              | integer | 12            |
| RSPAMD_QUARATNINE_SCORE           | max score for quarantine disposition                                          | integer | 6             |
| RSPAMD_ARC_ENABLE                 | enable ARC scanning                                                           | boolean | false         |
| RSPAMD_CLAM_HOST                  | clamd host name                                                               | string  | false         |
| RSPAMD_DKIM_SIGNING_ENABLE        | enable DKIM signing                                                           | boolean | false         |
| RSPAMD_GREYLIST_ENABLE            | enable greylist                                                               | boolean | false         |
| RSPAMD_IP_REPUTATION_HAM_WEIGHT   | ip ham weight                                                                 | double  | 1.0           |
| RSPAMD_IP_REPUTATION_SPAM_WEIGHT  | ip spam weight                                                                | double  | 4.0           |
| RSPAMD_SPF_REPUTATION_HAM_WEIGHT  | spf ham weight                                                                | double  | 1.0           |
| RSPAMD_SPF_REPUTATION_SPAM_WEIGHT | spf spam weight                                                               | double  | 2.0           |
| RSPAMD_LOG_LEVEL                  | rspamd log level [options](https://rspamd.com/doc/configuration/logging.html) | string  | info          |
| RSPAMD_MX_CHECK_ENABLE            | enable MX check                                                               | boolean | true          |
| RSPAMD_MX_CHECK_TIMEOUT           | MX check timeout (seconds)                                                    | integer | 10            |
| RSPAMD_NEURAL_ENABLE              | enable neural learning                                                        | boolean | false         |
| RSPAMD_DNS_NAMESERVER             | DNS nameserver for rspamd to use for all DNS lookups                          | string  | localhost     |
| RSPAMD_PENPHISH_ENABLE            | enable penphish scanning                                                      | boolean | true          |
| RSPAMD_PHISHTANK_ENABLE           | enable phishtank scanning                                                     | boolean | true          |
| RSPAMD_RBL_ENABLE                 | enable RBL checks                                                             | boolean | false         |
| RSPAMD_REDIS_SERVERS              | a comma-separated list of redis servers names                                 | string  | redis         |
| RSPAMD_REDIS_PASSWORD             | redis password                                                                | string  | n/a (unset)   |
| RSPAMD_REDIS_DB                   | redis db                                                                      | integer | 0             |
| RSPAMD_SURBL_ENABLE               | enable SURBL checks                                                           | boolean | true          |
| RSPAMD_WEBUI_SECURE_IP            | trusted ip range for WebUI access (auth not required)                         | string  | 127.0.0.1/32  |
| RSPAMD_WEBUI_PASSWORD             | password for WebUI access                                                     | string  | n/a (unset)   |
| RSPAMD_RBL_ENABLE                 | enable RBL checks                                                             | boolean | false         |

##

![alt text](https://i1.wp.com/mailprotector.com/wp-content/uploads/2020/03/cropped-logo-2x.png)

[About Mailprotector](https://mailprotector.com/about-mailprotector)