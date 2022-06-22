# firefox-in-docker

Run firefox in a docker container and forward over http using xpra.

Motivation: During trainings participants are often on a corporate network, and cannot access some IP addresses and ports.
We can work around this by giving them a browser running a remote server, that they can connect to, and then connect to the blocked IPs and ports from the remote browser.

This is implemented by using `XPra` to run firefox in a docker container, and forward the firefox session over http to a client browser.

This could also be used for running other applications we need to run on remote machines.

## Proof-of-Concept implementation

Build and run with docker-compose:

```sh
docker-compose up -d --build
```

Server will be running on `http://localhost:80` where you can connect to the firefox instance running in the container.
