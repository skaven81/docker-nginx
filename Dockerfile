FROM nginx:1.14
ENV DEBIAN_FRONTEND=noninteractive LANG=en_US.UTF-8 LC_ALL=C.UTF-8 LANGUAGE=en_US.UTF-8
RUN echo deb http://deb.debian.org/debian stretch-backports main >> /etc/apt/sources.list
RUN apt-get -q update && \
    apt-get -qy install python-certbot-nginx -t stretch-backports && \
    apt-get clean && \
    rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY default.conf /etc/nginx/conf.d/default.conf
ADD run.sh /
CMD /run.sh
