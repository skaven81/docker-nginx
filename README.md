Typical usage

```
docker run -it --rm --name nginx \
           -v <letsencrypt data>:/etc/letsencrypt \
           -v <web content>:/usr/share/nginx/html:ro \
           -p 80:80 -p 443:443 \
           skaven/nginx:<tag>
```
