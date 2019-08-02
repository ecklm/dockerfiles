# Docker image for TURN server

The essence of this image is that it does nothing more than runs a turn-server
with the configuration that is either mounted into the
`/etc/coturn/turnserver.conf` or given via command line parameters.

This means that there is total freedom regarding the configuration, but at the
same time, docker cannot really help, every parameter should be provided
manually in both the config file and the running arguments.

## Run the container

```
docker run ecklm/coturn-simple
```

Every parameter provided after the container's name will be given to the
turnserver command directly.
