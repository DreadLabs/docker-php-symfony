FROM dreadlabs/php-symfony:7.3-base

ENV COMPOSER_VERSION=1.8.4 \
    COMPOSER_INSTALL_DIR=/usr/local/bin \
    COMPOSER_FILENAME=composer \
    COMPOSER_CACHE_DIR=/var/cache/composer

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install -y git php7.3-zip php-xdebug unzip \
    && rm -rf /var/lib/apt/lists/*

ADD rootfs /

RUN /usr/local/bin/install-composer.sh \
    && rm /usr/local/bin/install-composer.sh \
    && /usr/local/bin/install-symfony-installer.sh \
    && rm /usr/local/bin/install-symfony-installer.sh

CMD ["composer", "--version"]
