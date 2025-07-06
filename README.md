<p align="center"><img src="containerdesk.svg" height="128" alt=""></p>
<h1 align="center">containerdesk</h1>
<p align="center">VNC server, in a Docker container</p>

I needed a VNC server to connect to, but I didn't want to deal with VMs, or
allowing remote desktop access with a horribly outdated protocol that should
never, ever be used outside of localhost and SSH tunnelling.

I made this for [ServerRemote] development. You're more than welcome to take
this and run do whatever.

[ServerRemote]: https://github.com/itisrazza/ServerRemote

This is definitely, 100% **not** production grade and is likely a
massive security hole on its own. The desktop session is run as root and
depending on how Docker is set up, [can get full privileged access to your
machine][attack]. **USE AT YOUR OWN RISK.**

[attack]: https://docs.docker.com/engine/security/#docker-daemon-attack-surface

## Build it

```bash
docker build . --tag containerdesk
```

## Run it

```bash
docker run --rm -it -p 5901:5901 containerdesk
```

The above will create the container and remove it once it dies. You need `-it`
to be able to set the password.

If you want to persist state, you can remove `--rm`, or even bind the root
home folder (`/root`).

The container will die on its own when the user logs out from within the VNC
session.
