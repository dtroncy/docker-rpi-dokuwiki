ARG UID=100
ARG GID=101

FROM dtroncy/rpi-php7:7.3.21-r0

ARG UID
ARG GID
ARG dokuwiki_version

LABEL maintainer="dtroncy"

RUN apk update \
    && apk upgrade \
    && apk --no-cache add shadow \
    && groupmod -g $GID apache \
    && usermod -u $UID apache \ 
    && wget -P /tmp --no-check-certificate https://github.com/splitbrain/dokuwiki/archive/release_stable_$dokuwiki_version.tar.gz \
    && mkdir /var/www/dokuwiki \
    && tar -xvzf /tmp/release_stable_$dokuwiki_version.tar.gz -C /var/www/dokuwiki \
    && rm -rf /tmp/release_stable_$dokuwiki_version.tar.gz \
    && mv /var/www/dokuwiki/dokuwiki-release_stable_$dokuwiki_version/* /var/www/dokuwiki \
    && rm -rf /var/www/dokuwiki/dokuwiki-release_stable_$dokuwiki_version \
    && apk add php7-xml \
    && apk add php7-session \
    && apk add php7-json \
    && apk add php7-openssl \
    && chown -R apache:apache /var/www/dokuwiki/* \
    && rm -rf /var/cache/apk/*

# Add vhost conf to block access to data|conf|bin|inc folders
COPY vhost.conf /etc/apache2/conf.d