# Deploy Odoo 10, Odoo 14, And PgAdmin 4 with ease

## 1. Make Docker Run Without Sudo

### Add the `docker` group if it doesn't already exist

```console
sudo groupadd docker
```

### Add the connected user `$USER` to the docker group

Optionally change the username to match your preferred user.

```console
sudo gpasswd -a $USER docker
```

**IMPORTANT**: Log out and log back in so that your group membership is re-evaluated.

### Restart the `docker` daemon

```console
sudo service docker restart
```

If you are on Ubuntu 14.04-15.10, use `docker.io` instead:

```console
sudo service docker.io restart
```

## 2. Run 'run_me.sh'

Open terminal inside the folder

```console
sudo sh run_me.sh
```
