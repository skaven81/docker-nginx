Typical usage
=============

```
docker run --restart=unless-stopped --rm --name nginx \
           -v <letsencrypt data>:/etc/letsencrypt \
           -v <web content>:/usr/share/nginx/html:ro \
           -p 80:80 -p 443:443 \
           skaven/nginx:<tag>
```

Starting from scratch
=====================

Create a directory where you'll store LetsEncrypt stuff.
Then run the container on the web server but don't start nginx:

```
docker run -it --rm --name nginx \
           -v <letsencrypt data>:/etc/letsencrypt \
           -v <web content>:/usr/share/nginx/html:ro \
           -p 80:80 -p 443:443 \
           skaven/nginx:<tag>
           /bin/bash
```

Start nginx

```
# nginx
```

Then run `certbot` to create a certificate

```
# certbot certonly
```

The certificate(s) will be installed into /etc/letsencrypt, which
is a persistent volume or bind mount.

Now exit out of the container and edit the `default.conf` to
refer to the cert(s) just created, then fire the server back up.

