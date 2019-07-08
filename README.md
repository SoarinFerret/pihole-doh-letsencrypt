# Pi-Hole w/ Lets Encrypt and DNS over HTTPS using Docker-Compose

In the name of science and security, this project builds off this popular [article](https://visibilityspots.org/dockerized-cloudflared-pi-hole.html) for setting up Pi-Hole to use DNS over HTTPS. I have added changes to allow the admin interface to run over HTTPS with a Lets Encrypt cert, utilizing docker volumes for persistent storage, and other minor changes.

## Setup & Installation

### 0. Prerequistes

The following items must be met:

* Install Git, Docker & Docker-Compose
* A Let's Encrypt Compatibale DNS provider

### 1. Clone the Repo

```bash
git clone https://github.com/SoarinFerret/pihole-doh-letsencrypt.git
cd pihole-doh-letsencrypt
```

### 2. Copy and Edit the necessary files

Any file with a .default name will need to be renamed and modified. The files you will create are:

* `.env`
* `external.conf`
* `le-domains.conf`

#### 2.1 .env

* `PIHOLE_TAG` is the tag to be used for the pihole docker container. See available list [here](https://hub.docker.com/r/pihole/pihole/tags).
* `LE_TAG` is the tag to be used by the lets-encrypt container. See availble list [here](https://hub.docker.com/r/adferrand/letsencrypt-dns/tags).
* `ADMIN_PASSWORD` is the admin password to be used by Pi-Hole. `random` will produce a random output that can be found in the docker-compose logs.
* `IP_ADDR` is the IP address of your server. Because ubuntu uses systemd-resolvd, localhost:53 is in use by the OS. By defining the IP, we get around this limitation.
* `EMAIL` is the email to receive notification from Lets Encrypt.
* `CF_USER` is your CloudFlare username. This will need to be changed if not using Cloudflare.
* `CF_TOKEN` is your Cloudflare API token. This will need to be changed if not using Cloudflare.
* `LE_STAGING` defines whether or not to use the LE staging. This is useful for testing functionality.

#### 2.2 external.conf

Simply change the first line from `pihole.example.com` to whatever the URL you will be using to access the server.

#### 2.3 le-domains.conf

Simply change the first line from `pihole.example.com` to whatever the URL you will be using to access the server.

## Reference Links:

Special thanks to [Jan Collijs](https://visibilityspots.org/dockerized-cloudflared-pi-hole.html) for providing the cloudflared image and for my initial `docker-compose.yml` file.

* [Lets Encrypt DNS container](https://github.com/adferrand/docker-letsencrypt-dns)
* [cloudflared Container](https://github.com/visibilityspots/dockerfile-cloudflared)
* [Pi-Hole Lets Encrypt Setup](https://discourse.pi-hole.net/t/enabling-https-for-your-pi-hole-web-interface/5771)
