FROM dtroncy/rpi-php7:7.2.10-r0

ARG dokuwiki_version

LABEL maintainer="dtroncy"

RUN apk update \
    && apk upgrade \
    && wget -P /tmp --no-check-certificate https://github.com/splitbrain/dokuwiki/archive/release_stable_$dokuwiki_version.tar.gz \
    && mkdir /var/www/dokuwiki \
    && tar -xvzf /tmp/release_stable_$dokuwiki_version.tar.gz -C /var/www/dokuwiki \
    && rm -rf /tmp/release_stable_$dokuwiki_version.tar.gz \
    && mv /var/www/dokuwiki/dokuwiki-release_stable_$dokuwiki_version/* /var/www/dokuwiki \
    && rm -rf /var/www/dokuwiki/dokuwiki-release_stable_$dokuwiki_version \
    && apk add php-xml \
    && apk add php-session \
    && apk add php-json \
    && apk add php-ssl \
    && chown -R apache:apache /var/www/dokuwiki/* \
    && rm -rf /var/cache/apk/*

# Add vhost conf to block access to data|conf|bin|inc folders
COPY vhost.conf /etc/apache2/conf.d