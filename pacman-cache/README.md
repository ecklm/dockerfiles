# Pacman cache in docker

This repo stores the building blocks of a pacman cache server.
Running it is easy, just run `docker run -it -p 80:80 ecklm/pacman-cache`
to see it working live.

Once you have your server running, add it to the mirrorlist.
```
Server = http://yourdomain.com/$repo/os/$arch
```

## Adding mirrors

You can specify which mirrors to use if you overwrite (either by copying
or mounting) the config file under `/etc/nginx/mirrors.conf` with something
like this:

```nginx
upstream mirrors {
	server mirror1.com;
	server mirror2.com;
	server mirror3.com backup;
}
```

To find the most optimal mirrors to location, I recommend you to run
`docker run -it ecklm/pacman-rankmirrors -p http -v 4` which will (after a long
time) print you the top servers in the order of download speed. For more info,
see [the relevant docker registry entry](https://hub.docker.com/r/ecklm/pacman-rankmirrors).

**Note 1:** The current configuration only works with mirrors responsive to
requests of the following format `/archlinux/$repo/os/$arch`.

**Note 2:** Unfortunately, the current solution only works with mirrors accepting *HTTP* connections
and -- as far as I understood -- requests without a specific hostname.
