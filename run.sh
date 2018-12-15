#!/bin/bash

PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

set -x

# Start the certbot renewal in a daily loop
/bin/bash -c 'while true; do sleep 86400; certbot renew; done' &

# Start nginx
exec /usr/sbin/nginx -g "daemon off;"

