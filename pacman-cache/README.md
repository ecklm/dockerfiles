# Pacman cache in docker

This repo stores a proxy to cache ArchLinux packages.
Running it is easy, just run `docker run -it -p 3128:3128 ecklm/pacman-cache`
to see it working live.

Once you have your server running, make your system use it as a proxy. You can
either use the `http_proxy` environment variable or add the following option to
your `/etc/pacman.conf` file.
```
[options]
XferCommand = /usr/bin/curl --proxy http://your-servers-ip:3128 -L --progress-bar --write-out "%{stderr}%{url_effective} %{size_download} HTTP/%{http_version} %{response_code}\n" -C - -f -o %o %u
```

## Missing features

- HTTPS is not supported at the moment. It will work, but it won't cached.
- The output of pacman will be much less readable this way.
